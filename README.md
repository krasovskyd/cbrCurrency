
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cbrCurrency

<!-- badges: start -->

<!-- badges: end -->

The cbrCurrency package provides few functions for working with currency
rates (currency to RUB as 1-to-1) from Central Bank of Russia. Most
useful function is `cbr_mutate_rates()`.

## Installation

You can install cbrCurrency package from
[GitHub](https://github.com/krasovskyd/cbrCurrency) with:

``` r
remotes::install_github('krasovskyd/cbrCurrency')
```

## Example

This is a basic example which shows you how to mutate column with
different currencies and date rates (use `handleNA = TRUE` if exchange
rate on required date not available)

``` r
library(magrittr)
library(cbrCurrency)

# some toy data
currency_df <- data.frame(stringsAsFactors = FALSE,

    date = sample(seq(as.Date('2017/04/01'),
                      as.Date('2020/01/01'), by="day"), 
                  150),

    currency = sample(c('USD', 'GBP', 'JPY', 'EUR', 'HKD',
                        'CNY', 'CHF', 'CAD'),
                      150,
                      replace = TRUE)
) %>% 
  tibble::as_tibble() %>% 
  dplyr::mutate(n = 1:nrow(.)) %>% 
  dplyr::relocate('n')

currency_df <- cbr_mutate_rates(currency_df, handleNA = TRUE)
#> Get CAD to RUB from 2017-06-25 to 2019-11-30
#> Get USD to RUB from 2017-05-20 to 2019-12-16
#> Get JPY to RUB from 2017-04-03 to 2019-12-08
#> Get GBP to RUB from 2017-03-26 to 2019-11-23
#> Get CHF to RUB from 2017-05-14 to 2019-11-04
#> Get EUR to RUB from 2018-02-05 to 2019-10-10
#> Get CNY to RUB from 2017-07-19 to 2019-06-28
#> Get HKD to RUB from 2017-04-23 to 2019-11-17
#> 
#> There're 50 NAs out of 150 rows in exchange rates.
#> (33% of all)
#> 
#> All missing values successfully processing
#> Created "instead_date" column for replaced dates storing.
currency_df
#> # A tibble: 150 x 5
#>    date       currency     n rub_rate instead_date
#>    <date>     <chr>    <int>    <dbl> <date>      
#>  1 2019-11-09 CAD          1   48.3   NA          
#>  2 2019-06-18 USD          2   64.3   NA          
#>  3 2017-04-18 JPY          3    0.519 NA          
#>  4 2019-02-11 GBP          4   85.4   2019-02-09  
#>  5 2018-04-24 CHF          5   63.2   NA          
#>  6 2019-04-17 JPY          6    0.574 NA          
#>  7 2019-12-16 USD          7   62.6   2019-12-14  
#>  8 2017-09-28 USD          8   58.0   NA          
#>  9 2018-09-05 EUR          9   79.0   NA          
#> 10 2019-06-12 CAD         10   48.6   NA          
#> # ... with 140 more rows
```

## Issues

If you find bug please force this in Issues or sent feedback on
<krasovsky.d.a@gmail.com>
