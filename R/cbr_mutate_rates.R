
#' Mutate column of RUB exchange rates with respect to
#' currency and date of exchange
#'
#' @param df data frame with currencies and dates
#' @param x.date [char] name of column with dates in df
#' @param x.currency [char] name of column with currencies in df
#' @param handleNA [bool] handle missing exchange rates (NA) by using previous available exchange date
#' @param instead_date_col name of column with RUB exchange previous dates
#' @param rub_rate_col name of column with RUB exchange rates
#' @return data frame with mutated column of RUB exchange rates
#' @export
cbr_mutate_rates <- function(df,
                             x.date = 'date',
                             x.currency = 'currency',
                             handleNA = FALSE,
                             instead_date_col = 'instead_date',
                             rub_rate_col = 'rub_rate') {
  # check params
  if(tail(class(df), 1) != 'data.frame') stop('Taken object not data.frame')
  if(!x.date %in% names(df) | !x.currency %in% names(df)) stop('Incorrect merge colnames')
  if(rub_rate_col %in% names(df)) stop('Colname "rub_rate" already exists. Try another name.')
  if(handleNA & instead_date_col %in% names(df)) stop('Colname "instead_date_col" already exists. Try another name.')

  # args
  instead_date = instead_date_col
  rub_rate = rub_rate_col
  date = x.date
  currency = x.currency

  df_type = class(df)[1]         # data.frame , tibble or data.table
  cur_set <- unique(df[[currency]]) # get currencies in df

  cur_p <- lapply(cur_set,       # get request dates of each currency
                  function(x){df[df$currency == x, ]})

    cur_list <- lapply(cur_p,      # get max & min date for each currency
                       function(x){c(x$currency[1],
                                        as.character(min(x$date) - 15),
                                        as.character(max(x$date)))})
  names(cur_p) <- cur_set
  names(cur_list) <- cur_set

  get_currencies <- function(cur_list,
                             delay = Sys.sleep(2)) {
    aux_list <- list()

    for (i in seq_along(cur_list)) {

      delay
      aux_list[[i]] <- cbr_currency_ts(cur_list[[i]][1],
                                       cur_list[[i]][2],
                                       cur_list[[i]][3])
    }
    names(aux_list) <- names(cur_list)
    return(aux_list)
  }

  cur_dfs <- get_currencies(cur_list = cur_list)

  join_currencies <- function(df,
                              cur_dfs,
                              handleNA = FALSE) {

    for (i in 1:length(cur_dfs)) {

      cur_dfs[[i]]$currency <- cur_set[i]
    }

    cur_df_long <- do.call('rbind', cur_dfs)

    df$id <- 1:nrow(df)
    joined_df <- # df %>% # `<-`(df$id, 1:nrow(df)) %>%
                 merge(x = df, y = cur_df_long,    # left join
                        by.x = c(date, currency),
                        by.y = c(date, currency),
                        all.x = TRUE, sort = FALSE) %>%
                 .[order(.$id), ] %>%     # make original row ordering
                 `$<-`(id, NULL)          # remove id column
    rm(cur_df_long)

    NAs <- nrow(joined_df[is.na(joined_df$value),])

    message(paste0('\nThere\'re ', NAs, ' NAs out of ', nrow(joined_df),
                   ' rows in exchange rates.\n(',
                   { {NAs / nrow(joined_df)} %>%
                      round(., digits = 2) * 100 }, '% of all)'))

    # Handling 'handleNA' option
    if (!handleNA) {

      return(joined_df)

    } else if (nrow(joined_df[is.na(joined_df$value),]) == 0) {

      message('Exchange rates without NAs.')
      return(joined_df)

    } else {

      joined_df$instead_date <- NA %>% as.Date()

      for (i in 1:nrow(joined_df)) {

        if (!is.na(joined_df$value[i])) {

          next

        } else {

          na_date <- joined_df$date[i] %>% as.character()
          valute <- joined_df$currency[i]
          # IMPORTANT NOTE: use squared braces for avoiding
          # 'subsetting length zero' ERROR with '$' subsetting.
          previous_rate <- cur_dfs[[valute]][cur_dfs[[valute]]['date'] < na_date,] %>%
                           tail(1)
          joined_df$value[i] <- previous_rate$value[1]
          joined_df$instead_date[i] <- as.character(previous_rate$date[1])
        }
      }

      NAs <- nrow(joined_df[is.na(joined_df$value),])

      if(NAs == 0) {
        message('\nAll missing values successfully processing\n')
      } else {
        message(paste0('\nNA processing...\n\n',
                       NAs, ' NAs of exchange rates can\'t been processed.\n'))
      }

      message(paste0('Created "', instead_date,
                     '" column for replaced dates storing.'))

      return(joined_df)
    }
  }

  joined_df <- join_currencies(df = df,
                               cur_dfs = cur_dfs,
                               handleNA = handleNA)

  colnames(joined_df)[colnames(joined_df) == 'value'] <- rub_rate

  joined_df <- if(df_type == 'tbl_df')
                { tibble::as_tibble(joined_df) } else { joined_df }

  rm(cur_dfs, rub_rate, rub_rate_col, instead_date, instead_date_col)
  return(joined_df)
}
