## ---- plot01 ----
plot01 <- function(predictors) {
  library(gridExtra)
  library(ggplot2)

  
  plot.list <- list()
  j <-1
  for (i in 1:length(predictors)) {
    if (predictors[i] != "am") {
      c.plot <- ggplot(data = mtcars, aes_string(x = predictors[i],y = "mpg")) + geom_point()
      c.plot <- c.plot + geom_smooth(method='lm') + facet_grid(. ~am)
      plot.list[[j]] <- c.plot
      j<-j+1
    }
  }
  
  do.call(grid.arrange,c(plot.list,ncol = 2))
  #grid.arrange(plot.list,ncol=4)
}