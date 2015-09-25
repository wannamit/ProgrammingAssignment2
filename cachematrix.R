## This program calculates the inverse of matrix
## Inverse is process costly calculation for larger matrix
## To reduce CPU cost it stores inverse to cache
# so that if further need for inverse of same matrix it retrives from cache rather than again calculation.
## create cacheMatrix using makeCacheMatrix
    # m <- makeCacheMatrix(matrix)
## Calculate inverse using cacheSolve and cacheMatrix as input argument
    # inverse <- cacheSolve(m)


## makeCacheMatrix creates a new tyep of matrix from native native matrix
#  the new matrix supports storage of inverse in cache.

makeCacheMatrix <- function(x = matrix()) {
  # initializes inverse value with NULL when new cacheMatrix is created
	inv <- NULL

	# set() saves matrix value in chache type matrix 
	set <- function(mat) {
		x <<- mat
		inv <<- NULL
	}

	# get() provides interface to retrive matrix value
	get <- function() x
  
	# setinverse() saves inverse of matrix in cache.
	setinverse <- function(inverse) inv <<- inverse
	
	# getinverse() provides interface to access inverse of cacheMatrix that is stored in cache.
	getinverse <- function() inv
  
	# list of function that can be accessed by cacheMatrix created using makeCacheMatrix
	list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)

}


## cacheSolve returns the inverse of matrix
## If inverse is already computed it retrives result from cache memory
## For new matrix it computes inverse and stores to cache memory

cacheSolve <- function(x, ...) {
	## Return a matrix that is the inverse of 'x'

	inv <- x$getinverse()
  
	# Check if inverse is in cache.
	if(!is.null(inv)){
		message("getting cached data")
		return(inv)
	}

	# if inverse is not in cache, calculate inverse and save it in cache.
	data <- x$get() # get value of matrix
	inv <- solve(data, ...) # calculate inverse
	x$setinverse(inv) # save inverse to cache
	
	inv #return inverse
}