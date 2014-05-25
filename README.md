### Programming Assignment 2

In this assignment we create 2 functions that are used to cache and
retrieve the inverse of a matrix

### First function - makeCacheMatrix

This function receives as an argument an invertable matrix and
returns a list containing the functions used to perform and save 
the matrix inversion along with the functions used to 
retrieve and return the cached result. 

The variable x is used to store the original matrix
and the variable m is used to store the inverted matrix.



### Second function - cacheSolve

This function is used to return the cached inverse of a matrix
If there is no cached value the inverse of the matrix is computed
and the resulting matrix is returned and stored in the
cached variable m for future use.


Usage -  (assuming myMatrix is an invertable matrix)

   To create the cached matrix
   
        myCachedMatrix <- makeCacheMatrix(myMatrix) 

   To retrieve the inverse

        cacheSolve(myCachedMatrix)

   To change the matrix to be cached

        myCachedMatrix$set(b)  -- Where b is a new invertable matrix
