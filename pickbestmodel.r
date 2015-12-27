## ---- multipleregression ----
pick.best.model <- function() {
  model.allpredictors <- lm(mpg ~ ., data=mtcars)
  step(model.allpredictors, trace=0)
}