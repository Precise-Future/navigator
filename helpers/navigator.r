navigator <- function(method, controller, params, session) {
  switch (
    method,
    'navigate' = session$userData[[controller]](params),
    'breadcrumbs' = paste0(collapse = " / ", c(
      isolate(session$userData$service()),
      isolate(session$userData$process()),
      isolate(session$userData$activity())
    ))
  )
}
