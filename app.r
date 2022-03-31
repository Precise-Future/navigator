source('global.r')
ui <- bootstrapPage(
  MainContent('mainOut')
)

server <- function(input, output, session) {
  
  session$userData$service <- reactiveVal()
  session$userData$process <- reactiveVal()
  session$userData$activity <- reactiveVal()
  
  
  MainContentServer('mainOut')
}

shinyApp(ui, server)

