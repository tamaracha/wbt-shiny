library(shiny)

fluidPage(
	title = "Integrale",
	withMathJax(),
	sidebarLayout(
	sidebarPanel(
		sliderInput(
			inputId="integral",
			label="Integralgrenzen",
			value=c(40,60),
			min=0,
			max=100
		)
	),
	mainPanel(
		HTML("<p>Die T-Verteilung ist eine Normalverteilung mit $$μ = 50$$ und $$σ = 10$$. Wegen ihrer angenehmen Handhabung ist sie in der pädagogisch-psychologischen Diagnostik öfters anzutreffen.</p>"),
		plotOutput("t"),
		tags$dl(
			tags$dt("ausgewähltes Integral"),tags$dd(textOutput("IR")),
			tags$dt("Flächenanteil"),tags$dd(textOutput("IP"))
		)
	)
	)
)