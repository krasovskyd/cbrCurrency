% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cbr_daily.R
\name{get_CPI_table}
\alias{get_CPI_table}
\title{Return russian CPI (consumer price index) since 2001 (base 2000 = 100). Can't return period
from Rosstat (Russian Statistical Service) www.gks.ru
The inflation indicator reflects the growth rate of consumer prices compared to the corresponding month of the previous year
Status: need update (i.e. use `fedstatAPIr` package)}
\source{
\url{https://www.gks.ru/bgd/free/b00_24/IssWWW.exe/Stg/d000/I000650R.HTM}
}
\usage{
get_CPI_table(from = as.Date("2018-05-01"), to = Sys.Date())
}
\arguments{
\item{from}{date in 'yyyy-mm-dd' format}

\item{to}{date in 'yyyy-mm-dd' format}

\item{base}{c('prior_month', 'month_prior_year', '2000')}
}
\value{
consumer price index table from Rosstat for selected period
}
\description{
Return russian CPI (consumer price index) since 2001 (base 2000 = 100). Can't return period
from Rosstat (Russian Statistical Service) www.gks.ru
The inflation indicator reflects the growth rate of consumer prices compared to the corresponding month of the previous year
Status: need update (i.e. use `fedstatAPIr` package)
}
