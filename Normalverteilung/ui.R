library("shiny")
library("ggvis")

fluidPage(
	title = "Normalverteilung",
	withMathJax(),
	sidebarLayout(
	sidebarPanel(
		numericInput(
			"mu",
			"Mittelwert",
			0,
			-10,
			10
		),
		numericInput(
			"sigma",
			"Standardabweichung",
			1,
			0.4,
			5,
			0.1
		)
	),
	mainPanel(
		tags$figure(
			ggvisOutput("T"),
			tags$figcaption("Eine Normalverteilung mit einstellbarem Mittelwert (\\(\\mu\\)) und Standardabweichung (\\(\\sigma\\))")
		)
	)
	)
)
