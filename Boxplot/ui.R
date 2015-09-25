shinyUI(
fluidPage(
sidebarLayout(
sidebarPanel(
radioButtons(
inputId="Gruppe",
label="Gruppierung",
choices=c("Zeitpunkt","Trainingsform")
),
radioButtons(
	inputId="flip",
	label="Ausrichtung",
	choices=c("vertikal","horizontal")
),
downloadLink("downloaddata","Daten downloaden")
),
mainPanel(tabsetPanel(
tabPanel("Boxplot",
plotOutput("boxplot"),
p("Die Denktrainingsdaten als Boxplot")
),
tabPanel("Daten",
tableOutput("data")
)
))
)
)
)