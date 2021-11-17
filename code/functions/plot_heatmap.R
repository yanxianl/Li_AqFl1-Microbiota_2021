###############################################################################
# MaAsLin2 visualizations

# Copyright (c) 2018 Harvard School of Public Health

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
###############################################################################

# Author: Yanxian Li
# Email: yanxianl@nmbu.no
# This script modifies the function from MaAsLin2 to allow for customization of heatmap.

# Load libararies
for (lib in c("tidyverse", "circlize", "ComplexHeatmap")) {
  suppressPackageStartupMessages(require(lib, character.only = TRUE))
}

# Define the function
plot_heatmap <- function(
  maaslin2_output,
  qval_cutoff = 0.25,
  first_n = 50,
  cell_value = "qval",
  data_label = "data",
  metadata_label = "metadata",
  plot_title = TRUE,
  legend_title = TRUE,
  legend_title_position = "topleft",
  legend_direction = "vertical",
  color = c("blue", "grey90", "red"),
  board_line_col = "gray96",
  colnames_rotate = 90,
  colnames_fontsize = 12,
  rownames_fontsize = 10,
  italize_rownames = TRUE) {
  
  df <- maaslin2_output
    
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
  
  if (plot_title == TRUE & title_additional != ""){
    plot_title <- paste(title_additional, "features with significant associations")
  } else {
    plot_title <- ""
  }
  
  metadata <- df$metadata
  data <- df$feature
  value <- NA
  
  if (legend_title == FALSE) {legend_title <- " "}
  
  # values to use for coloring the heatmap
  # and set the colorbar boundaries
  if (cell_value == "pval") {
    value <- -log(df$pval) * sign(df$coef)
    value <- pmax(-20, pmin(20, value))
    if (legend_title == TRUE)
      legend_title <- "-log(pval)*sign(coeff)"
  } else if (cell_value == "qval") {
    value <- -log(df$qval) * sign(df$coef)
    value <- pmax(-20, pmin(20, value))
    if (legend_title == TRUE)
      legend_title <- "-log(qval)*sign(coeff)"
  } else if (cell_value == "coef") {
    value <- df$coef
    if (legend_title == TRUE)
      legend_title <- "coeff"
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
  
  mat_hm <- rownames_to_column(mat, "feature") %>%
    gather(metadata, value, -feature) %>%
    mutate(uniq_id = paste0(feature, "_", metadata)) %>%
    inner_join(qval, by = "uniq_id") %>%
    mutate(value = ifelse(qval > qval_cutoff, 0, value)) %>%
    select(-uniq_id, -qval) %>%
    mutate(metadata = factor(metadata, levels = levels(df$metadata))) %>%
    spread(key = "metadata", value = "value") %>%
    column_to_rownames("feature") %>%
    as.matrix()
  
  mark <- rownames_to_column(mat, "feature") %>%
    gather(metadata, value, -feature) %>%
    mutate(uniq_id = paste0(feature, "_", metadata)) %>%
    inner_join(qval, by = "uniq_id") %>%
    mutate(
      mark = ifelse(
        qval > qval_cutoff, 
        "", 
        ifelse(
          value > 0, 
          "+", 
          ifelse(
            value < 0, 
            "-", 
            "")
          )
        )
      ) %>%
    select(-uniq_id, -value, -qval) %>%
    mutate(metadata = factor(metadata, levels = levels(df$metadata))) %>%
    spread(key = "metadata", value = "mark") %>%
    column_to_rownames("feature") %>%
    as.matrix()
  
  # get the range for the colorbar
  max_value <- ceiling(max(mat_hm))
  min_value <- ceiling(min(mat_hm))
  range_value <- max(c(abs(max_value),abs(min_value)))
  breaks <- seq(-1*range_value, range_value, by = 1)
  color <- colorRamp2(c(-range_value, 0, range_value), color)
  
  # italize taxonomic labels
  if (italize_rownames == TRUE){
    expr <- enframe(rownames(mat_hm), name = NULL) %>%
      # convert rownames to expressions
      mutate(
        row_label = paste0("italic(", value, ")"), # italize all taxonomic ranks
        # italize genus/species names only
        #row_label = ifelse(grepl("__", value), 
        #paste0("plain(", value, ")"), 
        #paste0("italic(", value, ")")),
        # tilde (~) gets handled as a "space" in R expressions
        row_label = gsub("\\s+", "~", row_label)) 
    
    row_label <- parse(text = expr$row_label) 
  } else {
    row_label <- rownames(mat_hm)
  }
  
  # plot heatmap
  p <- Heatmap(
    mat_hm, 
    name = legend_title, 
    cluster_columns = FALSE,
    #clustering_distance_columns = "euclidean",
    #clustering_method_columns = "complete",
    #show_column_dend = FALSE,
    column_title = plot_title,
    column_title_side = "top",
    column_names_gp = gpar(fontsize = colnames_fontsize, fontface = "bold"),
    column_names_rot = colnames_rotate,
    column_names_centered = FALSE,
    cluster_rows = FALSE,
    row_labels = row_label,
    row_names_side = "right",
    row_names_gp = gpar(fontsize = rownames_fontsize),
    row_names_max_width = max_text_width(
      rownames(mat_hm), 
      gp = gpar(fontsize = rownames_fontsize)
      ),
    rect_gp = gpar(col = board_line_col, lty = 1, lwd = 0.2), 
    col = color,
    heatmap_legend_param = list(
      legend_height = unit(4, "cm"),
      title_position = legend_title_position,
      legend_direction = legend_direction
      ),
    cell_fun = function(j, i, x, y, width, height, fill) {
      grid.text(mark[i, j], x, y, gp = gpar(col = "white", fontsize = 12, fontface = "bold"))
      }
  ) 
  return(p)
}