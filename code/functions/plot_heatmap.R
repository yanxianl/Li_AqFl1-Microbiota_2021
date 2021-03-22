# Load libararies
for (lib in c("tidyverse", "grid", "circlize", "ComplexHeatmap")) {
  suppressPackageStartupMessages(require(lib, character.only = TRUE))
}

# Define the function
plot_heatmap <-
  function(
    output_results,
    first_n = 50,
    cell_value = "qval",
    data_label = "data",
    metadata_label = "metadata",
    title = TRUE,
    legend = TRUE,
    color = c("blue", "grey90", "red"),
    board_line_col = "gray96",
    colnames_rotate = 90,
    colnames_fontsize = 12,
    rownames_fontsize = 10,
    italize_rownames = TRUE) {
    
    # read maaslin output
    df <- read.table(
      output_results,
      header = TRUE,
      sep = "\t",
      fill = TRUE,
      comment.char = "" ,
      check.names = FALSE)
    
    title_additional <- ""
    
    if (!is.na(first_n) & first_n > 0 & first_n < dim(df)[1]) {
      if (cell_value == 'coef') {
        df <- df[order(-abs(df[cell_value])) , ]
      } else{
        df <- df[order(df[cell_value]), ]
      }
      # get the top n features with significant associations
      df_sub <- df[1:first_n,]
      for (first_n_index in seq(first_n, dim(df)[1]))
      {
        if (length(unique(df_sub$feature)) == first_n)
        {
          break
        }
        df_sub <- df[1:first_n_index,]
      }
      # get all rows that have the top N features
      df <- df[which(df$feature %in% df_sub$feature),]
      title_additional <- paste("Top", first_n, sep=" ")
    }
    
    if (dim(df)[1] < 2) {
      print('There are no associations to plot!')
      return(NULL)
    }
    
    if (title == TRUE & title_additional!=""){
      title <- paste(title_additional, "features with significant associations")
    } else {
      title <- ""
    }
    
    metadata <- df$metadata
    data <- df$feature
    value <- NA
    
    if (legend == FALSE) {legend <- ""}
    
    # values to use for coloring the heatmap
    # and set the colorbar boundaries
    if (cell_value == "pval") {
      value <- -log(df$pval) * sign(df$coef)
      value <- pmax(-20, pmin(20, value))
      if (legend == TRUE)
        legend <- "(-log(pval)*sign(coeff))"
    } else if (cell_value == "qval") {
      value <- -log(df$qval) * sign(df$coef)
      value <- pmax(-20, pmin(20, value))
      if (legend == TRUE)
        legend <- "(-log(qval)*sign(coeff))"
    } else if (cell_value == "coef") {
      value <- df$coef
      if (legend == TRUE)
        legend <- "coeff"
    }
    
    n <- length(unique(data))
    m <- length(unique(metadata))
    
    if (n < 2) {
      print(
        paste(
          "There is not enough features in the associations",
          "to create a heatmap plot.",
          "Please review the associations in text output file.")
      )
      return(NULL)
    }
    
    if (m < 1) {
      print(
        paste(
          "There is not enough metadata in the associations",
          "to create a heatmap plot.",
          "Please review the associations in text output file.")
      )
      return(NULL)
    }
    
    mat <- matrix(0, nrow = n, ncol = m)
    mat <- as.data.frame(mat)
    
    rownames(mat) <- unique(data)
    colnames(mat) <- unique(metadata)
    for (i in seq_len(dim(df)[1])) {
      if (abs(mat[as.character(data[i]), 
                  as.character(metadata[i])]) > abs(value[i]))
        next
      mat[as.character(data[i]), as.character(metadata[i])] <- value[i]
    }
    
    # Get marks(+/-) and colors for cells with significant associations
    qval <- select(df, metadata, feature, qval) %>%
      mutate(uniq_id = paste0(feature, "_", metadata)) %>%
      select(uniq_id, qval)
    
    mat1 <- rownames_to_column(mat, "feature") %>%
      gather(metadata, value, -feature) %>%
      mutate(uniq_id = paste0(feature, "_", metadata)) %>%
      inner_join(qval, by = "uniq_id") %>%
      mutate(value = ifelse(qval > 0.25, 0, value)) %>%
      select(-uniq_id, -qval) %>%
      mutate(metadata = factor(metadata, unique(.$metadata))) %>%
      spread(key = "metadata", value = "value") %>%
      column_to_rownames("feature") %>%
      as.matrix()
    
    mark <- rownames_to_column(mat, "feature") %>%
      gather(metadata, value, -feature) %>%
      mutate(uniq_id = paste0(feature, "_", metadata)) %>%
      inner_join(qval, by = "uniq_id") %>%
      mutate(mark = ifelse(qval > 0.25, "", ifelse(value > 0, "+", ifelse(value < 0, "-", "")))) %>%
      select(-uniq_id, -value, -qval) %>%
      mutate(metadata = factor(metadata, unique(.$metadata))) %>%
      spread(key = "metadata", value = "mark") %>%
      column_to_rownames("feature") %>%
      as.matrix()
    
    # get the range for the colorbar
    max_value <- ceiling(max(mat1))
    min_value <- ceiling(min(mat1))
    range_value <- max(c(abs(max_value),abs(min_value)))
    breaks <- seq(-1*range_value, range_value, by = 1)
    color <- colorRamp2(c(-range_value, 0, range_value), color)
    
    # use italic font for genus/species names
    if (italize_rownames == TRUE){
      expr <- enframe(rownames(mat1), name = NULL) %>%
        # convert rownames to expressions
        mutate(row_lab = ifelse(grepl("__", value), 
                                paste0("plain(", value, ")"), 
                                paste0("italic(", value, ")")),
               # tilde (~) gets handled as a "space" in R expressions
               row_lab = gsub("\\s+", "~", row_lab)) 
      
      row_lab <- parse(text = expr$row_lab) 
    } else {
      row_lab <- rownames(mat1)
    }
        
    # plot heatmap
    p <- Heatmap(mat1, 
                 name = legend, 
                 cluster_columns = FALSE,
                 #clustering_distance_columns = "euclidean",
                 #clustering_method_columns = "complete",
                 #show_column_dend = FALSE,
                 column_title = title,
                 column_title_side = "top",
                 column_names_gp = gpar(fontsize = colnames_fontsize, fontface = "bold"),
                 column_names_rot = colnames_rotate,
                 cluster_rows = FALSE,
                 row_names_gp = gpar(fontsize = rownames_fontsize),
                 row_names_side = "right",
                 row_labels = row_lab,
                 rect_gp = gpar(col = board_line_col, lty = 1, lwd = 0.2), 
                 col = color,
                 heatmap_legend_param = list(legend_height = unit(4, "cm"),
                                             title_position = "topcenter"),
                 cell_fun = function(j, i, x, y, width, height, fill) {
                   grid.text(mark[i, j], x, y, gp = gpar(fontsize = 10))
                 }
    ) 
    return(p)
  }
