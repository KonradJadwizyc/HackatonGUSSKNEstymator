shinyServer(function(input, output, session) {
  
  
  for (file in list.files("server")) {
    source(file.path("server", file), local = TRUE)
  }
})
