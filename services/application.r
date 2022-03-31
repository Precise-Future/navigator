App <- function(id) {
  ns <- NS(id)
  uiOutput(ns('processOut'))
}

AppServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      print(navigator('breadcrumbs', session = session))
      navigator('navigate', 'process', 'Bienvenido', session)
      
      
      observeEvent(session$userData$process(), {
        switch (
          session$userData$process(),
          'Bienvenido' = AppBienvenidoServer('bienvenidoOut'),
          print('No se encuentra la ruta')
        )
      })
      
      ns <- session$ns
      output$processOut <- renderUI({
        switch (
          session$userData$process(),
          'Bienvenido' = AppBienvenido(ns('bienvenidoOut')),
          Error404(navigator('breadcrumbs', session))
        )
      })
    }
  )
}
