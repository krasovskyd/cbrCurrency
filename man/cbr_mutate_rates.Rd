% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cbr_mutate_rates.R
\name{cbr_mutate_rates}
\alias{cbr_mutate_rates}
\title{Mutate column of RUB exchange rates with respect to
currency and date of exchange}
\usage{
cbr_mutate_rates(
  df,
  x.date = "date",
  x.currency = "currency",
  handleNA = FALSE,
  instead_date_col = "instead_date",
  rub_rate_col = "rub_rate"
)
}
\arguments{
\item{df}{data frame with currencies and dates}

\item{x.date}{[char] name of column with dates in df}

\item{x.currency}{[char] name of column with currencies in df}

\item{handleNA}{[bool] handle missing exchange rates (NA) by using previous available exchange date}

\item{instead_date_col}{name of column with RUB exchange previous dates}

\item{rub_rate_col}{name of column with RUB exchange rates}
}
\value{
data frame with mutated column of RUB exchange rates
}
\description{
Mutate column of RUB exchange rates with respect to
currency and date of exchange
}
