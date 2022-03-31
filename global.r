library(shiny)
library(readr)

###### MAIN DIR ######
mainDir <- '../'

helpers <- dir('helpers')
lapply(helpers, function(x)  tryCatch({source(paste0('helpers/', x))}, error = function(e) {print(paste0('Error en el Script ', x))}))
rm(helpers)

models <- dir('models')
lapply(models, function(x)  tryCatch({source(paste0('models/', x))}, error = function(e) {print(paste0('Error en el Script ', x))}))
rm(models)

activities <- dir('activities')
lapply(activities, function(x) tryCatch({source(paste0('activities/', x))}, error = function(e) {print(paste0('Error en el Script ', x))}))
rm(activities)

processes <- dir('processes')
lapply(processes, function(x) tryCatch({source(paste0('processes/', x))}, error = function(e) {print(paste0('Error en el Script ', x))}))
rm(processes)

services <- dir('services')
lapply(services, function(x)  tryCatch({source(paste0('services/', x))}, error = function(e) {print(paste0('Error en el Script ', x))}))
rm(services)

layouts <- dir('layouts')
lapply(layouts, function(x) tryCatch({source(paste0('layouts/', x))}, error = function(e) {print(paste0('Error en el Script ', x))}))
rm(layouts)
