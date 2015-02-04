## speeds up calculating a matrix inverse using scoping rules and cache

## list of functions to set/get a matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    set <- function(y){
    	x<<-y
	inverse<<-NULL
    	}
    get <- function() x
    setinverse <- function(inv) inverse <<-inv
    getinverse <- function() inverse
    list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}

## looks for inverse in cache, if not found computes is

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	inverse <- x$getinverse()
	if(!is.null(inverse)) {
	    message("getting cached data")
	    return(inverse)
	}
	data<-x$get()
	inverse <-solve(data)
	x$setinverse(inverse)
	inverse
}
