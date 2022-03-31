setFlow = function(session, states) {
  session$userData$Flow <- states
}

getFlow = function(session) session$userData$Flow

navigate = function(controller, to) {
  switch (controller,
    'activity' = {
      if(is.null(isolate(session$userData$activity()))) return(session$userData$activity(to)) else 
        if(isolate(session$userData$activity()) != to) return(session$userData$activity(to)) 
    },
    'process' = {
      if(is.null(isolate(session$userData$process()))) return(session$userData$process(to)) else 
        if(isolate(session$userData$process()) != to) return(session$userData$process(to)) 
    },
    'service' = {
      if(is.null(isolate(session$userData$service()))) return(session$userData$service(to)) else 
        if(isolate(session$userData$service()) != to) return(session$userData$service(to)) 
    }
  )
}

locate <- function() {
  return(
    list(
      'service' = isolate(session$userData$service()),
      'process' = isolate(session$userData$process()),
      'activity' = isolate(session$userData$activity())
    )
  )
}

breadcrumbs = function() paste0(c(as.character(unlist(locate()))), collapse = " / ")

getActivity = function() isolate(session$userData$activity())
getProcess = function() isolate(session$userData$process())
getService = function() isolate(session$userData$service())

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
