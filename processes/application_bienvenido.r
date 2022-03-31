AppBienvenido <- function(id) {
  ns <- NS(id)
  uiOutput(ns('activityOut'))
  
}
AppBienvenidoServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      
      print(navigator('breadcrumbs', session = session))
      navigator('navigate', 'activity', 'Bienvenido default', session)
      
      observeEvent(session$userData$activity(), {
        switch (
          session$userData$activity(),
          'Bienvenido default' = AppBienvenidoDefaultServer('bienvenidoOut'),
          print('Ruta desconocida')
        )
      })
      
      ns <- session$ns
      output$activityOut <- renderUI({
        switch (
          session$userData$activity(),
          'Bienvenido default' = AppBienvenidoDefault(ns('bienvenidoOut')),
          Error404(navigator('breadcrumbs', session))
        )
      })
    }
  )
}
