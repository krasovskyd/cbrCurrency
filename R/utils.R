
# library(magrittr)
# Aux functions ------------------------------------------------------

#' @param date date or string in 'yyyy-mm-dd' format
#' @return date in 'dd/mm/yyyy' format
#' @noRd
#' @keyword internal
formated_date <- function(date) {

 date <- format(as.Date(date), '%d/%m/%Y')
 date
}

#' @param date date or string in 'yyyy-mm-dd' format
#' @return date in 'dd.mm.yyyy' format
#' @noRd
#' @keyword internal
dot_date <- function(date) {

  date <- format(as.Date(date), format = '%d.%m.%Y')
  date
}

#' @param date case independent chemical symbol af want metal c('Au', 'Ag', 'Pt', 'Pd')
#' @return integer. Inner CBR metal code
#' @noRd
#' @keyword internal
get_metal_code <- function(currency) {
    currency <- toupper(as.character(currency))

    ifelse(currency == 'AU',  1,
    ifelse(currency == 'AG',  2,
    ifelse(currency == 'PT',  3,
    ifelse(currency == 'PD',  4,
    ifelse(currency == '1' , 'AU',
    ifelse(currency == '2' , 'AG',
    ifelse(currency == '3' , 'PT',
    ifelse(currency == '4' , 'PD',
           'ERROR: get_metal_code(): not a metal code or symbol'))))))))
}

#' @param from date (string) in 'dd/mm/yyyy' format
#' @param to date (string) in 'dd/mm/yyyy' format
#' @return XML of course time series on request period
#' @noRd
#' @keyword internal
get_metal_xml_ts <- function(from, to) {

 xml <- xml2::read_xml(glue::glue('https://www.cbr.ru/scripts/xml_metall.asp?date_req1={from}&date_req2={to}'))
 return(xml)
}

#' @param req_date date (string) in 'dd/mm/yyyy' format
#' @return XML of course on request date
#' @noRd
#' @keyword internal
get_metal_xml <- function(req_date) {

 get_metal_xml_ts(req_date, req_date)
}

#' @param metal_xml XML with metal exchange rates (see get_metal_xml())
#' @param metal_code inner CBR metal code for Gold, Silver, Platinum or Palladium (see get_metal_code())
#' @return numeric 1 length vector
#' @noRd
#' @keyword internal
get_metal_df <- function(xml) {
    data.frame(stringsAsFactors = FALSE,
               date =  xml %>%
                       xml2::xml_find_all('//Record/@Date') %>%
                       xml2::xml_text() %>%
                       as.Date('%d.%m.%Y'),

               metal = xml %>%
                       xml2::xml_find_all('//Record/@Code') %>%
                       xml2::xml_text() %>%
                       get_metal_code(),

               buy =   xml %>%
                       xml2::xml_find_all('//Record/Buy') %>%
                       xml2::xml_text() %>%
                       sub(',', '.', .) %>%
                       as.numeric(),

               sell =  xml %>%
                       xml2::xml_find_all('//Record/Sell') %>%
                       xml2::xml_text() %>%
                       sub(',', '.', .) %>%
                       as.numeric()
               )
}

