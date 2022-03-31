tryLogin <- function(e, p) {
  x <- readUser()
  u <- length(which((x$email == e) & (x$password == p)))
  if(u == 0) return(u) else x$id[u]
}

trySignup <- function(e, p) {
  u <- newUser(e, p)
  createUser(u)
}