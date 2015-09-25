library("shiny")
library("ggvis")
X <- seq(-10,10,length=501)

shinyServer(function(input, output) {
  df <- reactive({
    data.frame(
      x=X,
      y=dnorm(X,input$mu,input$sigma)
    )
  })
  df %>%
  ggvis(~x, ~y) %>%
  layer_lines() %>%
  scale_numeric(
    property = 'y',
    domain = c(0,1)
  ) %>%
  add_axis("x",title = "Quantile", ticks = 20, subdivide = 1) %>%
  add_axis("y", title = "Dichte") %>%
  bind_shiny("T")
})