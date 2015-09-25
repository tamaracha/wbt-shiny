library("shiny")
library("ecodist")
library("ggvis")

shinyServer(function(input, output) {
	Random<-reactive(
	data.frame(corgen(
		x=rnorm(30),
		r=input$R,
		epsilon=0.01,
		population=F
	))*15 +100
	)
	Random %>%
	ggvis(~x, ~y) %>%
	add_axis("x", title = "Prädiktor") %>%
	add_axis("y", title = "Kriterium") %>%
	layer_points() %>%
	layer_model_predictions(
		model = input_select(
			c(linear="lm", "lokale Anpassung"="loess"),
			label="Regressionsverfahren"
		),
		formula = y~x
	) %>%
	bind_shiny("plot", "plot_ui")
	output$figCaption <- renderText({
		c(nrow(Random()), " zufallsgenerierte Messpunkte, deren X- und Y-Werte jeweils normalverteilt (m = 100, sd = 15) und entsprechend dem eingegebenen Korrelationskoeffizienten (r = ", input$R, ") miteinander korreliert sind. Die Korrelation der Messwerte kann um bis zu ± 0.01 von der eingegebenen abweichen.")
	})
	output$T<-renderTable(
		Random(),
		digits=2,
		caption='Die X- und Y-Werte der erzeugten Messpunkte',
		caption.placement = 'top'
	)
})