AuthValidarAcceso <- function(id) {
  ns <- NS(id)
  
  tags$div(
    class = 'login-form',
    textInput(ns('email'), label = 'Email'),
    passwordInput(ns('Password'), label = 'Contraseña'),
    tags$br(),
    actionButton(ns('acceder'), 'INICIAR SESIÓN')
  )
  
}
AuthValidarAccesoServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      print(navigator('breadcrumbs', session = session))
      
      observeEvent(input$acceder, {
        
        e <- isolate(input$email)
        p <- isolate(input$password)
        
        acceso <- tryCatch({tryLogin(e, p)}, error = function(e) {0})
        if(acceso != 1) {
          navigator('navigate', 'service', 'app', session)
        }
        
      }, ignoreInit = T, ignoreNULL = T)
      
    }
  )
}
