sidebarLayout(
  sidebarPanel(
    tags$style(type="text/css",
               ".shiny-output-error { visibility: hidden; }",
               ".shiny-output-error:before { visibility: hidden; }"
    ),
    div(id = "panel",
        style="text-align: center;",
        h4(textOutput("modalName"))),
    div(id = "upper_panel",
        style="text-align: center;",
        selectInput("goal", 
                    label = "Choose goal",
                    # choices goal if you tap goal img
                    choices = c("No poverty" = 1,
                                "Zero hunger" = 2,
                                "Good health and well-being" = 3,
                                "Quality education" = 4,
                                "Gender equality" = 5,
                                "Clean water and sanitation" = 6,
                                "Affordable and clean energy" = 7,
                                "Decent work and economic growth" = 8,
                                "Industry, innovation and infrastructure" = 9,
                                "Reduced inequality" = 10,
                                "Sustainable cities and communities" = 11,
                                "Responsible consumption and production" = 12,
                                "Climate action" = 13,
                                "Life below water" = 14,
                                "Life on land" = 15,
                                "Peace, justice and strong institutions" = 16,
                                "Partnership for the goals" = 17),
                    selected = 1),
                    # show option choose description in panel education 
                    uiOutput("description"),
        # show option choose ceuntries in panel education 
                    uiOutput("countries"),
        # show option choose group in panel education 
                    uiOutput("group"),
        # show option choose group2 in panel education 
                    uiOutput("group2"),
        # show option choose value in panel education 
                    uiOutput("value"),
        # show option choose value2 in panel education 
                    uiOutput("value2"),
        
                    radioButtons(
                      inputId = "chartType",
                      label = "Choose chart type!",
                      choices = c("line","bar"),
                      selected = "line"
                      
                    )),
        # show infrmation about save plot
        actionButton("add_my_page", 
                     "Add this plot to your page"),
        br(),
        br(),
        # save plot
        actionButton("save", "Add this chart to quiz")
        
    ),    
    
    
    
    
    
    mainPanel(
      # show choos plot line
      conditionalPanel(
        condition = "input.chartType == 'line'",
        plotlyOutput("plot_inter")
      ),
      # # show choos plot bar
      conditionalPanel(
        condition = "input.chartType == 'bar'",
        plotlyOutput("plot_bar_inter")
      )
      
    )
  )
  
  