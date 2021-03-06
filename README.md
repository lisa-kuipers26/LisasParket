
# A reproducable package

The main focus of this package is to document and save 4 different
functions used in my portfolio. This package showcases that it’s
possible to save your functions and data used in research and being able
to call them again to by others to reproduce the results.

## Installing the package

First install devtools:

``` r
install.packages("devtools")
```

Now you can install the package from github:

``` r
devtools::install_github("lisa-kuipers26/LisasParket",build_vignettes = FALSE)
```

## Using the package

After installing the package you can use it by using the library
function to load the package.

``` r
library(LisasParket)
#> Warning: replacing previous import 'ggplot2::last_plot' by 'plotly::last_plot'
#> when loading 'LisasParket'
```

Use `BrowseVignette("LisasParket")` to see the possibilities of this
package.
