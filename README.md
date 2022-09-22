
<!-- README.md is generated from README.Rmd. Please edit that file -->

# gMCPtest

## Overview

Compute weights for each intersection hypothesis in the closure of a
graph-based multiple testing procedure.

## Installation

There is no CRAN version of this package, so you must install the
development version directly from github.

``` r
# Install development version from GitHub
remotes::install_github("anthonypileggi/gMCPtest")
```

## Getting Started

Suppose `w` represents a vector of weights defining how much of the
overall alpha is initially reserved for each hypothesis. Assume that `G`
is a graph represented as a matrix of transition weights, where element
`(i, j)` defines how much of the $\alpha$ from hypothesis `i` is passed
to hypothesis `j`. Then we can compute the weights for each intersection
hypothesis using:

``` r
library(gMCPtest)
library(magrittr)
```

``` r
generate_weights(G, w)
```

## Examples

### Example 1

Following the example of [Bretz et
al. (2011)](https://onlinelibrary.wiley.com/doi/10.1002/bimj.201000239)
assume a primary family of hypotheses $F_1 = \{H_1, H_2\}$ and a
secondary family $F_2 = \{H_3, H_4\}$ and suppose a strict hierarchy
such that the secondary endpoints $H_3$ and $H_4$ will only be assessed
if the primary endpoints $H_1$ and $H_2$ are rejected, respectively.

``` r
G <- matrix(
  c(0,0,1,0,
    0,0,0,1,
    0,1,0,0,
    1,0,0,0), 
  nrow = 4,
  byrow = TRUE
)
w <- c(1/2, 1/2, 0, 0)
generate_weights(G, w) %>%
  print_weights()
#> # A tibble: 15 x 2
#>    set          weights         
#>    <chr>        <chr>           
#>  1 {4}          {-, -, -, 1}    
#>  2 {3}          {-, -, 1, -}    
#>  3 {3, 4}       {-, -, 0.5, 0.5}
#>  4 {2}          {-, 1, -, -}    
#>  5 {2, 4}       {-, 1, -, 0}    
#>  6 {2, 3}       {-, 0.5, 0.5, -}
#>  7 {2, 3, 4}    {-, 0.5, 0.5, 0}
#>  8 {1}          {1, -, -, -}    
#>  9 {1, 4}       {0.5, -, -, 0.5}
#> 10 {1, 3}       {1, -, 0, -}    
#> 11 {1, 3, 4}    {0.5, -, 0, 0.5}
#> 12 {1, 2}       {0.5, 0.5, -, -}
#> 13 {1, 2, 4}    {0.5, 0.5, -, 0}
#> 14 {1, 2, 3}    {0.5, 0.5, 0, -}
#> 15 {1, 2, 3, 4} {0.5, 0.5, 0, 0}
```

### Example 2

``` r
# equal weight for all hypotheses
w <- rep(1/4, 4)
generate_weights(G, w) %>%
  print_weights()
#> # A tibble: 15 x 2
#>    set          weights                 
#>    <chr>        <chr>                   
#>  1 {4}          {-, -, -, 1}            
#>  2 {3}          {-, -, 1, -}            
#>  3 {3, 4}       {-, -, 0.5, 0.5}        
#>  4 {2}          {-, 1, -, -}            
#>  5 {2, 4}       {-, 0.75, -, 0.25}      
#>  6 {2, 3}       {-, 0.25, 0.75, -}      
#>  7 {2, 3, 4}    {-, 0.25, 0.5, 0.25}    
#>  8 {1}          {1, -, -, -}            
#>  9 {1, 4}       {0.25, -, -, 0.75}      
#> 10 {1, 3}       {0.75, -, 0.25, -}      
#> 11 {1, 3, 4}    {0.25, -, 0.25, 0.5}    
#> 12 {1, 2}       {0.5, 0.5, -, -}        
#> 13 {1, 2, 4}    {0.25, 0.5, -, 0.25}    
#> 14 {1, 2, 3}    {0.5, 0.25, 0.25, -}    
#> 15 {1, 2, 3, 4} {0.25, 0.25, 0.25, 0.25}
```

### Example 3

Consider 3 hypotheses tested successively.

``` r
G <- matrix(
  c(0,1,0,
    0,0,1,
    1,0,0), 
  nrow = 3,
  byrow = TRUE
)
w <- c(1, 0 ,0)
generate_weights(G, w) %>%
  print_weights()
#> # A tibble: 7 x 2
#>   set       weights  
#>   <chr>     <chr>    
#> 1 {3}       {-, -, 1}
#> 2 {2}       {-, 1, -}
#> 3 {2, 3}    {-, 1, 0}
#> 4 {1}       {1, -, -}
#> 5 {1, 3}    {1, -, 0}
#> 6 {1, 2}    {1, 0, -}
#> 7 {1, 2, 3} {1, 0, 0}
```

## References

-   [Graphical approaches for multiple comparison procedures using
    weighted Bonferroni, Simes, or parametric tests (Bretz et
    al., 2011)](https://onlinelibrary.wiley.com/doi/10.1002/bimj.201000239)
-   [gMCP](https://github.com/kornl/gMCP) package – this gMCPtest
    package is really just providing access to one function from gMCP,
    the
    [`generateWeights()`](https://github.com/kornl/gMCP/blob/master/pkg/gMCP/R/generateWeights.R)
    function.
