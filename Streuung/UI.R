library(shiny)

shinyUI(fluidPage(
	withMathJax(),
	sidebarLayout(
	sidebarPanel(
		actionButton("neu","neue Stichprobe ziehen"),
		numericInput(
			inputId="n",
			label="Stichprobengröße (\\(n\\))",
			value=7,
			min=7,
			max=12
		),
		uiOutput("nHelp"),
		numericInput(
			inputId="mw",
			label="Mittelwert (\\(\\overline{x}\\))",
			value=0,
			step=0.01,
			min=0,
			max=10
		),
		uiOutput("mwHelp"),
		numericInput(
			inputId="Summe",
			label="Summe der quadrierten Abweichungen (\\(\\sum _{i=1} ^n {(x_i - \\overline{x})^2}\\))",
			value=0,
			min=0,
			max=500
		),
		uiOutput("SummeHelp"),
		numericInput(
			inputId="varianz",
			label="Varianz (\\(s^2\\))",
			value=0,
			min=0,
			max=50,
			step=0.01
		),
		uiOutput("varHelp"),
		numericInput(
			inputId="sd",
			label="Standardabweichung (\\(\\sqrt{s^2}\\))",
			value=0,
			min=0,
			max=20,
			step=0.01
		),
		uiOutput("sdHelp"),
		actionButton("updatehelp","Eingaben überprüfen")
	),
	mainPanel(
	tableOutput("tabelle")
	)
	)
))