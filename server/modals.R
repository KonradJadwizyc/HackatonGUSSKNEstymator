modalStartName <- reactiveValues(name=i18n$t("Dear user"))


observe({
  showModal(
    modalDialog(
      i18n$t("What is your name"),
      textInput("modalUserName", label = i18n$t("Name...")),
      
      footer = div(actionButton(inputId = "done", i18n$t("Done"), style="color: #fff; background-color: #337ab7; border-color: #2e6da4"),
                   modalButton(i18n$t("Ignore"))),
      
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
