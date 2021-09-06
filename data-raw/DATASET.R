## code to prepare `DATASET` dataset goes here

usethis::use_data(DATASET, overwrite = TRUE)

# AUXILARY DATA FRAME - currency ISO codes
get_currency_df <- function(currency_ref_xml_url) {
  currency_ref_xml <- currency_ref_xml_url %>% read_xml()
  # check monthly currencies
  if (grepl('\\?d\\=1', currency_ref_xml)){

    currency_reference <- data.frame(stringsAsFactors = FALSE,
      # ISO_code = currency_ref_xml %>% xml_find_all('//ISO_Char_Code') %>% xml_text(),
      nominal = currency_ref_xml %>% xml_find_all('//Nominal') %>% xml_text() %>% as.integer(),
      en_name = currency_ref_xml %>% xml_find_all('//EngName') %>% xml_text(),
      # ISO_num_code = currency_ref_xml %>% xml_find_all('//ISO_Num_Code') %>% xml_text(),
      cbr_ID = currency_ref_xml %>% xml_find_all('//Item') %>% xml_attr('ID'),
      parent_code = currency_ref_xml %>% xml_find_all('//ParentCode') %>% xml_text() %>% trimws(),
      ru_name = currency_ref_xml %>% xml_find_all('//Name') %>% xml_text()
    )
  } else {

    currency_reference <- data.frame(stringsAsFactors = FALSE,
      ISO_code = currency_ref_xml %>% xml_find_all('//ISO_Char_Code') %>% xml_text(),
      nominal = currency_ref_xml %>% xml_find_all('//Nominal') %>% xml_text() %>% as.integer(),
      en_name = currency_ref_xml %>% xml_find_all('//EngName') %>% xml_text(),
      ISO_num_code = currency_ref_xml %>% xml_find_all('//ISO_Num_Code') %>% xml_text(),
      cbr_ID = currency_ref_xml %>% xml_find_all('//Item') %>% xml_attr('ID'),
      parent_code = currency_ref_xml %>% xml_find_all('//ParentCode') %>% xml_text() %>% trimws(),
      ru_name = currency_ref_xml %>% xml_find_all('//Name') %>% xml_text()
    )
   }
  # NOTE: ISO codes not used in monthly currencies
  return(currency_reference)
} # XML -> df

currency_reference <- get_currency_df('https://www.cbr.ru/scripts/XML_valFull.asp')

# daily_currency_ref <- 'https://www.cbr.ru/scripts/XML_valFull.asp' %>%
#                       read_xml() %>%
#                       get_currency_df()
#
# monthly_currency_ref <- 'https://www.cbr.ru/scripts/XML_val.asp?d=1' %>%
#                         read_xml() %>%
#                         get_currency_df()

# TODO: исследовать пропуски во временных рядах курсов,
# указанных внизу страницы запросов:
# 'https://www.cbr.ru/currency_base/dynamics/?UniDbQuery.Posted=True&UniDbQuery.so=1&UniDbQuery.mode=1&UniDbQuery.date_req1=&UniDbQuery.date_req2=&UniDbQuery.VAL_NM_RQ=R01265&UniDbQuery.From=08.08.2008&UniDbQuery.To=04.09.2021

# Список примеров к XML API
# 'http://www.cbr.ru/development/SXML/'

# Курсы валют к доллару США на заданную дату.
# Предоставлены агентством «Thomson Reuters»
# 'https://cbr.ru/hd_base/seldomc/sc_daily/?UniDbQuery.To=02.08.2014&UniDbQuery.To=02.08.2015'

# Официальные курсы валют на заданную дату,
# устанавливаемые ежемесячно (до 11.01.2010)
# 'https://cbr.ru/currency_base/monthly/?UniDbQuery.Posted=True&UniDbQuery.To=01.2010'

# Официальные курсы Госбанка СССР
# https://cbr.ru/currency_base/GosBankCurs/