#' @param metal_xml XML with metal exchange rates (see get_metal_xml())
#' @param metal_code inner CBR metal code for Gold, Silver, Platinum or Palladium (see get_metal_code())
#' @return numeric 1 length vector
#' @noRd
#' @keyword internal
get_metal_rate <- function(metal_xml, # TODO: rewrite for df return
                           metal_code) {
  # rate <- metal_xml %>%
    metal_xml %>%
          xml2::xml_find_first(glue::glue('//Record[@Code={metal_code}]/Buy')) %>%
          xml2::xml_text() %>%
          sub(',', '.', .) %>%
          as.numeric() %>%
          ifelse(is.na(.),
                 message('No exchange rate for this date.\n
                          Try another date.'),
                 .)
  # return(rate)
}

#' @param req_date XML with metal exchange rates (see get_metal_xml())
#' @return XML of currency course on request date
#' @noRd
#' @keyword internal
get_currency_xml <- function(req_date) { # date -> xml

  xml <- xml2::read_xml(glue::glue('https://www.cbr.ru/scripts/XML_daily.asp?date_req={req_date}'))
  return(xml)
} # date -> xml

#' @noRd
#' @keyword internal
get_currency_rate <- function(xml, currency) { # xml -> currency code -> numeric

    rate <- xml %>%
            xml2::xml_find_first(glue::glue('//Valute[CharCode[text()="{currency}"]]/Value')) %>%
            xml2::xml_text() %>%
            sub(',', '.', .) %>%
            as.numeric()

    nominal <- xml %>%
               xml2::xml_find_first(glue::glue('//Valute[CharCode[text()="{currency}"]]/Nominal')) %>%
               xml2::xml_text() %>%
               sub(',', '.', .) %>%
               as.numeric()

    return(rate/nominal)
} # xml -> currency code -> numeric

#' @noRd
#' @keyword internal
get_currency_id <- function(currency) { # currency code -> inner CBR currency ID

  currency_id <- currency_reference[currency_reference$ISO_code == currency,
                                    c('parent_code')]
  currency_id
} # currency code -> inner CBR currency ID

#' @noRd
#' @keyword internal
get_currency_ts_xml <- function(id, from, to) { # ID -> Date -> Date -> xml

  xml <- xml2::read_xml(glue::glue('http://www.cbr.ru/scripts/XML_dynamic.asp?date_req1={from}&date_req2={to}&VAL_NM_RQ={id}'))
  xml
} # ID -> Date -> Date -> xml

#' @noRd
#' @keyword internal
get_currency_ts <- function(xml) { # xml -> data.frame

  date <- xml %>%
          xml2::xml_find_all('//Record') %>%
          xml2::xml_attr('Date') %>%
          as.Date(., format = '%d.%m.%Y')

  value <- xml %>%
           xml2::xml_find_all('//Value') %>%
           xml2::xml_text() %>%
           sub(',', '.', .) %>%
           as.numeric()

  nominal <- xml %>%
             xml2::xml_find_all('//Nominal') %>%
             xml2::xml_text() %>%
             as.integer()

  ts <- data.frame(stringsAsFactors = FALSE,
                   date = date,
                   value = value / nominal)
  ts
} # xml -> data.frame

# ---------- utils for CPI -----------------------------
#' @noRd
#' @keyword internal
rowwise_equals <- function(raw_table) { # df -> vector:logical

  rowwise_eq <- vector(mode = 'logical',
                       length = nrow(raw_table))

  for (i in 1:nrow(raw_table)) {
    rowwise_eq[i] <- raw_table[i,] %>%
                      as.character() %>%
                      unique() %>%
                      length(.) == 1
  }

  return(rowwise_eq)
} # df -> vector:logical

#' @noRd
#' @keyword internal
ru_month_to_num <- function(month) { # string -> string
      month = tolower(month)
      ifelse(month == 'январь',   '01',
      ifelse(month == 'февраль',  '02',
      ifelse(month == 'март',     '03',
      ifelse(month == 'апрель',   '04',
      ifelse(month == 'май',      '05',
      ifelse(month == 'июнь',     '06',
      ifelse(month == 'июль',     '07',
      ifelse(month == 'август',   '08',
      ifelse(month == 'сентябрь', '09',
      ifelse(month == 'октябрь',  '10',
      ifelse(month == 'ноябрь',   '11',
      ifelse(month == 'декабрь',  '12',
             'not_a_date'))))))))))))
  } # string -> string

#' @noRd
#' @keyword internal
ru_month_to_en <- function(month) { # string -> string
      month = tolower(month)
      ifelse(month == 'январь',   'january',
      ifelse(month == 'февраль',  'february',
      ifelse(month == 'март',     'march',
      ifelse(month == 'апрель',   'april',
      ifelse(month == 'май',      'may',
      ifelse(month == 'июнь',     'june',
      ifelse(month == 'июль',     'july',
      ifelse(month == 'август',   'august',
      ifelse(month == 'сентябрь', 'september',
      ifelse(month == 'октябрь',  'october',
      ifelse(month == 'ноябрь',   'november',
                                  'december')))))))))))
  } # string -> string

# TODO: add vectorization
#' @noRd
#' @keyword internal
as_CPI_table <- function(raw_table) { # df (dirty) -> df (tidy)

  first_rowwise_eq <- raw_table %>%    # TODO: replace of raw_table name
                      rowwise_equals() %>%
                      which() %>%
                      .[1]

  cpi_table <- raw_table[(first_rowwise_eq + 1):nrow(raw_table), ]

  year <- raw_table[first_rowwise_eq, 1] %>%
          # stringr::str_extract('\\d{4}')
          substr(., 1, 4)

  message(paste0('CPI for ', year, ' year.'))

  month <- ru_month_to_num(cpi_table['X1'])

  # day <- '25' # russian CPI estimating on 21-25 day of each month
  # see: https://www.gks.ru/free_doc/new_site/rosstat/NMS/tezis1.pdf

  date <- paste0(year, '-', month) %>% #, '-', day) %>%
          as.Date()

  cpi_table[2:4] <- cpi_table[2:4] %>%
    apply(., 2,
          function(x) {as.numeric(gsub(',', '.', x))/100})

  cpi_table['X1'] <- date

  names(cpi_table) <- c('date',
                        '2000',
                        'month_prior_year',
                        'prior_month')
  cpi_table
} # df (dirty) -> df (tidy)
