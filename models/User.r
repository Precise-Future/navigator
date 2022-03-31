newUser <- function(email, password) {
  return(list(id = numeric(), email = email, password = password))
}
createUser <- function(newUser) {
  users <- readUser()
  newId <- max(users$id) + 1
  newUser$id <- newId
  write_csv(x = rbind(users, list2DF(newUser)), file = paste0(mainDir, 'user.csv'))
  return(newId)
}

readUser <- function(id) {
  x <- read_csv(paste0(mainDir, 'user.csv'))
  if(missing(id)) {
    return(x)
  } else {
    return(x[x$id == id, ])
  }
}
