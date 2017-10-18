## This Pair of functions cache the inverse of a matrix. 

## makeCacheMatrix creates an R object 
#with 4 functions and 2 data objects in it
#get and set are functions to get the matrix 
#getinv is the function to get the inverse if its already cached
#setinv ,stores the newly calculated inverse in the cache

makeCacheMatrix <- function(x = matrix()) {
  #Initiates the inverse matrix
  myinvX<-NULL
  
  set<-function (y= matrix()){
    #sets matrix and initiates the inverse matrix
    x<<-y
    myinvX<<-NULL
    
  }
  
  get<-function(){
    # get matrix
    x
  }
  
  setinv<-function(invM= matrix()){
    #sets the inverse  matrix in cache
    myinvX<<-invM
  }
  
  getinv<-function(){
    # gets inverse  matrix from cache
    myinvX
  }

  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## cacheSolve is the function that checks 
##if the inverse of the matrix is already available in the cache
## if its already in the cache, it retrieves the inverse from the cache
## else it finds the inverse and stores in the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  myinvX<-x$getinv()
  if (!is.null(myinvX)){
    #Case 1: the inverse is  available in the cache 
      return(myinvX)
  }
  #Case 2: the inverse is not available in the cache 
  z<-x$get()
  myinvX<-solve(z)
  x$setinv(myinvX)
  myinvX
}
