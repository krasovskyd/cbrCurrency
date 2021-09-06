
#########################################################################
# Main functions --------------------------------------------------------
#########################################################################

#' Daily/monthly Central Bank of Russia exchange currency rates or
#' precious metal discount prices to russian ruble with 1-to-1 rate
#'
#' @param currency Currency in ISO 3-char code ('USD', 'GBP', 'EUR', etc.), or precious metal chemical abbreviation
#' @param date Date in format "yyyy-mm-dd". You also can get tomorrow exchange rates.
#' @return numeric 1 length vector with currency of precious metal rates
#' @export
#' @source \url{http://www.cbr.ru/scripts/XML_daily.asp?date_req=02/03/2002;     http://www.cbr.ru/scripts/xml_metall.asp?date_req1=01/07/2001}
cbr_daily <- function(currency = 'USD',
                      date = TRUE){
  library(xml2)
  # library(magrittr)
  library(glue)

  currency <- toupper(currency)
  date <- date
  req_date <- ifelse(date == TRUE, '', formated_date(date))
  ifelse(date == TRUE,
         message(paste0(currency, ' on ', Sys.Date())),
         message(paste0(currency, ' on ', date)))

  if (currency %in% c('AU', 'AG', 'PT', 'PD')) {
        # get metal rate
    currency <- get_metal_code(currency)

    xml <- get_metal_xml(req_date)
    rate <- get_metal_rate(xml, metal_code = currency)

    return(rate)

  } else {
        # get currency rate
    xml <- get_currency_xml(req_date)

    xml_date <- xml %>%
                xml2::xml_attr('Date') %>%
                as.Date('%d.%m.%Y')

    if (date != xml_date) {
      # TODO: need FIX TRUE date and Sys.Date()
        warning(glue::glue('Exchange rate on another date:\n{xml_date} instead of {Sys.Date()}'))
    }

    # mes <- paste0(currency, ' on ', date)
    # ifelse(date == '',
    #        message(paste0(mes, ' ( today ', Sys.Date(), ' )')),
    #        message(mes))

    rate <- get_currency_rate(xml, currency)
    return(rate)
  }
}

#' Dynamics of currency over the period with 1-to-1 rate to RUB
#'
#' @param currency Currency in ISO 3-char code ('USD', 'GBP', 'EUR', etc.)
#' @param from Date in format "yyyy-mm-dd". You also can get tomorrow exchange rates.
#' @param to Date in format "yyyy-mm-dd". You also can get tomorrow exchange rates.
#' @return numeric vector of exchange rates with length 1 or more
#' @export
#' @source \url{http://www.cbr.ru/scripts/XML_dynamic.asp?date_req1=02/03/2001&date_req2=14/03/2001&VAL_NM_RQ=R01235; http://www.cbr.ru/scripts/xml_metall.asp?date_req1=01/07/2001&date_req2=13/07/2001}
cbr_currency_ts <- function(currency = 'USD', # STATUS: working. Need test monthly currencies
                          from = as.character(Sys.Date() - 30),
                          to = as.character(Sys.Date())) {
  library(xml2)
  library(glue)
  # library(magrittr)

  currency <- toupper(currency)
  message(paste0('Get ', currency, ' to RUB from ', from, ' to ', to))

  id <- get_currency_id(currency)
  from <- formated_date(from)
  to <- formated_date(to)

  xml <- get_currency_ts_xml(id, from, to)

  ts <- get_currency_ts(xml)

  rm(id, from, to, xml)

  ts
}

