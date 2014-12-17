### Introduction

This is a programming assigment as a part of the online course
"R Programming" by Johns Hopkins University started on Coursera
on December 1, 2014. This assigment contains an R code to cache
the inverse of an invertible matrix so that we can avoid calculating
the inverse of a same matrix again and again. We can instead use this
value saved in the cache. Hence with the use of scoping rules of R
language, we can use this concept of cache to preserve the state of
an R object (a matrix and its inverse in this case).

### Caching the Inverse of a Matrix

Below are two functions that are used to create a special object 
that stores an intertible matrix and caches its inverse.

The first function, `makeCacheMatrix` creates a special "matrix", which is
really a list containing a function to

1.  set the value of the matrix
2.  get the value of the matrix
3.  set the value of the inverse
4.  get the value of the inverse

<!-- -->

    makeCacheMatrix <- function(x = numeric()) {
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
                 getInverse = getInverse)
    }

The following function calculates the inverse of the special "matrix"
created with the above function. However, it first checks to see if the
inverse has already been calculated. If so, it get`s the inverse from
the cache and skips the computation. Otherwise, it calculates the 
inverse of the data and sets the value of the inverse in the cache 
via the 'setinverse' function.

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

### Sample Inputs/Outputs

<!-- -->

	Input:
		>data <- matrix(1:4, 2, 2)
		>a <- makeCacheMatrix(data)
		>inv <- cacheSolve(a)
	
	Output:
		>data <enter>
			[,1] [,2]
		   [1,]   1    3
		   [2,]   2    4

		>inv <enter>
			[,1] [,2]
		   [1,]  -2   1.5
		   [2,]   1  -0.5

		>cacheSolve(a)
		getting cached data
			[,1] [,2]
		   [1,]  -2   1.5
		   [2,]   1  -0.5

		 
