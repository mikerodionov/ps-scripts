# makeCacheMatrix()
# This function creates a special "matrix" object that can cache its inverse.

# In order to make solve function work your matrix should be invertible (aka nonsingular or nondegenerate)
# For details on this concept: 
# https://www.khanacademy.org/math/precalculus/precalc-matrices/inverting_matrices/v/singular-matrices

# Computing the inverse of a square matrix can be done with the solve function in R. 
# For example, if X is a square invertible matrix, then solve(X) returns its inverse.
# For this assignment, assume that the matrix supplied is always invertible.

#Usage example:
# x <- matrix(1:4, 2, 2)    // create a matrix x
# m <- makeCacheMatrix(x)   // create "special" matrix m
# m$get()                   // return matrix m

makeCacheMatrix <- function(x = matrix()) {	
  # m will store cached inverse matrix
  m <- NULL
  # Setting value for matrix
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  # Getting value for matrix
  get <- function() x
  # Setting inverse value
  setinverse <- function(inverse) m <<- inverse
  # Getting invers value
  getinverse <- function() m
  # Return matrix with defined functions
  list(set = set, 
       get = get, 
       setinverse = setinverse,
       getinverse = getinverse)
}

# cacheSolve()
# This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
# If the inverse has already been calculated (and the matrix has not changed), 
# then the cachesolve should retrieve the inverse from the cache.

# Usage example:
# cacheSolve(m)                            // Return the inverse
# cacheSolve(m)                            // Call the 2nd time, so return
#                                          // the cached inverse

cacheSolve <- function(x) {
  # Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  # Checking if inverse already was calculated and return it in case it was
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  # In case inverse was not calculated, calculating and return
  data <- x$get()
  m <- solve(data)
  # Caching the inverse
  x$setinverse(m)
  # Returning inverse
  m
}