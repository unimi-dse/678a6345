#' Graph building
#'
#' @param graph 
#'
#' @return Animation graphic, with "play" bottom; write aaplt to Viewer 
#' @export
graph <- function(graph) {
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
aaplt
}

