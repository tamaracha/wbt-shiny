library(shiny)

shinyUI(fluidPage(
	sidebarLayout(
	sidebarPanel(
		radioButtons(
			inputId="grafik",
			label="Grafische Darstellungsformen von Häufigkeitsverteilungen",
			choices=c(
				"Histogramm"="histogram",
				"Polygonzug"="freqpoly"
			)
		),
		sliderInput(
			inputId="Klassenbreite",
			label="Breite der Kategorien",
			value=10,
			min=1,
			max=100
		),
		numericInput(
			inputId="N",
			label="Stichprobengröße",
			value="500",
			min=1,
			max=1000,
			step=1
		),
		numericInput(
			inputId="Var",
			label="Standardabweichung der Stichprobe",
			value=10,
			min=5,
			max=15,
			step=0.5
		)
	),
	mainPanel(
		plotOutput("grafik")
	)
)
))