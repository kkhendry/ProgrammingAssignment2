## These functions are used to efficiently calculate or retrieve the inverse ofa matrix. If the inverse
## has already been calculated, cacheSolve retreives it from MakeCacheMatrix which returns a special matrix.
## If it hasn't already been calculated, cacheSolve calculates it.

## makeCacheMatrix creates a special matrix that caches the inverse of matrix x if it has already been calculated.

makeCacheMatrix <- function(x = matrix()) {
  invm <- NULL
  get <- function() x
  setinv <- function(inver) invm <<- inver
  getinv <- function() invm
  list(get = get, setinv = setinv, getinv = getinv)
}


## cacheSolve either retrieves the cached inverse of x if it has already been solved, or it computes the inverse
## of x itself.

cacheSolve <- function(x, ...) {
  invm <- x$getinv()
  if(!is.null(invm)) {
    message("getting cached data")
    return(m)
  }
  mat <- x$get()
  invm <- solve(mat, ...)
  x$setinv(invm)
}
