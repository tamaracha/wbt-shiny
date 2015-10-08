library("shiny")
library("ggvis")
Quantile <- seq(-10.5,10.5,by=0.05)

shinyServer(function(input, output) {
  DF <- reactive(
    data.frame(
      Quantile,
      Dichte=dnorm(Quantile,input$mu,input$sigma)
    )
  )
  DF %>%
  ggvis(~Quantile, ~Dichte) %>%
  layer_lines() %>%
  scale_numeric(
    'x',
    domain = c(-10,10)
  ) %>%
  scale_numeric(
    'y',
    domain = c(0,1)
  ) %>%
  add_axis(
    "x",
    subdivide = 3,
    tick_size_end = 15,
    tick_size_major = 10,
    tick_size_minor = 5
  ) %>%
  add_axis(
    "y",
    title_offset = -20,
    subdivide = 3,
    tick_size_end = 15,
    tick_size_major = 10,
    tick_size_minor = 5
  ) %>%
  bind_shiny("T")
})