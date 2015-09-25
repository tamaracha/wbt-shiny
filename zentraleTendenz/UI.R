library(shiny)

shinyUI(fluidPage(
withMathJax(),
sidebarLayout(
	sidebarPanel(
		actionButton("neu","neue Stichprobe ziehen"),
		radioButtons(
			inputId="aufgabe",
			label="Aufgabentyp",
			choices=c("Summenzeichen","Mittelwert","Median")
		),
		numericInput(
			inputId="n",
			label="Stichprobengröße (\\(n\\))",
			value=7,
			min=7,
			max=12
		),
		uiOutput("nHelp"),
		conditionalPanel(
			condition="input.aufgabe=='Summenzeichen'",
			selectInput(
				inputId="Summenaufgabe",
				label="Summenaufgabe",
				choices=c(
					"\\(\\sum _{i=1} ^n {x_i}\\)"=0,
					"\\(\\sum _{i=2} ^n {x_i}\\)"=1,
					"\\(\\sum _{i=1} ^{n-1} {x_i}\\)"=2
				),
				selectize=F
			),
			numericInput(
				inputId="summe2",
				label="Summe",
				value=0,
				min=0,
				max=120
			),
			uiOutput("summe2Help")
		),
		conditionalPanel(
			condition="input.aufgabe=='Mittelwert'",
			numericInput(
				inputId="Summe",
				label="Summe (\\(\\sum _{i=1} ^n {x_i}\\))",
				value=0,
				min=0,
				max=120
			),
			uiOutput("SummeHelp"),
			numericInput(
				inputId="mw",
				label="Mittelwert (\\(\\overline{x}\\))",
				value=0,
				step=0.01,
				min=0,
				max=10
			),
			uiOutput("mwHelp")
		),
		conditionalPanel(
			condition="input.aufgabe=='Median'",
			actionButton("sort","Werte nach Größe sortieren"),
			radioButtons(
				inputId="oddeven",
				label="gerade oder ungerade Stichprobengröße",
				choices=c("gerade"=0,"ungerade"=1,"unentschieden"=2),
				selected=2
			),
			uiOutput("oddevenHelp"),
			conditionalPanel(
				condition="input.oddeven==0",
				sliderInput(
					inputId="mdrange",
					label="beide rangmittleren werte",
					value=c(1,10),
					min=1,
					max=10,
					locale="de"
				),
				uiOutput("mdrangeHelp")
			),
			conditionalPanel(
				condition="input.oddeven!=2",
				numericInput(
					inputId="md",
					label="Median",
					value=0,
					min=0,
					max=10,
					step=0.1
				),
				uiOutput("mdHelp")
			)
		),
		actionButton(
			inputId="updatehelp",
			label="Eingaben überprüfen"
		)
	),
	mainPanel(
		tableOutput("tabelle")
	)
)))