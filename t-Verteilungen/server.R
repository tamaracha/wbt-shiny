library("shiny")
library("ggvis")
Mittelwertunterschiede <- seq(-5.5,5.5,by=0.01)
Normal <- dnorm(Mittelwertunterschiede)
DF <- data.frame(Mittelwertunterschiede, Normal)
shinyServer(function(input, output) {
T <- reactive(dt(DF$Mittelwertunterschiede,input$DF))
DF %>%
ggvis(~Mittelwertunterschiede, T) %>%
layer_lines() %>%
layer_lines(y = ~Normal, strokeDash := c(5,1)) %>%
scale_numeric("x",domain=c(-5,5)) %>%
add_axis(
	"x",
	ticks = 11,
	subdivide = 4,
	tick_size_major = 10,
	tick_size_minor = 5,
	tick_size_end = 15
) %>%
add_axis(
	"y",
	title = "Dichte",
	title_offset = -20,
	ticks = 9,
	subdivide = 4,
	tick_size_major = 10,
	tick_size_minor = 5,
	tick_size_end = 15
) %>%
bind_shiny("plot")
})