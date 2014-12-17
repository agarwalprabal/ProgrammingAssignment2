## This R code cache's the inverse of a matrix and if the inverse of the matrix
## is needed again, it will use the value saved in cache

## The funtion takes the matrix as an argument and stores it and it's inverse 
## (once calculated) into the cache

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setInverse <- function(inverse) inv <<- inverse
        getInverse <- function() inv
        list(set = set, get = get,
             setInverse = setInverse,
             getinverse = getInverse)
}


## This function takes the cached object as an argument and checks if inverse
## is already saved or not, and calculates the inverse accordingly

## solve function has been used to calculate the inverse of a matrix

cacheSolve <- function(x, ...) {
        inv <- x$getInverse()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data)
        x$setInverse(inv)
        inv
}
