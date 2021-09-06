#' Currency reference on Central Bank of Russia (CBR)
#'
#' @format A data frame with 61 row and 7 variables:
#' \describe{
#'   \item{ISO_code}{3-char code of currency according to the ISO-4217}
#'   \item{nominal}{nominal of currency with respect to RUB exchange rate. (1--100000) ATTENTION: this package uses 1 to 1 rate!}
#'   \item{en_name}{full name of currency in english}
#'   \item{ISO_num_code}{numeric code of currency according to the ISO-4217}
#'   \item{cbr_ID}{currency internal ID in CBR database}
#'   \item{parent_code}{similar to cbr_ID, using if currency inherited from other}
#'   \item{ru_name}{full name of currency in russian}
#'   }
#' @source \url{https://www.cbr.ru/scripts/XML_valFull.asp}
"currency_reference"
