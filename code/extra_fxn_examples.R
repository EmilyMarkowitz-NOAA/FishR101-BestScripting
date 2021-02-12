# Lesson 6: function examples
# 1_setup.R
# Created by: Caitlin ALlen Akselrud
# Contact: caitlin.allen_akselrud@noaa.gov
# Created: 2020-02-11
# Modified: 2021-02-11

x <- seq(1:10)
x

example_function <- function(x){
  # do a calc
  y <- sum(x)
  # return my new value
  return(y)
}

my_sum <- example_function(x)
my_sum 


###################

example_function <- function(x){
  # do a calc
  y <- sum(x)
  # return my new value
  return(y)
}

z <- seq(1:20)
z

my_sum <- example_function(x = z)
my_sum 

example_function( x = seq(1:5))

my_number <- example_function( x = c(2,11,23,42,4))
my_number


###################

example_function2 <- function(a, b){
  # do a calc
  y <- sum(a, b)
  # return my new value
  return(y)
}

z <- seq(1:10)
z

my_number

my_sum <- example_function2(a = z, b = my_number)
my_sum


my_sum <- example_function2(z, my_number) #works but harder to follow/make sure correct input for value
my_sum

#############################

example_function <- function(x){
  # do a calc
  y <- sum(x)
  # return my new value
  return(y)
}

my_sum <- example_function(x = seq(1:10))
my_sum 

class(my_sum)


my_sum2 <- example_function(x = seq(1:20))
my_sum2 

class(my_sum2)

z <- sum(seq(1:10))
class(z)

