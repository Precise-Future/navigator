MainContent <- function(id) {
  ns <- NS(id)
  uiOutput(ns('serviceOut'))
}

MainContentServer <- function(id) {
  
  moduleServer(
    id,
    function(input, output, session) {
      print(navigator(method = 'breadcrumbs', session = session))
      navigator(method = 'navigate', controller = 'service', params = 'authenticate', session = session)
      
      observeEvent(session$userData$service(), {
        switch (
          session$userData$service(),
          'authenticate' = AuthenticateServer('authOut'),
          'app' = AppServer('appOut')
        )
      })
      
      ns <- session$ns
      output$serviceOut <- renderUI({
        switch (
          session$userData$service(),
          'authenticate' = Authenticate(ns('authOut')),
          'app' = App(ns('appOut'))
        )
      })
    }
  )
  
}
