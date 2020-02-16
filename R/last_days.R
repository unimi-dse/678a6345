#' Last 90 days of trend
#'
#' @param df data frame with last 90 rows
#' @return last 90 days of storic trend of Apple stock (source of data Yahoo Date AAPL.Open AAPL.High AAPL.Low AAPL.Close AAPL.Volume AAPL.Adjusted)
#' @export
last_days <- function(df)
{
aapltrend::data_acquisition(df)

df <- tail(df, 90)

return(df)
}
