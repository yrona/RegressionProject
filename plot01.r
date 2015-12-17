## ---- plot01 ----
plot01 <- function(predictors) {
  library(gridExtra)
  library(ggplot2)

  
  plot.list <- list()

  for (i in 1:length(predictors)) {
    c.plot <- ggplot(data = mtcars, aes_string(x = predictors[i],y = "mpg")) + geom_point()
    c.plot <- c.plot + geom_smooth(method='lm')
    plot.list[[i]] <- c.plot
  }
  
  do.call(grid.arrange,c(plot.list,ncol = 3))
  #grid.arrange(plot.list,ncol=4)
}