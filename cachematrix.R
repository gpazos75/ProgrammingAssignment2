## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
## Put comments here that give an overall description of what your
## functions do
# These functions calculate and cache the inverse of a squared matrix. makeCacheMatrix returns a named list of functions that are called in cacheSolve, which both cache and returns the inverse of the matrix. The functions returned by makeCacheMatrix can also be individually accessed via the  operator.   


## Write a short comment describing this function
# makeCacheMatrix returns a named list of functions that set and get both the input matrix (x, the formal argument) and the inverse of that matrix (imat). The last one is actually calculated by cacheSolve. Both x and imat are cached in the parent environment. 

makeCacheMatrix <- function(x = matrix()) {
        imat <- NULL
        set <- function(y) {
                x <<- y
                imat <<- NULL
        }
        get <- function() x
        setinv <- function(inv) imat <<- inv
        getinv <- function() imat
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## Write a short comment describing this function
# cacheSolve calculates and returns the inverse (imat) of x, the input matrix of makeCacheMatrix, by using solve(). Their formal arguments are an object of class makeCacheMatrix (the list of setters and getters functions mentioned above) and additional arguments of solve() that are passed on through .... If an inverse matrix was cached, then it is returned with a message. Otherwise, the inverse matrix is calculated, cached and printed in the current call to cacheSolve. 

cacheSolve <- function(x, ...) {
        imat <- x()
            message(getting cached data)
return(imat)
}
        data <- x()
        imat <- solve(data, ...)
        x(imat)
        imat
}

## This code shows how the cached inverse of a 10x10 matrix is retrieved using cacheSolve (see the second call).
m <- matrix(rnorm(100,5,2), 10, 10)
aMatrix <- makeCacheMatrix(m)

aMatrix() #NULL. The call to makeMatrix clears any cached value of imat

cacheSolve(aMatrix) # Returns imat 
cacheSolve(aMatrix)# Returns the cached value of imat 

aMatrix() # cacheSolve assigned the value (the calculated inverse matrix) to imat, which can also be accessed via getinv() 


## This code shows how a new input matrix can be set without making a whole call to makeCacheMatrix but only to the set() function defined in its environment. 
aMatrix(matrix(rnorm(9,5,2), 3, 3))

cacheSolve(aMatrix)# Different output (inverse of the 3x3 matrix)


