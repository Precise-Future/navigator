Authenticate <- function(id) {
  ns <- NS(id)
  uiOutput(ns('processOut'))
}

AuthenticateServer <- function(id) {
  
  moduleServer(
    id,
    function(input, output, session) {
      print(navigator('breadcrumbs', session = session))
      navigator('navigate', 'process', 'Iniciar Sesión', session)
      
      observeEvent(session$userData$process(), {
        switch (
          session$userData$process(),
          'Iniciar Sesión' = AuthLoginServer('loginOut'),
          'Crear cuenta' = AuthSignupServer('signupOut'),
          'Recuperar Password' = AuthRecoverServer('recoverOut'),
          print('Ruta desconocida')
        )
      })
      
      ns <- session$ns
      output$processOut <- renderUI({
        switch (
          session$userData$process(),
          'Iniciar Sesión' = AuthLogin(ns('loginOut')),
          'Crear cuenta' = AuthSignupServer(ns('signupOut')),
          'Recuperar Password' = AuthRecoverServer(ns('recoverOut')),
          Error404(navigator('breadcrumbs', session))
        )
      })
    }
  )
  
}
