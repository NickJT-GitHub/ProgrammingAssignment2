## Below are two functions that are used to create a specal object that stores a matrix
## and ache's its inverse

## makeCacheMatrix creates a special matrix which is really a list containing to a function to
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse
## 4. get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
    iv <- NULL
    set <- function(y) {
        x <<- y
        iv <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) iv <<- inverse
    getInverse <- function() iv
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## cacheSolve calculates the inverse of the matrix created with the above function

cacheSolve <- function(x, ...) {
    iv <- x$getInverse()
    if (!is.null(iv)) {
        message("getting cached data")
        return(iv)
    }
    data <- x$get()
    iv <- solve(data, ...)
    x$setInverse(iv)
    iv
}
