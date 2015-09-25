shinyUI(
fluidPage(
sidebarLayout(
sidebarPanel(
downloadButton("downloaddata","Daten downloaden")
),
mainPanel(tabsetPanel(
tabPanel("Mittelwerte",
	plotOutput("P")
),
tabPanel("Datensatz",tableOutput("data"))
))
)
)
)