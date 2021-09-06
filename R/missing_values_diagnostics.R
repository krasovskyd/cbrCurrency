
# currency missing diagnostics

# TODO: исследовать пропуски во временных рядах курсов,
# указанных внизу страницы запросов:
# 'https://www.cbr.ru/currency_base/dynamics/?UniDbQuery.Posted=True&UniDbQuery.so=1&UniDbQuery.mode=1&UniDbQuery.date_req1=&UniDbQuery.date_req2=&UniDbQuery.VAL_NM_RQ=R01265&UniDbQuery.From=08.08.2008&UniDbQuery.To=04.09.2021


### --- Collecting periods of currency exchange rates --- ###
########################################################
# library(xml2)
# library(stringr)
#
# explore_missings <- function(parent_code){
#
#   url <- paste0('https://www.cbr.ru/currency_base/dynamics/',
#                 '?UniDbQuery.Posted=True&UniDbQuery.so=1&UniDbQuery.mode=1&',
#                 'UniDbQuery.date_req1=&UniDbQuery.date_req2=&',
#                 'UniDbQuery.VAL_NM_RQ=', parent_code,'&',
#                 'UniDbQuery.From=08.08.2020&UniDbQuery.To=04.09.2021')
#
#   page <- read_html(url)
#
#   extract_history <- function(string){
#
#     name <- str_extract(string, '(.*)(?=\\()') %>% str_squish()
#     code <- str_extract(string, '(?<=\\()(.*)(?=\\))') %>%
#               str_split(., ', ') %>% unlist()
#     time <- str_extract_all(string, '\\d{2}\\.\\d{2}\\.\\d{4}') %>% unlist()
#
#     df <- data.frame(stringsAsFactors = FALSE,
#                      name = name,
#                      iso_code = code[1],
#                      num_code = code[2],
#                      from = time[1],
#                      to = time[2])
#     return(df)
#   }
#
#   history <- page %>%
#     xml_find_all('//*[@class="table-caption"]/div') %>%
#     xml_text() %>% lapply(., extract_history) %>%
#     do.call(rbind, .)
#
#   rows <- nrow(history)
#   if(!is.null(history)) {
#       history <- cbind(history,
#                        data.frame(parent_code = rep(parent_code,
#                                                     rows)))
#     }
#
#   Sys.sleep(1)
#   message(paste0(parent_code, ' -- ', history$name, ': collected'))
#   return(history)
# }
#
# # collect currencies period
# daily_cur_hist <- daily_currency_ref$parent_code %>%
#                     lapply(., explore_missings) %>%
#                     do.call(rbind, .)
#
# daily_cur_hist$parent_code <- as.character(daily_cur_hist$parent_code)
# daily_cur_hist$num_code <- as.integer(daily_cur_hist$num_code)
# daily_cur_hist[c('from', 'to')] <- mapply(as.Date,
#                                           daily_cur_hist[c('from', 'to')],
#                                          '%d.%m.%Y',
#                                          SIMPLIFY = FALSE)
# ### --- --- --- --- --- --- --- --- --- --- --- --- ###
#
#
# hst_info <- function(daily_cur_hist, daily_currency_ref){
#
#     n_par_code <- length(unique(daily_cur_hist$parent_code))
#     print(paste0('Missed currencies: ',
#                  abs(nrow(daily_currency_ref) - n_par_code),
#                  '\nMissed currencies:'))
#
#     print(anti_join(daily_currency_ref[c('ru_name', 'parent_code')],
#                     daily_cur_hist['parent_code']))
# }
#
# hst_info(daily_cur_hist, daily_currency_ref)
#
#
# ### --- Cleaning df --- ###
# unique(daily_cur_hist$parent_code[duplicated(daily_cur_hist$parent_code)])
#
# rem_dups <- function(df, key){
#   # find duplicated keys
#   keys <- unique(df[[key]][duplicated(df[[key]])])
#
#
# }
#
# rem_dups(daily_cur_hist, 'parent_code') -> dupz
#
# # subset data frame of duplicates
# daily_cur_hist[daily_cur_hist$parent_code %in% rem_dups(daily_cur_hist, 'parent_code'),]
#
# dups <- daily_cur_hist[daily_cur_hist$parent_code %in% rem_dups(daily_cur_hist, 'parent_code'),] %>%
#           .[!duplicated(.),]
#
# puds <- dups[dups$parent_code == dupz[8],] %>% .[[1]]
# outer(puds, puds, Vectorize(all.equal))
#
# # lapply(dupz, function(x){
# #   puds <- dups[dups$parent_code == x,] %>% .[[1]]
# #   outer(puds, puds, Vectorize(all.equal))
# # })
# lapply(dupz, function(x){
#
#   puds <- dups[dups$parent_code == x,] %>% .[[1]]
#   outer(puds, puds, Vectorize(stringdist::stringdist))
# })
#
# dups$name_len <- nchar(dups$name)
#
# dups[dups$parent_code == dupz[8],] %>% .$from %>% min()
# dups[dups$parent_code == dupz[8],] %>% .$to %>% max()
##########################################################
# rm(uq, ohw)
# rm(dups, explore_missings, rem_dups, dupz, puds)
