source('global.r')
ui <- bootstrapPage(
  MainContent('mainOut')
)

server <- function(input, output, session) {
  MainContentServer('mainOut')
}

shinyApp(ui, server)

