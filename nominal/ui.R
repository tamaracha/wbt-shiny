library(shiny)

shinyUI(fluidPage(
	title="nominal",
	sidebarLayout(
	sidebarPanel(
		actionButton(
			inputId="neu",
			label="neue Stichprobe ziehen"
		)
	),
	mainPanel(tabsetPanel(
		tabPanel("Kreisdiagramm",
			plotOutput("tortenPlot"),
			p("Häufigkeitsverteilung der Schokoladenppräferenz von 100 Personen")
		),
		tabPanel("Stapeldiagramm",
			plotOutput("stapelPlot"),
			p("Häufigkeitsverteilung der Schokoladenppräferenz von 100 Personen")
		),
		tabPanel("Werte",
			tableOutput("werte")
		)
	))
)))