library(plotly)
library(quantmod)

#' Data acquisition
#' @param data_acquisition data acquisition, cod stocks: AAPL, source: yahoo
#' @return total storic trend of Apple stock (source of data Yahoo Date AAPL.Open AAPL.High AAPL.Low AAPL.Close AAPL.Volume AAPL.Adjusted)
#' @export
#'
#' @examples execute print(data_acquisition()) to see the list
data_acquisition <- function(data_acquisition) {
invisible(getSymbols("AAPL",src='yahoo'))

df <- data.frame(Date=index(AAPL),coredata(AAPL))
}
