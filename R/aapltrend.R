library(plotly)

library(quantmod)

#'Data Acquisition
#'
#' @param x "AAPL" stocks code, "yahoo" data source
#' @export
x <- invisible(getSymbols("AAPL",src='yahoo'))
x
#'Call the storic trend
#'
#'@param 1.df is a comand to call the storic trend of stocks with cod AAPL 
#'@return all trend storic present in yahoo database order by rows and contains: Date, AAPL.Open, AAPL.High, AAPL Low, AAPL Close, AAPL.Volume, AAPL.Adjusted
#'@export
df <- data.frame(Date=index(AAPL),coredata(AAPL))

#'@param 2.df order data, filter the last 90 rows
#'@return the trend stocks of last 90 days
#'@export
df <- tail(df, 90)
df$ID <- seq.int(nrow(df))

#'Levels stocks
#'
#'@param accumulate_by is the lavels of the stocks by steps
#'@return function(dat, var) {
#'var <- lazyeval::f_eval(var, dat)
#'lvls <- plotly:::getLevels(var)
#'dats <- lapply(seq_along(lvls), function(x) {
#'  cbind(dat[var %in% lvls[seq(1, x)], ], frame = lvls[[x]])
#'})
#'dplyr::bind_rows(dats)
#'}
#'@export
accumulate_by <- function(dat, var) {
  var <- lazyeval::f_eval(var, dat)
  lvls <- plotly:::getLevels(var)
  dats <- lapply(seq_along(lvls), function(x) {
    cbind(dat[var %in% lvls[seq(1, x)], ], frame = lvls[[x]])
  })
  dplyr::bind_rows(dats)
}

df <- df %>%
  accumulate_by(~ID)

aaplt <- ggplot(df,aes(ID, AAPL.Close, frame = frame)) +
  geom_line()

#'Run command
#'
#'@param aaplt we can see fast the Apple stocks trend in last 90 days (title, axis, animation; you can change parameters to have a different visual, slower/faster animation, different values for axes, ecc...)
#'@return closing of Apple stocks in the last 90 days; press "Play" to have funny animation of increase or decrease treand
#'@export
aaplt <- ggplotly(aaplt) %>%
  layout(
    title = "AAPL: Last 90 days",
    yaxis = list(
      title = "Close",
      zeroline = F,
      tickprefix = "$"
    ),
    xaxis = list(
      title = "Day",
      zeroline = F,
      showgrid = F
    )
  ) %>%
  animation_opts(
    frame = 150,
    transition = 0,
    redraw = FALSE
  ) %>%
  animation_slider(
    currentvalue = list(
      prefix = "Day "
    )
  )

aaplt

