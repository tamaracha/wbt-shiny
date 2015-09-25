shinyUI(
fluidPage(
sidebarLayout(
sidebarPanel(
downloadLink("downloaddata","Daten downloaden")
),
mainPanel(
tableOutput("data")
)
)
)
)