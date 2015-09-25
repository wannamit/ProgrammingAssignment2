### Introduction

This program is to fulfill the second programming assignment of R Programming - Coursera

### Create a function that calculate inverse of matrix and stores it in cache. For later computation it retrive vale from cache.

`<<-` is used to store value in cache for a given variable by placing that variable in golbal environment.

The first function, `makeCacheMatrix` creates a special "matrix", which is
really a list containing a function to

- set the value of the matrix
- get the value of the matrix
- set the value of the inverse
- get the value of the inverse

<!-- -->

    makeVector <- function(x = matrix())

The function `cacheSolve` calculates the inverse of the special "matrix"
created with the `makeCacheMatrix` function. It first checks to see if the
inverse has already been calculated. If so, it `get`s the inverse from the
cache and skips the computation. Otherwise, it calculates the inverse of
the data and sets the value of the inverse in the cache via the `setinverse`
function.

    cacheSolve <- function(x, ...) {

