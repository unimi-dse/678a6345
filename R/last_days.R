#' Last 90 days of trend
#'
#' @param last_days 
#'
#' @return last 90 days of storic trend of Apple stock (source of data Yahoo Date AAPL.Open AAPL.High AAPL.Low AAPL.Close AAPL.Volume AAPL.Adjusted)
#' @export
#'
#' @examples execute print(last_days()) to see the list
last_days <- function(last_days){
df <- tail(df, 90)
}

