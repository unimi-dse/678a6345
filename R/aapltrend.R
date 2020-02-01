#' Apple Stocks trend
#' 
#' Press "p" to call fast Apple stocks trend for last 30 days
#' @return Apple stocks trend updated for last 30 days
library(plotly)

library(quantmod)

invisible(getSymbols("AAPL",src='yahoo'))

df <- data.frame(Date=index(AAPL),coredata(AAPL))
df <- tail(df, 30)
df$ID <- seq.int(nrow(df))

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
