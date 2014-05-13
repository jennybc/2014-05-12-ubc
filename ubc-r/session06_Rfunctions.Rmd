
# Creating Functions

Suppose we want to take the Gapminder dataset, fit a linear 
model and extract an intercept and a slope, that should not be too hard (I think?). But  
what if we want to repeat this for each sub-data set for each country and there are 142 countries...

## Objectives

* Define a function that takes parameters.
* Return a value from a function.
* Set default values for function parameters.
* Explain why we should divide programs into small, single-purpose functions.
* Explain why we should always annotate our functions. 



Let's start by writing the script to fit a linear model of *lifeExp* against *year* on the Gapminder dataset and extract the intercept and slope. 

```r
gDat <- read.delim("gapminderDataFiveYear.txt")
fit <- lm( lifeExp ~ year, data=gDat)
fit.coef <- coef(fit)
names(fit.coef) <- c("intercept","slope")
fit.coef 
```



### Exercises

1. We have seen how to use the **subset** argument in **lm()* to analyze a subset of a dataset. Repeat the above analysis but focus on only the country -- "Spain".  

*Example code:*

```r
fit <- lm( lifeExp ~ year, data=gDat, subset=country=="Spain")
fit.coef <- coef(fit)
names(fit.coef) <- c("intercept","slope")
fit.coef 
```

What we want is to replicate the above but in one line by creating a customised function that takes a country name and returns the same results. For instance,

```r
myfun("Spain") ## Won't work yet
```

Let's start with something more basic. Let's create a function takes two arguments and add them (boring).


```r
f <- function(x, y){
  z <- x + y
  return(z)
}

f <- function(x, y){
  z <- x + y
  z <- z * 5
  return(z)
}
f # entire function
body(f) # body of a function
formals(f) # a formal list of arguments
args(f) # a more human readable list of arguments
f(1, 2)
f(10, 1)
f(999, -10)
f( c(1,3,4), 5)
f( c(1,3,4), c(5,7))
```


The definition opens with the name of your new function, which is followed by the call to make it a `function` and a parenthesized list of parameter names. You can have as many input parameters as you would like (but too many might be bad style). The body, or implementation, is surrounded by curly braces `{ }`. In many languages, the body of the function - the statements that are executed when it runs - must be indented, typically using 4 spaces. While this is not a mandatory requirement in R coding, we strongly recommend you to adopt this as good practice.

When we call the function, the values we pass to it are assigned to those variables so that we can use them inside the function. The last line within the function is what R will evaluate as a returning value. Remember that the last line has to be a command that will print to the screen, and not an object definition, otherwise the function will return nothing - it will work, but will provide no output. 


```r
f <- function(x, y){
  z <- x + y
}
f(1, 2)
```

Now the function returns nothing.



### Exercises

2. Now try create a function called **hgtwgt_to_bmi** that takes **hgt** and **wgt** as arguments and returns **bmi** (body mass index = weight/height^2, where weight is in kg and height is in m). 

*Example code:*

```r
hgtwgt_to_bmi <- function(hgt, wgt){
  bmi <- wgt/hgt^2
  return(bmi)
}
hgtwgt_to_bmi(1.8, 65)
hgtwgt_to_bmi(1.8, c(70,80,90))
```



You can also return a vector or a list. For instance, 

```r
f <- function(x, y){
  z1 <- x + y
  z2 <- x - y
  z3 <- x * y
  return( c(z1, z2, z3))
}
f(1, 2)
f(5, 7)

f <- function(x, y){
  z1 <- x + y
  z2 <- x - y
  z3 <- x * y
  return( list(sum=z1, diff=z2, prod=z3))
}
f(1, 2)
f(5, 7)

```



### Exercises

3. Now we go back to our original goal and create a function
 called lmcountry that takes a country's name,
 fit a linear model of lifeExp vs year and a return a list of intercept and slope

*Example code:*
```r
fit <- lm( lifeExp ~ year, data=gDat, subset=country=="Spain")
fit.coef <- coef(fit)
names(fit.coef) <- c("intercept","slope")
fit.coef 

lmcountry(country.name) ## return a list
lmcountry <- function(country.name){
  fit <- lm( lifeExp ~ year, data=gDat, subset=country==country.name)
  fit.coef <- coef(fit)
  return( list(intercept=fit.coef[1], slope=fit.coef[2]) )
}
lmcountry("Spain")
```





# Documenting

Once we start putting things in functions so that we can re-use them, we need to start testing that those functions are working correctly. To see how to do this, let's try to test out the **hgtwgt_to_bmi** function by submitting a couple line of codes.
	

```r
hgtwgt_to_bmi(178, 145) # does not seem right?
hgtwgt_to_bmi # what does this function do?
lmcountry # what does this function do?
```

	
We could test this, but since we don't know what the values ought to be, it will be hard to tell if the result was correct. We could do some debugging, but this is not our main focus in this session. Our main focus here is to  write some documentation for our function to remind ourselves later what it's for and how to use it.

The usual way to put documentation in software is to add comments like this:


```r
# function should always be annotated
hgtwgt_to_bmi <- function(hgt, wgt){
  ## input: hgt (in meter), wgt (in kg)
  ## output: bmi (in kg/m^2)
  bmi <- wgt/hgt^2
  return(bmi)
}
```

By making notes inside the function, then simply typing in the function will give us the notes along with all of the text, so we can remember what we told the computer to do. In other languages, docstrings show up as help, even for functions that you wrote yourself.


```r
hgtwgt_to_bmi
```



### Exercises:

1. Let's create a simple function of your own, e.g., area of a circle, make annotation, and then let your neighbour read your function to see if they understand what the function is by reading only your annotation. 