#' Dynamics of currency over the period with 1-to-1 rate to RUB
#'
#' @param currency Precious metals (case insensitive) chemical code c('Au', 'Ag', 'Pt', 'Pd', 'all')
#' @param from Date in format "yyyy-mm-dd". You also can get tomorrow exchange rates.
#' @param to Date in format "yyyy-mm-dd". You also can get tomorrow exchange rates.
#' @return data frame of date, buy and sell rates of precious metals in long format
#' @export
#' @source \url{https://www.cbr.ru/scripts/xml_metall.asp?date_req1=01/07/2001&date_req2=13/07/2001}
cbr_metal_ts <- function(currency = 'ALL', # STATUS: works as expected
                          from = as.character(Sys.Date() - 30),
                          to = as.character(Sys.Date())) {

  currency <- toupper(currency)
  stopifnot(currency %in% c('AU', 'AG', 'PT', 'PD', 'ALL'))

  message(paste0('Get ', currency, ' to RUB from ', from, ' to ', to))

  from <- formated_date(from)
  to <- formated_date(to)

  xml <- get_metal_xml_ts(from, to)

  if (currency == 'ALL') {

    rate <- get_metal_df(xml)

  } else {

    rate <- get_metal_df(xml) %>% .[.$metal == currency, ]
  }

  rm(from, to, xml, currency)

  return(rate)
}

#' Return CBR key rate value on date of time series for the period
#'
#' @param date Date in format "yyyy-mm-dd". You also can get tomorrow exchange rates.
#' @param from Optional date argument for time series return
#' @return numeric vector of length 1 or more
#' @export
#' @source \url{https://www.cbr.ru/hd_base/KeyRate/}
key_rate_ts <- function(date = Sys.Date(),
                        from = FALSE) {

  # TODO: messages done errors. Need to FIX
  # ifelse(from == FALSE,
  #        message(paste0('Key rate on ', date)),
  #        message(paste0('Key rate from ', from, ' to ', date)))

  if (from == FALSE) { from <- date }

  html <- xml2::read_html(glue('https://www.cbr.ru/hd_base/KeyRate/?UniDbQuery.Posted=True&UniDbQuery.From={dot_date(from)}&UniDbQuery.To={dot_date(date)}'))

  key_rate <- data.frame(stringsAsFactors = FALSE,
                         date = html %>%
                                xml2::xml_find_first('//table') %>%
                                xml2::xml_find_all('//td[position() mod 2 = 1]') %>%
                                xml2::xml_text() %>%
                                as.Date('%d.%m.%Y'),
                         value = html %>%
                                 xml2::xml_find_first('//table') %>%
                                 xml2::xml_find_all('//td[position() mod 2 = 0]') %>%
                                 xml2::xml_text() %>%
                                 sub(',', '.', .) %>%
                                 as.numeric())
  rm(html)

  if (nrow(key_rate) == 1) { key_rate[1,2] } else { key_rate }
}

