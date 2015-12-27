## ---- plot02 ----
plot02 <- function(predictors) {

  library(plyr)
  # We remove am since we will be using it for facets
  term.names <- grep( "am", predictors, invert = TRUE, value = TRUE)
  message (term.names)
  plot.list <- list()
  
  for (i in 1:length(term.names)) {
    c.plot <- ggplot(data = mtcars, aes_string(x = predictors[i],y = "mpg")) + geom_point()
    c.plot <- c.plot + geom_smooth(method='lm') + facet_grid(. ~am)
    plot.list[[i]] <- c.plot
  }
  
  do.call(grid.arrange,c(plot.list,ncol = 1))
  
}