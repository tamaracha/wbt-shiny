library(shiny)

shinyUI(fluidPage(
	title="ordinal",
	sidebarLayout(
	sidebarPanel(
		actionButton(
			inputId="neu",
			label="neue Stichprobe ziehen"
		),
		radioButtons(
			inputId="flip",
			label="Ausrichtung um 90° drehen",
			choices=c("Säulen","Balken")
		),
		radioButtons(
			inputId="fill",
			label="durch die Farbe dargestellte Information",
			choices=c(
				"Noten"="Note",
				"Schokolade"="Schokolade",
				"keine"="'#DD8888'"
			),
			selected="'#DD8888'"
		),
		radioButtons(
			inputId="x",
			label="durch die kategoriale Achse dargestellte Information",
			choices=c(
				"Noten"="Note",
				"Schokolade"="Schokolade",
				"keine"="factor(1)"
			)
		),
		radioButtons(
			inputId="pos",
			label="Anordnung der farbigen Teilbereiche",
			choices=c(
				"absolute Häufigkeiten"="stack",
				"relative Häufigkeiten"="fill",
				"nebeneinander"="dodge"
			)
		)
	),
	mainPanel(tabsetPanel(
		tabPanel("Balkendiagramm",
			plotOutput("balkenPlot"),
			p("Häufigkeitsverteilung der letzten Klausurnoten und der Schokoladenpräferenz von 100 Personen")
		),
		tabPanel("Werte",
			tableOutput("werte")
		)
	)))
))