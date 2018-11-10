modalStartName <- reactiveValues(name="Dear user")


observe({
showModal(
  modalDialog(
    "What is your name",
    textInput("modalUserName", label = "Name..."),
    
    footer = div(actionButton(inputId = "done", "Done"),
                 modalButton("Ignore")),
   
    size = "m", # s, l
    easyClose = T,
    fade = T
  )
)  

  
})

observeEvent(input$done, {
  modalStartName$name <- input$modalUserName
  removeModal()
}
)

output$modalName <- renderText({ modalStartName$name})
