## Put comments here that give an overall description of what your
## functions do
## these functions returns inverse of matrix

## Write a short comment describing this function
## makeCacheMatrix is function object which create getter and setter functions
## for get and set of matrix and inverse of matrix 


makeCacheMatrix <- function(x = matrix()) {
        
        im <- NULL
        # print(im)
        # print(paste("print matrix",x))
        
        
        set <- function(y) {
                x <<- y
                im <<- NULL
        }
        get <- function() x
        
        setinverse <- function(imean) im <<- imean
        
        getinverse <- function() im
        
        list(set = set, get = get, 
                setinverse = setinverse, getinverse = getinverse )

}


## Write a short comment describing this function
## function will special function which get value of inverse of matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        im <- x$getinverse()
        # print(im)
        if (!is.null(im)) {
                print("get cached data")
                return(im)
        }
        data <- x$get()
        # print(data)
        im <- solve(data, ...)
        x$setinverse(im)
        im
}

m <- matrix(1:4,2,2)
m1 <- makeCacheMatrix(m)
# print(m1)
cacheSolve(m1)
cacheSolve(m1)
