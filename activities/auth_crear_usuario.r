AuthCrearUsuario <- function(id) {
  ns <- NS(id)
  
  tags$div(
    class = 'signup-form',
    h1('Crea tu cuenta'),
    textInput(ns('email'), label = 'Email'),
    passwordInput(ns('password'), label = 'Contraseña'),
    tags$br(),
    actionButton(ns('acceder'), 'Crear Cuenta')
  )
  
}
AuthCrearUsuarioServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      print(navigator('breadcrumbs', session = session))
      
      observeEvent(input$acceder, {
        
        e <- isolate(input$email)
        p <- isolate(input$password)
        if(any((is.null(e)) | (is.null(p)) | (length(unlist(strsplit(as.character(p), ""))) < 3))) {
          return(showModal(modalDialog('Usuario y contraseña son obligatorios y la contraseña debe tener 3 o más caracteres')))
        } 
        acceso <- tryCatch({trySignup(e, p)}, error = function(e) {0})
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
