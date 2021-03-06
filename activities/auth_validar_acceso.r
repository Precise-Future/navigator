AuthValidarAcceso <- function(id) {
  ns <- NS(id)
  
  tags$div(
    class = 'login-form',
    textInput(ns('email'), label = 'Email'),
    passwordInput(ns('password'), label = 'Contraseña'),
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
        if(acceso != 0) {
          session$userData$user <- readUser(acceso)
          navigator('navigate', 'service', 'app', session)
        } else {
          showModal(modalDialog(title = 'Usuario o contraseña incorretos', size = 's', footer = NULL, easyClose = T, fade = T, 'Vuelva a intentarlo'))
        }
        
      }, ignoreInit = T, ignoreNULL = T)
    }
  )
}
