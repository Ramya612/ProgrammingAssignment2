## The aim of this program is to cache potentially time consuming computations involved in Matrix Inverse calculation.
## If the contents of matices are same then it makes sense to cache the inverse matrix rather than recomputing the value all over again.
## Below two functions are aimed to cache the inverse of the matrix.
## <<- operator is used to assign the value to an object in an environment that is different from the current environment. 
## We use the free floating variable to cache the matrix value.


## The below function creates a list containing a functio to:
## set the value of the Matix 
## get the value of the Matrix
## set the value of the Inverse of the Matrix
## get the value of the Inverse of the Matrix


makeCacheMatrix <- function(x = matrix()) {
           m <- NULL
           set <- function(y) {
               x <<- y
               m <<- NULL
           }
  get <- function() x
  setmatrixinverse <- function(solve) m <<- solve
  getmatrixinverse <- function() m
  list(set = set, get = get,
       setmatrixinverse = setmatrixinverse,
       getmatrixinverse = getmatrixinverse)
  
}


## The following function calculates the Inverse of the Matrix created with the above function.
## However, it first checks to see if the Inverse of the matix is already calculated. 
## If so, it gets the Inverse Matrix from the cache and skips the computation. 
## Otherwise, it computes Inverse of the Matrix and sets the value in the cache via the setmatrixinverse function.
## Matrix computation is done using the in built R function "solve"


cacheSolve <- function(x, ...) {

  m <- x$getmatrixinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setmatrixinverse(m)
  m
  
}