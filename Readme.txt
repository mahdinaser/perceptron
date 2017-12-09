Perceptron Package

How to use the package?

perceptron(x, y, LearningRate, NumberOfEpoch)

X: is the input vector also known as independent variables 
Y: is the label or target
LearningRate
NumberOfEpoch: is the maxmimum number of itermation to run the weight. In this implementation I dont' use the unlimited loop
	       to get cover to the optimal value.


Example:


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
