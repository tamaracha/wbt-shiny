library(shiny)
library("ggvis")

fluidPage(
  title = "Korrelation",
  sidebarLayout(
    sidebarPanel(
      numericInput(
        inputId = "R",
        label = "Korrelationskoeffizient:",
        value = 0,
        min = -0.9,
        max = 0.9,
        step = 0.1
      ),
      uiOutput("plot_ui")
    ),
    mainPanel(
      tabsetPanel(
        tabPanel(
          "Scatterplot",
          tags$figure(
            ggvisOutput("plot"),
            textOutput("figCaption",tags$figcaption)
          )
        ),
        tabPanel(
          "Rohwerte",
          tableOutput("T")
        )
      )
    )
  )
)
