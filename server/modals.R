modalStartName <- reactiveValues(name="Dear user")
# modalStartCountry <- reactiveValues(country="Wasteland")
#modalUserAge <- reactiveValues()

observe( {
showModal(
  modalDialog(
    "What is your name?",
    textInput("modalUserName", 
              label = "Name..."),
    
    footer = div(actionButton(inputId = "done", 
                              "Done", 
                              style="color: #fff; background-color: #337ab7; border-color: #2e6da4"),
                 modalButton("Ignore")),
   
    size = "m", # s, l
    easyClose = T,
    fade = T
  )
)
})

# observe({
# showModal(
# modalDialog(
#   "Where are You from?",
#   textInput("modalUserCountry",
#             label = "Country..."),
#   
#   footer = div(actionButton(inputId = "done_country",
#                             "Done",
#                             style="color: #fff; background-color: #337ab7; border-color: #2e6da4"),
#                modalButton("Ignore")),
#   
#   size = "m", # s, l
#   easyClose = T,
#   fade = T
# )
# )
# })

observeEvent(input$done, {
  modalStartName$name <- input$modalUserName
  removeModal()
})

# observeEvent(input$done_country, {
#   modalStartCountry$country <- input$modalUserCountry
#   removeModal()
# })


output$modalName <- renderText({ modalStartName$name})
# output$modalCountry <- renderText({ modalStartCountry$country})