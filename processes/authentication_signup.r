AuthSignup <- function(id) {
  ns <- NS(id)
  uiOutput(ns('activityOut'))
}

AuthSignupServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      print(navigator('breadcrumbs', session = session))
      navigator('navigate', 'activity', 'Crear usuario', session)
      
      observeEvent(session$userData$activity(), {
        switch (
          session$userData$activity(),
          'Crear usuario' = AuthCrearUsuarioServer('crearUsuarioOut'),
          print('No se reconoce la ruta')
        )
      })
      
      ns <- session$ns
      output$activityOut <- renderUI({
        switch (
          session$userData$activity(),
          'Crear usuario' = AuthCrearUsuario(ns('crearUsuarioOut')),
          Error404(navigator('breadcrumbs', session = session))
        )
      })
    }
  )
  
}
