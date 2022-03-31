setFlow = function(session, states) {
  session$userData$Flow <- states
}

getFlow = function(session) session$userData$Flow

navigate = function(controller, to) {
  if(is.null(isolate(controller()))) return(controller(to)) else 
    if(isolate(controller()) != to) return(controller(to)) 
}

locate <- function() {
  return(
    list(
      'service' = isolate(service()),
      'process' = isolate(process()),
      'activity' = isolate(activity())
    )
  )
}

breadcrumbs = function() paste0(c(as.character(unlist(locate()))), collapse = " / ")

getActivity = function() isolate(activity())
getProcess = function() isolate(process())
getService = function() isolate(service())

goBack = function(session, controller) {
  flow <- getFlow(session)
  current <- getActivity()
  navigate(controller = controller, to = flow[which(flow == current) - 1])
}
goForward = function(session, controller) {
  flow <- getFlow(session)
  current <- getActivity()
  navigate(controller = controller, to = flow[which(flow == current) + 1])
}
navigator <- function(method, controller, params, session) {
  switch (method,
          'setFlow' = setFlow(session, params),
          'getFlow' = getFlow(session),
          'navigate' = navigate(controller, params),
          'locate' = locate(),
          'breadcrumbs' = breadcrumbs(),
          'getActivity' = getActivity(),
          'getProcess' = getProcess(),
          'getService' = getService(),
          'goBack' = goBack(session, controller),
          'goForward' = goForward(session, controller)
  )
}
