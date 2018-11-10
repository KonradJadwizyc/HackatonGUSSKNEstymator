modalStartName <- reactiveValues(name="Dear user")


observe({
showModal(
  modalDialog(
    "What is your name",
    textInput("modalUserName", label = "Name..."),
    
    footer = div(actionButton(inputId = "done", "Done", style="color: #fff; background-color: #337ab7; border-color: #2e6da4"),
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
