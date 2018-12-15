observeEvent(input$add_my_page, {
  alert("You can download this chart ;) Just point mouse at the top of the chart and pick camera icon. ")
})

observeEvent(input$add_to_quiz, {
  
 #Tworzy wektor inputow, ktore wprowadzil uzytkownik w momencie klikniecia action buttona. 
 plot_input <- c(input$goal, input$description, input$countries, input$chartType)
 #Zapisuje stworzony wektor do pliku RDS, by mozna go bylo odtworzyc poza sesja
 saveRDS(plot_input, file="user_plot_input.RDS")
 #reactiveValuesToList()
})

# przypisanie wartości pustej i dodawanie numeru do zapisu wykresu
plot <- reactiveValues(plot = NULL, numer = 1)


# wybór opisów do listy rozwijanej na podstawie wybranego celu
output$countries <- renderUI({
  
  
  goal <- My_SDG %>%
    dplyr::filter(Goal == as.numeric(input$goal))
  
  selectInput("countries", 
              label = i18n$t("Choose region"),
              choices = unique(goal$GeoAreaName),
              selected = unique(goal$GeoAreaName)[2], multiple = TRUE)
  
  
})

# wybór krajów do listy rozwijanej na podstawie wybranego celu
output$description <- renderUI({
  
  goal <- My_SDG %>%
    dplyr::filter(Goal == as.numeric(input$goal))
  
  selectInput("description", 
              label = i18n$t("Choose topic/indicator"),
              choices = unique(goal$SeriesDescription),
              selected = unique(goal$SeriesDescription)[1])
})



output$plot_inter <- renderPlotly({
  
  seria <- My_SDG %>%
    dplyr::filter(Goal == as.numeric(input$goal),
                  GeoAreaName %in% input$countries,
                  SeriesDescription == input$description)
  
  
    plotly::plot_ly(data = seria,
                  y = ~Value,
                  x = ~TimePeriod,
                  color = ~GeoAreaName,
                  type = "scatter",
                  mode = "lines") %>%
    layout(title = input$description,
           xaxis=list(range=c(2000,2018),
                      title = "Time"),
           ysxis = list(title = "Value"))
})

output$plot_bar_inter <- renderPlotly({
  
  seria_2 <- My_SDG %>% 
    dplyr::filter(Goal == as.numeric(input$goal),
                  GeoAreaName %in% input$countries,
                  SeriesDescription == input$description)#
  #X.Age. == input$group,
  #X.Sex. == input$group2) %>% group_by(X.Age.)
  
  
  plotly::plot_ly(data = seria_2,
                  x = ~TimePeriod,
                  y = ~Value,
                  color = ~GeoAreaName,
                  type = "bar",
                  mode = "markers") %>% 
    layout(title = input$description,
           xaxis=list(range=c(2000,2018),
                      title = "Time"),
           ysxis = list(title = "Value")
    )
  
})

# funkcja która ma zapisywać wykres do bazy danych wykresów które będą dodane do quizu
# z powodów technicznych i braku dostępu do zewnętrznej bazy danych nie mogliśmy zaimlementować funkcji zapisu wykresów
# i wykorzystanie ich w quizie 
output$save <- downloadHandler(
  
  if(!is.null(plot$plot)){
    
    p <- plot$plot
    
    i <- plot$numer
    
    save(p, file = paste0("plot/imgtest",i,".RData"))
    
    plot$numer <- i + 1
  }
  
  
)
# wyświetlenie u Ui wykresó wybranych przez użytkownika wyświetlrnie wyktesu kolumnowego
output$plot_scatter_inter <- renderPlotly({
  
  seria_3 <- My_SDG %>% 
    dplyr::filter(Goal == as.numeric(input$goal), GeoAreaName %in% input$countries, SeriesDescription == input$description)
  
  plotly::plot_ly(data = seria_3,
                  x = ~TimePeriod,
                  y = ~Value,
                  color = ~GeoAreaName,
                  size = ~Value,
                  type = "scatter",
                  mode = "markers") %>% 
    layout(title = input$description,
           xaxis=list(range=c(2000,2018),
                      title = "Time"),
           ysxis = list(title = "Value")
    )
})