#' Return russian CPI (consumer price index) since 2001 (base 2000 = 100). Can't return period
#' from Rosstat (Russian Statistical Service) www.gks.ru
#' The inflation indicator reflects the growth rate of consumer prices compared to the corresponding month of the previous year
#' Status: need update (i.e. use `fedstatAPIr` package)
#' @param from date in 'yyyy-mm-dd' format
#' @param to date in 'yyyy-mm-dd' format
#' @param base c('prior_month', 'month_prior_year', '2000')
#' @return consumer price index table from Rosstat for selected period
#' @source \url{https://www.gks.ru/bgd/free/b00_24/IssWWW.exe/Stg/d000/I000650R.HTM}
get_CPI_table <- function(from = as.Date('2018-05-01'), # date, date -> numeric
                          to = Sys.Date()) {
  library(httr)
  library(rvest)
  library(stringr)  # TODO: replace with base R

  # stopifnot(base %in% c('2000', 'month_prior_year', 'prior_month', 'all'))
  # base <- ifelse(base == 'all', TRUE, base)
  # base <- switch (base,
  #   '2000'             = 'to_2000',
  #   'month_prior_year' = 'to_month_prior_year',
  #   'prior_month'      = 'to_prior_month',
  #   'all'              = TRUE
  # )
  period <- format(as.Date(from), '%Y'):format(as.Date(to), '%Y')
  if(min(period) < 2001) stop('CPI from 2001 year. Base 2000 year = 100')
  stopifnot(from < to, max(period) <= as.integer(format(Sys.Date(), '%Y')))

  if(length(period) == 1) {
    message(paste0('Use CPI table for ', period, ' year'))
  } else {
    message(paste0('Use CPI tables from ', period[1], ' to ',
                   tail(period, 1), ' year'))
  }

  root_url <- 'https://www.gks.ru/bgd/free/b00_24/IssWWW.exe/Stg/d000/I000650R.HTM'
  base_url <- sub('[0-9A-Za-z]*\\.HTM', '', root_url)

  root_page <- read_html(root_url)

  cpi_ref_df <- data.frame(stringsAsFactors = FALSE,
                  year = root_page %>%
                          xml_find_all('//tr/td/p') %>%
                          xml_text() %>%
                          .[seq(2, length(.), by = 2)] %>%
                          as.integer(),
                  href = root_page %>%
                          xml_find_all('//tr/td/p/a') %>%
                          xml_attr('href') %>%
                          paste0(base_url, .)
  )

  cpi_urls <- cpi_ref_df[cpi_ref_df[['year']] %in% period, 'href']

  # TODO: Fix this funciton. can return NULL
  cpi_info_mes <- function(raw_table){
      year = paste0('Downloaded ',
                     substr(raw_table[[2]][3, 1], 1, 4),
                     ' year period. ')

      update = ifelse(length(raw_table) == 1,
                     'Update unknown',
                     raw_table[[1]] %>%
                     stringr::str_extract('(?<=[\\–\\-]\\s)(.*)(?=г\\.$)')  %>% # TODO: replace with base R
                      paste0('Updated at ', .))

      message(paste0(year, update))
  }

  tables <- lapply(period,
                   function(x){
                     cpi_ref_df[cpi_ref_df$year %in% x, 'href'] %>%
                      xml2::read_html() %>%
                      rvest::html_table(fill = TRUE) %T>%
                       cpi_info_mes()
                     # TODO: add cpi_info_mes() ISO-style date
    })

  tidy_table <- lapply(tables,
                       function(x){
                        tail(x, 1) %>%
                        .[[1]] %>%
                        as_cpi_table()
  }) %>% do.call(rbind, .)

  rm(tables, cpi_info_mes, cpi_urls, cpi_ref_df, period)
  return(tidy_table)
} # TODO: add period option in 'month' arg


#' NOTE: function under construction
#' @param date date in 'yyyy-mm-dd' format
#' @return
#' @keyword internal
cbr_inflation <- function(date = Sys.Date(),
                          check_actual = FALSE){
  stopifnot(all.equal(class(date), 'Date'),
            is.logical(check_actual))

  if (check_actual) {

    cbr_page <- read_html('http://www.cbr.ru/')
    infl_rate <- cbr_page %>%
      xml_find_all('//*[@class="main-indicator_value"]') %>%
      xml_text() %>% .[2] %>%
      str_extract('.*%')

    infl_date <- cbr_page %>%
      xml_find_all('//*[@class="main-indicator_content"]') %>%
      xml_text() %>% .[2] %>%
      str_extract_all('[а-я]*\\s\\d{4}') %>%
      str_split(., '\\s') %>%
      unlist()

    message(paste0('Actual CBR russian inflation rate: ', infl_rate,
                   ' (', ru_month_to_en(infl_date[1]), ' ', infl_date[2], ')\n(to the corresponding month of the previous year)'))

    rm(cbr_page, infl_date, infl_rate)
  }

  # TODO: add args
  # get_CPI_table()
}



# TODO: add to raw data
# get list of routes
# -------------------
# CPI_root_url <- 'https://www.gks.ru/bgd/free/b00_24/IssWWW.exe/Stg/d000/I000650R.HTM'
# CPI_common_url <- sub('[0-9A-Z]*\\.HTM$', '', CPI_root_url)
#
# get_root <- xml2::read_html(CPI_root_url)
#
# year <- get_root %>%
#         xml2::xml_find_all('//tr/td/p[not(descendant::a)][string-length(text()) > 1]') %>%
#         xml2::xml_text()
#
# href <- get_root %>%
#         xml2::xml_find_all('//tr/td/p/a') %>%
#         xml2::xml_attr('href') %>%
#         xml2::paste0(CPI_common_url, .)
#
# cpi_routes <- mapply(function(year, href) { href },
#                      year, href, SIMPLIFY = FALSE, USE.NAMES = TRUE)
# # cpi_routes <- href
# # names(cpi_routes) <- year
# # cpi_routes <- setNames(href, year)
# --------------------------------
