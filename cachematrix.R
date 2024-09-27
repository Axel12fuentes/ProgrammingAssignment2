## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}



## makeCacheMatrix: Esta función crea un "objeto" especial
## que almacena una matriz y puede almacenar en caché su inversa.
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL  # Variable que almacenará la inversa de la matriz
  set <- function(y) {
    x <<- y
    inv <<- NULL  # Si se cambia la matriz, se borra la inversa almacenada
  }
  get <- function() x  # Devuelve la matriz
  setInverse <- function(inverse) inv <<- inverse  # Guarda la inversa
  getInverse <- function() inv  # Devuelve la inversa almacenada
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

## cacheSolve: Esta función calcula la inversa de la matriz "especial" 
## devuelta por makeCacheMatrix. Si la inversa ya ha sido calculada 
## (y la matriz no ha cambiado), entonces cacheSolve debe recuperar 
## la inversa del caché.
cacheSolve <- function(x, ...) {
  inv <- x$getInverse()  # Intenta obtener la inversa almacenada
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)  # Si ya está en la caché, la devuelve
  }
  data <- x$get()  # Si no está en la caché, obtiene la matriz original
  inv <- solve(data, ...)  # Calcula la inversa
  x$setInverse(inv)  # Almacena la inversa en caché para futuras consultas
  inv  # Devuelve la inversa calculada
}






