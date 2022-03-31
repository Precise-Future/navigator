AppBienvenido <- function(id) {
  ns <- NS(id)
  uiOutput(ns('activityOut'))
  
}
AppBienvenidoServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      
      print(navigator('breadcrumbs'))
      navigator('navigate', activity, 'Bienvenido default')
      
      observeEvent(process(), {
        switch (
          activity(),
          'Bienvenido default' = AppBienvenidoDefaultServer('bienvenidoOut'),
          print('Ruta desconocida')
        )
      })
      
      ns <- session$ns
      output$activityOut <- renderUI({
        switch (
          activity(),
          'Bienvenido default' = AppBienvenidoDefault(ns('bienvenidoOut')),
          Error404(navigator('breadcrumbs'))
        )
      })
    }
  )
}