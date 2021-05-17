###############################################################################
# plot_prevalence

# Copyright (c) 2021 Yanxian Li

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

# load libararies
for (lib in c("tidyverse", "rlang", "RColorBrewer")) {
  suppressPackageStartupMessages(require(lib, character.only = TRUE))
}

# define the function
plot_prevalence <- function(
  data,
  x, 
  y,
  bar_color,
  facet_wrap,
  facet_nrow = 1,
  scale_facet = "free_x",
  xlab = NULL, 
  ylab = NULL, 
  title = NULL) {

#------------------ variable names ---------------------------------------------
# ensure the arguments work quoted or unquoted
x <- ensym(x)
y <- ensym(y)
facet_wrap <- ensym(facet_wrap)
bar_color <- ensym(bar_color)

# if `xlab` and `ylab` is not provided, use the variable `x` and `y` name
if(is.null(xlab)){xlab <- as_name(x)}
if(is.null(ylab)){ylab <- as_name(y)}

#------------------ no faceting ------------------------------------------------
if(missing(facet_wrap)){
  # vanilla barplot
  p <- ggplot(data, aes(x = {{x}}, y = {{y}})) +
    geom_bar(stat = "identity", position = position_dodge()) +
    scale_y_continuous(
      limits = c(0, NA), 
      expand = expansion(mult = c(0, 0.1))
      ) + 
    labs(title = title, x = xlab, y = ylab) +
    theme_bw() +
    theme(
      axis.text.x = element_text(angle = 45, hjust = 1),
      legend.position = "none")
  
  # color bars
  if(as_name(bar_color) %in% colnames(data) == TRUE){
    p <- ggplot(data, aes(x = {{x}}, y = {{y}}, fill = {{bar_color}})) +
      geom_bar(stat = "identity", position = position_dodge()) +
      scale_y_continuous(
        limits = c(0, NA), 
        expand = expansion(mult = c(0, 0.1))
        ) + 
      labs(title = title, x = xlab, y = ylab) +
      theme_bw() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
    if(is.numeric(data[[bar_color]]) == TRUE){
      p <- p + scale_fill_gradient2(
        low = "blue", mid = "white", high = "red", 
        midpoint = mean(data[[bar_color]], na.rm = TRUE)) 
    } else {
      ncolor <- ifelse(
        is.factor(data[[bar_color]]), 
        nlevels(data[[bar_color]]), 
        n_distinct(data[[bar_color]])
        )
      if(ncolor <= 9){
        p <- p + scale_fill_brewer(palette = "Set1", drop = FALSE) +
          guides(fill = guide_legend(nrow = 1)) +
          theme(legend.position = "bottom")
      } else {
        getPalette <- colorRampPalette(brewer.pal(9, "Set1"))
        colors <- getPalette(ncolor)
        p <- p + scale_fill_manual(values = colors, drop = FALSE) +
          guides(fill = guide_legend(nrow = 1)) +
          theme(legend.position = "bottom")
      }
    }
  } else {
    p <- ggplot(data, aes(x = {{x}}, y = {{y}})) +
      geom_bar(
        stat = "identity", 
        position = position_dodge(), 
        fill = as_name(bar_color)
        ) +
      scale_y_continuous(
        limits = c(0, NA), 
        expand = expansion(mult = c(0, 0.1))
        ) + 
      labs(title = title, x = xlab, y = ylab) +
      theme_bw() +
      theme(
        axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = "none")
  }
}  

#------------------ with faceting ----------------------------------------------
if(!missing(facet_wrap)){
  
  if(!as_name(facet_wrap) %in% colnames(data) == TRUE){
    stop(paste("The faceting variable", facet_wrap, "not found."))
  } 
  
  # vanilla faceted barplot
  p <- ggplot(data, aes(x = {{x}}, y = {{y}})) +
    geom_bar(stat = "identity", position = position_dodge()) +
    scale_y_continuous(
      limits = c(0, NA), 
      expand = expansion(mult = c(0, 0.1))
      ) + 
    labs(title = title, x = xlab, y = ylab) +
    facet_wrap(vars({{facet_wrap}}), nrow = facet_nrow, scales = scale_facet) +
    theme_bw() +
    theme(
      axis.text.x = element_text(angle = 45, hjust = 1),
      legend.position = "none")
  
  # color bars
  if(as_name(bar_color) %in% colnames(data) == TRUE){
    p <- ggplot(data, aes(x = {{x}}, y = {{y}}, fill = {{bar_color}})) +
      geom_bar(stat = "identity", position = position_dodge()) +
      scale_y_continuous(
        limits = c(0, NA), 
        expand = expansion(mult = c(0, 0.1))
        ) + 
      labs(title = title, x = xlab, y = ylab) +
      facet_wrap(vars({{facet_wrap}}), nrow = facet_nrow, scales = scale_facet) +
      theme_bw() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
    
    if(is.numeric(data[[bar_color]]) == TRUE){
      p <- p + scale_fill_gradient2(
        low = "blue", mid = "white", high = "red", 
        midpoint = mean(data[[bar_color]], na.rm = TRUE)) 
    } else {
      ncolor <- ifelse(
        is.factor(data[[bar_color]]), 
        nlevels(data[[bar_color]]), 
        n_distinct(data[[bar_color]]))
      if(ncolor <= 9){
        p <- p + scale_fill_brewer(palette = "Set1", drop = FALSE) +
          guides(fill = guide_legend(nrow = 1)) +
          theme(legend.position = "bottom")
      } else {
        getPalette <- colorRampPalette(brewer.pal(9, "Set1"))
        colors <- getPalette(ncolor)
        p <- p + scale_fill_manual(values = colors, drop = FALSE) +
          guides(fill = guide_legend(nrow = 1)) +
          theme(legend.position = "bottom")
      }
    }
  } else {
    p <- ggplot(data, aes(x = {{x}}, y = {{y}})) +
      geom_bar(
        stat = "identity", 
        position = position_dodge(), 
        fill = as_name(bar_color)) +
      scale_y_continuous(
        limits = c(0, NA), 
        expand = expansion(mult = c(0, 0.1))
        ) + 
      labs(title = title, x = xlab, y = ylab) +
      facet_wrap(vars({{facet_wrap}}), nrow = facet_nrow, scales = scale_facet) +
      theme_bw() +
      theme(
        axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = "none")
  }
}

return(p)
}
      