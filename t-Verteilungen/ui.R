library(shiny)
library("ggvis")

fluidPage(
	title = "t-Verteilung",
	withMathJax(),
	sidebarLayout(
	sidebarPanel(
		numericInput(
			inputId="DF",
			label="Freiheitsgrade",
			value=1,
			min=1,
			max=30,
			step=1
		),
		helpText("Je mehr Freiheitsgrade, desto mehr Ähnlichkeit zur Normalverteilung")
	),
	mainPanel(
		tags$figure(
			ggvisOutput("plot"),
			tags$figcaption("Eine \\(t\\)-Verteilung mit einstellbaren Freiheitsgraden")
		)
	)
	)
)