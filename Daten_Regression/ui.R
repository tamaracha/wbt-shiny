shinyUI(
fluidPage(
title="Daten_Regression",
sidebarLayout(
sidebarPanel(
downloadButton("downloaddata","Daten downloaden")
),
mainPanel(tabsetPanel(
tabPanel("Scatterplot",
	plotOutput("P"),
	p("Denktrainingsdaten als Scatterplot")
),
tabPanel("Datensatz",tableOutput("data"))
))
)
)
)