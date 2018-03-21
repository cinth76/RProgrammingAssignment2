## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    ## x is initialized as a function agrgument, with a default value (empty numeric vector)
    ## sets de 'inverse' to NULL as a placeholder for a future value
    set <- function(y){
    x <<- y
    inv <<- NULL
    }
    ## set function, assigns the infput argument to x in the PARENT ENV.
    ## and assigns NULL to m to clear previous vlues
  get <- function() x ## getter for x
  setInverse <- function(solveMatrix) inv <<- solveMatrix ## setter for the inverse
  getInverse <- function() inv ## getter for the inverse
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
  ## creates the list that will be the input for cachesolve.r

}


## this function takes the makeCacheMatrix as input, and returns the inverse of the matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setInverse(inv)
  inv 
}
