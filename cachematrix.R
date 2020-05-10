## Put comments here that give an overall description of what your
## functions do
library(matlib)
## Write a short comment describing this function
# follow the example for mean and change the mean() to inv() in the environment of matlib
makeCacheMatrix <- function(x = matrix()) {
  
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinv <- function(inv) m <<- inv
  getinv <- function() m
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}

## Write a short comment describing this function
# follow the example for mean and change the mean() to inv() in the environment of matlib
cacheSolve <- function(x, ...) {
  m <- x$getinv()
  if(!is.null(m)) {
    message("getting cached data (inverse matrix)")
    return(m)
  }
  data <- x$get()
  m <- inv(data, ...)
  x$setinv(m)
  m
}