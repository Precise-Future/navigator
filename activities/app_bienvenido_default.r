AppBienvenidoDefault <- function(id) {
  ns <- NS(id)
  tags$div(
    class = 'text-center',
    h1('Bienvenido Seas')
  )
}

AppBienvenidoDefaultServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      print(navigator('breadcrumbs', session = session))
    }
  )
}
