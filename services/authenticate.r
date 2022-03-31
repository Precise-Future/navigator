Authenticate <- function(id) {
  ns <- NS(id)
  tagList(
    uiOutput(ns('processOut')),
    tags$div(
      class = 'd-flex justify-content-center',
      actionButton(ns('login'), "Iniciar sesión"),
      actionButton(ns('signup'), "Crear cuenta"),
      actionButton(ns('recover'), "Recuperar contraseña")
    )
  )
}

AuthenticateServer <- function(id) {
  
  moduleServer(
    id,
    function(input, output, session) {
      print(navigator('breadcrumbs', session = session))
      navigator('navigate', 'process', 'Iniciar Sesión', session)
      
      observeEvent(input$login, {navigator('navigate', 'process', 'Iniciar Sesión', session)}, ignoreInit = T, ignoreNULL = T)
      observeEvent(input$signup, {navigator('navigate', 'process', 'Crear cuenta', session)}, ignoreInit = T, ignoreNULL = T)
      observeEvent(input$recover, {navigator('navigate', 'process', 'Recuperar Password', session)}, ignoreInit = T, ignoreNULL = T)
      
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
