#' Graph building
#' @param accumulate_by  accumulate by var, levels, dats
#' @param aaplt build of the graphic
#' @param df data frame accumalte by ID
#' @return Animation graphic, with "play" bottom; write aaplt to Viewer
#' @export
create_graph <- function(accumulate_by, df, aaplt)
{
aapltrend::last_days(df)

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

aaplt <- ggplot(df,aes(ID, AAPL.Close, frame = frame)) +
  geom_line()

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

return(aaplt)
}
