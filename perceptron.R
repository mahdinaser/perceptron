 
#' @export

perceptron <- function(x, y, learingRate, niter) {
  
  # initialize weight vector
  weight <- rep(0, dim(x)[2] + 1)
  errors <- rep(0, niter)
  
  
  # loop over number of epochs niter
  # I can change this to an infinite loop
  for (jj in 1:niter) {
    
    # loop through training data set
    for (ii in 1:length(y)) {
      
      # Predict binary label using step function
      # function
      z <- sum(weight[2:length(weight)] * as.numeric(x[ii, ])) + weight[1]
      if(z < 0) {
        ypred <- 0
      } else {
        ypred <- 1
      }
      
      # Change weight - the formula doesn't do anything 
      # if the predicted value is correct
      # delta weight = learning rate ?? delta  ?? xtrain
      
      delta <- (y[ii] - ypred);
      weightdiff <- learingRate * delta * c(1, as.numeric(x[ii, ]))
      weight <- weight + weightdiff
      
      # Update error function
      if ((y[ii] - ypred) != 0.0) {
        errors[jj] <- errors[jj] + 1
      }
      
    }
  }
  
  # weight to decide between the two species 
  print(weight)
  return(errors)
}

# use IRIS data as the data sample
data(iris)

# Use two factors as X1 and X2. Sepal and Petal are X1 and X2
# Use the first 100 records
irissubdf <- iris[1:100, c(1, 3, 5)]
names(irissubdf) <- c("sepal", "petal", "species")

# Assign a new column V4 represent the Y. 
# Based on the value of species (setosa,versicolor) assigns 0 or 1
irissubdf[, 4] <- 1
irissubdf[irissubdf[, 3] == "setosa", 4] <- 0

x <- irissubdf[, c(1, 2)]
y <- irissubdf[, 4]

# pass the arrgument with maximum number of 10 iteration and learing rate of 1
# to perceprton function. It returns the err vector
err <- perceptron(x, y, 1, 10)
