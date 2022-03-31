Error404 <- function(breadcrumbs) {
  tags$div(
    class = 'e404 text-center',
    h1('No se encuentra la ruta:'),
    h4(breadcrumbs),
    tags$br(),
    tags$p('Reinicie la app')
    
  )
}