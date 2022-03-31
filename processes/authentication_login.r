AuthLogin <- function(id) {
  ns <- NS(id)
  uiOutput(ns('activityOut'))
}

AuthLoginServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      print(navigator('breadcrumbs'))
      navigator('navigate', activity, 'Validar acceso', session)
      
      observeEvent(activity(), {
        switch (
          activity(),
          'Validar acceso' = AuthValidarAccesoServer('validarAccesoOut'),
          print('No se reconoce la ruta')
        )
      })
      
      ns <- session$ns
      output$activityOut <- renderUI({
        switch (
          activity(),
          'Validar acceso' = AuthValidarAcceso(ns('validarAccesoOut')),
          Error404(navigator('breadcrumbs'))
        )
      })
    }
  )
  
}