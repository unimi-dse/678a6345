#' Data acquisition
#'
#' @param df data frame (apple stocks)
#' @return total storic trend of Apple stock (source of data Yahoo Date AAPL.Open AAPL.High AAPL.Low AAPL.Close AAPL.Volume AAPL.Adjusted)
#' @export
data_acquisition <- function(df)
{
quantmod::getSymbols("AAPL",src='yahoo')

df <- data.frame(Date=index(AAPL),coredata(AAPL))
return(df)
}
