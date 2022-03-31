MainContent <- function(id) {
  ns <- NS(id)
  uiOutput(ns('serviceOut'))
}

MainContentServer <- function(id) {
  
  moduleServer(
    id,
    function(input, output, session) {
      print(navigator('breadcrumbs'))
      navigator('navigate', service, 'authenticate', session)
      
      observeEvent(service(), {
        switch (
          service(),
          'authenticate' = AuthenticateServer('authOut'),
          'app' = AppServer('appOut')
        )
      })
      
      ns <- session$ns
      output$serviceOut <- renderUI({
        switch (
          service(),
          'authenticate' = Authenticate(ns('authOut')),
          'app' = App(ns('appOut'))
        )
      })
    }
  )
  
}