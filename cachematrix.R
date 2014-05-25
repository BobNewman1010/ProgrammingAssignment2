## These functions are used in conjunction with each other in
## order to reduce the amount of time need to perform repeated
## matrix inversion.  The two functions cache the results of
## a matrix inversion and then return that cached value whenever
## the inverse is needed.
## Note: this is only useful if the contents of the original matrix,
## and hence its inverse, do not change

## Usage -  (assuming myMatrix is an invertable matrix)
##
##   To create the cached matrix
##
##        myCachedMatrix <- makeCacheMatrix(myMatrix) 
##
##   To retrieve the inverse
##
##        cacheSolve(myCachedMatrix)
##
##   To change the matrix to be cached
##
##        myCachedMatrix$set(b)  -- Where b is a new invertable matrix



makeCacheMatrix <- function(x = matrix()) {

        ## This function receives as an argument an invertable matrix and
        ## returns a list containing the functions used to perform and save 
        ## the matrix inversion along with the functions used to 
        ## retrieve and return the cached result 
        ##
        ## the variable x is used to store the original matrix
        ## and the variable m is used to store the inverted matrix
        
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setInverse <- function(q) m <<- q
        getInverse <- function() m
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        
        ## This function is used to return the cached inverse of a matrix
        ## If there is no cached value the inverse of the matrix is computes
        ## and the resulting matrix is returned and stored in the
        ## cached variable m for future use.
        
        
        ## Return a matrix that is the inverse of 'x'
        m <- x$getInverse()
        
        ## if the inverse has already been computed (m is not null)
        ## then return it
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        
        ## if there is no inverse (m is null) 
        ##   retrieve the original matrix
        ##   compute the inverse
        ##   store it for future use 
        ##   return the inverse
        data <- x$get()
        m <- solve(data, ...)
        x$setInverse(m)
        m
}
