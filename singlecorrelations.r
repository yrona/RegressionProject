## ---- singlecorrelations ----
singlecorrelations <- function() {
  library(plyr)
  # We list the variables that will be the predictors in our model
  term.names <- grep( "mpg", names(mtcars), invert = TRUE, value = TRUE)
  
  #We will store the data frame that will be returned in lm.result.frame
  lm.result.frame <- NULL
  
  for (i in 1:length(term.names)) {
    #Perform linear regression on current predictor
    c.result <- lm(mtcars[,"mpg"] ~ mtcars[,term.names[i]])
    #Extract values to be stored in data frame 
    c.frame <- data.frame(Pred = term.names[i], 
                          Slope = summary(c.result)$coefficients[2,1],
                          Intcpt = summary(c.result)$coefficients[1,1],
                          RSq = summary(c.result)$r.squared )
    #Append to data frame
    lm.result.frame = rbind(lm.result.frame,c.frame)
  }
  #Sort in descending order of R Squared
  arrange(lm.result.frame,desc(RSq))
}