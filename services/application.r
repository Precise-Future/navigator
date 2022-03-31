App <- function(id) {
  ns <- NS(id)
  uiOutput(ns('processOut'))
}

AppServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      print(navigator('breadcrumbs'))
      navigator('navigate', process, 'Bienvenido', session)
      
      
      observeEvent(process(), {
        switch (
          process(),
          'Bienvenido' = AppBienvenidoServer('bienvenidoOut'),
          print('No se encuentra la ruta')
        )
      })
      
      ns <- session$ns
      output$processOut <- renderUI({
        switch (
          process(),
          'Bienvenido' = AppBienvenido(ns('bienvenidoOut')),
          Error404(navigator('breadcrumbs'))
        )
      })
    }
  )
}