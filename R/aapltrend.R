
library(plotly)

library(quantmod)

library(roxygen2)

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

df <- tail(df, 30)
df$ID <- seq.int(nrow(df))

#'@param x is the lavels of the stocks by steps
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

p <- ggplot(df,aes(ID, AAPL.Close, frame = frame)) +
  geom_line()

p <- ggplotly(p) %>%
  layout(
    title = "AAPL: Last 30 days",
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
    frame = 100,
    transition = 0,
    redraw = FALSE
  ) %>%
  animation_slider(
    currentvalue = list(
      prefix = "Day "
    )
  )

p
