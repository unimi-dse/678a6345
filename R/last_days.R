#' Last 90 days of trend
#'
#' @param df
#' @return last 90 days of storic trend of Apple stock (source of data Yahoo Date AAPL.Open AAPL.High AAPL.Low AAPL.Close AAPL.Volume AAPL.Adjusted)
#' @export
#'
#' @examples execute print(last_days()) to see the list
last_days <- function(df)
{
df <- tail(df, 90)
return(df)
}

order_ID <- function(df,ID)
{
df$ID <- seq.int(nrow(df))
return(df&ID)
}

