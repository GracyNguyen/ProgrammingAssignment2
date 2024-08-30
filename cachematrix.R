## I write a pair of functions that cache the inverse of a matrix.

## The first function, makeCacheMatrix creates a special "matrix", which is really a list containing a function to
### 1. set the value of the matrix
### 2. get the value of the matrix
### 3. set the value of the inverse
### 4. get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
m<-NULL
  set<-function(y){
    x<<-y
    m<<-NULL
  }
  get<-function() x
  setinverse<-function(inverse) m<<-inverse
  getinverse<-function() m
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}



## The second function solve the inverse of the special "matrix" created with the above function

cacheSolve <- function(x, ...) {
         ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
  if (!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
       
}
