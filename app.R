library(shiny)
library(shiny.synapse.react.client)

ui <- fluidPage(
  titlePanel("reactR HTMLWidget Example"),
  user_cardOutput('widgetOutput')
)

server <- function(input, output, session) {
  output$widgetOutput <- renderUser_card(
    user_card("Hello world!")
  )
}

shinyApp(ui, server)
