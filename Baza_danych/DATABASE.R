## funkcja pobierająca dane z api SDG
have_ip <- function() {
  if (.Platform$OS.type == "windows") {
    ipmessage <- system("ipconfig", intern = TRUE)
  } else {
    ipmessage <- system("ifconfig", intern = TRUE)
  }
  validIP <- "((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)[.]){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)"
  any(grep(validIP, ipmessage))
}

all_fun1 <- function() {
  ## funkcja sprawdzająca czy jest połączenie z internetem i czy jest podany dobry link
  if(have_ip() == T) {
    
    tryCatch({
      # ponieranie celu 1 z API ONZ w formacie JSON
  No_poverty <- fromJSON("https://unstats.un.org/SDGAPI/v1/sdg/Indicator/Data?indicator=1.1.1&pageSize=9454")
  Target_2 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=1.2&pageSize=732')
  Target_3 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=1.3&pageSize=2403')
  Target_4 <-  fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Indicator/Data?indicator=1.5.2&pageSize=36222')
  Target_5 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Indicator/Data?indicator=1.5.1&pageSize=30160')
  Target_6 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=1.a&pageSize=1819')
  indicator_1.5.4 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Indicator/Data?indicator=1.5.4&pageSize=135')
    },error = function(e) {
      warning("You used bad link!")
    })
    
  } else {
    warning("You lost connection to internet!")
  }
  # # cel 2
  ## pobieranie celu 2
  if(have_ip() == T) {
    
    tryCatch({
      # ponieranie celu 2 z API ONZ w formacie JSON
  Zero_hunger <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=2.1&pageSize=4632')
  Target_2.2 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=2.2&pageSize=2453')
  Target_2.5 <- fromJSON("https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=2.5&pageSize=25990")
  Target_2.a <- fromJSON("https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=2.a&pageSize=5161")
  Target_2.b <- fromJSON("https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=2.b&pageSize=272")
  target_2.c <- fromJSON("https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=2.c&pageSize=167")
    },error = function(e) {
      warning("You used bad link!")
    })
    
  } else {
    warning("You lost connection to internet!")
  }
  #cel 3
  #pobieranie danych
  if(have_ip() == T) {
    
    tryCatch({
      # ponieranie celu 3 z API ONZ w formacie JSON
  Good_health <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=3.1&pageSize=12324')
  Target_3.2 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=3.2&pageSize=2453')
  Target_3.3 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=3.3&pageSize=30528')
  Target_3.4 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=3.4&pageSize=22155')
  Target_3.5 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=3.5&pageSize=1149')
  Target_3.6 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=3.6&pageSize=2860')
  Target_3.7 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=3.7&pageSize=2703')
  Target_3.8 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=3.8&pageSize=1135')
  Target_3.9 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=3.9&pageSize=4617')
  Target_3.a <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=3.a&pageSize=506')
  Target_3.b <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=3.b&pageSize=11749')
  Target_3.c <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=3.c&pageSize=4147')
  Target_3.d <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=3.d&pageSize=16106')
    },error = function(e) {
      warning("You used bad link!")
    })
    
  } else {
    warning("You lost connection to internet!")
  }
  # cel 4
  # pobieranie danych dla celu 4
  if(have_ip() == T) {
    
    tryCatch({
      # ponieranie celu 4 z API ONZ w formacie JSON
  Education <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=4.1&pageSize=3870')
  Target_4.2 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=4.2&pageSize=5243')
  Target_4.3 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=4.3&pageSize=273')
  Target_4.4 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=4.4&pageSize=1150')
  Target_4.5 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=4.5&pageSize=9867')
  Target_4.6 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=4.6&pageSize=68')
  Target_4.7 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=4.a&pageSize=6939')
  Target_4.8 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=4.b&pageSize=1916')
  Target_4.9 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=4.c&pageSize=12207')
    },error = function(e) {
      warning("You used bad link!")
    })
    
  } else {
    warning("You lost connection to internet!")
  }
  # cel 5
  # pobieranie danych dla celu 5
  if(have_ip() == T) {
    
    tryCatch({
      # ponieranie celu 5 z API ONZ w formacie JSON
  Gender_equality <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=5.2&pageSize=442')
  Target_5.2 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=5.3&pageSize=391')
  Target_5.3 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=5.4&pageSize=5640')
  Target_5.4 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=5.5&pageSize=15012')
  Target_5.5 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=5.6&pageSize=94')
  Target_5.6 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=5.b&pageSize=124')
    },error = function(e) {
      warning("You used bad link!")
    })
    
  } else {
    warning("You lost connection to internet!")
  }
  # cel 6
  # pobieranie danych dla celu 6
  if(have_ip() == T) {
    
    tryCatch({
      # ponieranie celu 6 z API ONZ w formacie JSON
  Clean_water <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=6.1&pageSize=3395')
  Target_6.2 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=6.2&pageSize=14481')
  Target_6.3 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=6.3&pageSize=131')
  Target_6.4 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=6.4&pageSize=206')
  Target_6.5 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=6.5&pageSize=1009')
  Target_6.6 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=6.6&pageSize=13057')
  Target_6.7 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=6.a&pageSize=2906')
  Target_6.8 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=6.b&pageSize=887')
    },error = function(e) {
      warning("You used bad link!")
    })
    
  } else {
    warning("You lost connection to internet!")
  }
  # cel 7
  # pobieranie danych dla celu 7
  if(have_ip() == T) {
    
    tryCatch({
      # ponieranie celu 7 z API ONZ w formacie JSON
  Clean_energy <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=7.1&pageSize=12216')
  Target_7.2 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=7.2&pageSize=4032')
  Target_7.3 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=7.3&pageSize=3438')
    },error = function(e) {
      warning("You used bad link!")
    })
    
  } else {
    warning("You lost connection to internet!")
  }
  # cel 8
  # pobieranie danych dla celu 8
  if(have_ip() == T) {
    
    tryCatch({
      # ponieranie celu 8 z API ONZ w formacie JSON
  Work_and_ekonomi <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=8.1&pageSize=3395')
  Target_8.2 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=8.2&pageSize=14481')
  Target_8.3 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=8.3&pageSize=131')
  Target_8.4 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=8.4&pageSize=206')
  Target_8.5 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=8.5&pageSize=1009')
  Target_8.6 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=8.6&pageSize=13057')
  Target_8.7 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=8.7&pageSize=2906')
  Target_8.8 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=8.8&pageSize=887')
  Target_8.7 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=8.10&pageSize=2906')
  Target_8.8 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=8.a&pageSize=887')
    },error = function(e) {
      warning("You used bad link!")
    })
    
  } else {
    warning("You lost connection to internet!")
  }
  # cel 9
  # pobieranie danych dla celu 
  if(have_ip() == T) {
    
    tryCatch({
      # ponieranie celu 9 z API ONZ w formacie JSON
  Industry <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=9.1&pageSize=1197')
  Target_9.2 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=9.2&pageSize=10101')
  Target_9.3 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=9.3&pageSize=810')
  Target_9.4 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=9.4&pageSize=8402')
  Target_9.5 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=9.5&pageSize=3512')
  Target_9.6 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=9.a&pageSize=3029')
  Target_9.7 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=9.b&pageSize=2352')
  Target_9.8 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=9.c&pageSize=5478')
    },error = function(e) {
      warning("You used bad link!")
    })
    
  } else {
    warning("You lost connection to internet!")
  }
  # cel 10
  # pobieranie danych dla celu 10
  if(have_ip() == T) {
    
    tryCatch({
      # ponieranie celu 10 z API ONZ w formacie JSON
  Reduce_ineqality <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=10.1&pageSize=188')
  Target_10.2 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=10.4&pageSize=750')
  Target_10.3 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=10.6&pageSize=28380')
  Target_10.4 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=10.a&pageSize=84')
  Target_10.5 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=10.b&pageSize=3767')
  Target_10.6 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=10.c&pageSize=302')
    },error = function(e) {
      warning("You used bad link!")
    })
    
  } else {
    warning("You lost connection to internet!")
  }
  # cel 11
  # pobieranie danych dla celu 11
  if(have_ip() == T) {
    
    tryCatch({
      # ponieranie celu 11 z API ONZ w formacie JSON
  Cities <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=11.1&pageSize=298')
  Target_11.2 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=11.5&pageSize=132246') #########
  Target_11.3 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=11.6&pageSize=655')
  Target_11.4 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=11.b&pageSize=678')
    },error = function(e) {
      warning("You used bad link!")
    })
    
  } else {
    warning("You lost connection to internet!")
  }
  # cel 12
  # pobieranie danych dla celu 12
  if(have_ip() == T) {
    
    tryCatch({
      # ponieranie celu 12 z API ONZ w formacie JSON
  Responsible_consumption <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=12.2&pageSize=347058') #######
  Target_12.2 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=12.4&pageSize=841')
    },error = function(e) {
      warning("You used bad link!")
    })
    
  } else {
    warning("You lost connection to internet!")
  }
  # cel 13
  # pobieranie danych dla celu 13
  if(have_ip() == T) {
    
    tryCatch({
      # ponieranie celu 13 z API ONZ w formacie JSON
  Climate <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=13.1&pageSize=89838') ######
    },error = function(e) {
      warning("You used bad link!")
    })
    
  } else {
    warning("You lost connection to internet!")
  }
  # cel 14
  # pobieranie danych dla celu 14
  if(have_ip() == T) {
    
    tryCatch({
      # ponieranie celu 14 z API ONZ w formacie JSON
  Below_water <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=14.4&pageSize=25')
  Target_14.2 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=14.5&pageSize=12503') #########
  Target_14.3 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=14.a&pageSize=86')
    },error = function(e) {
      warning("You used bad link!")
    })
    
  } else {
    warning("You lost connection to internet!")
  }
  # cel 15
  # pobieranie danych dla celu 15
  if(have_ip() == T) {
    
    tryCatch({
      # ponieranie celu 15 z API ONZ w formacie JSON
  Belowa_land <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=15.1&pageSize=1197')
  Target_15.2 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=15.2&pageSize=10101')
  Target_15.3 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=15.4&pageSize=810')
  Target_15.4 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=15.5&pageSize=8402')
  Target_15.5 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=15.6&pageSize=3512')
  Target_15.6 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=15.a&pageSize=3029')
  Target_15.7 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=15.b&pageSize=2352')
    },error = function(e) {
      warning("You used bad link!")
    })
    
  } else {
    warning("You lost connection to internet!")
  }
  # cel 16
  # pobieranie danych dla celu 16
  if(have_ip() == T) {
    
    tryCatch({
      # ponieranie celu 16 z API ONZ w formacie JSON
  Peaca_andJustice <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=16.1&pageSize=1920')
  Target_16.2 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=16.2&pageSize=459')
  Target_16.3 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=16.3&pageSize=296')
  Target_16.4 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=16.5&pageSize=176')
  Target_16.5 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=16.8&pageSize=28380')
  Target_16.6 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=16.9&pageSize=187')
  Target_16.7 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=16.10&pageSize=125')
  Target_16.8 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=16.a&pageSize=1446')
    },error = function(e) {
      warning("You used bad link!")
    })
    
  } else {
    warning("You lost connection to internet!")
  }
  # cel 17
  # pobieranie danych dla celu 17
  if(have_ip() == T) {
    
    tryCatch({
      # ponieranie celu 17 z API ONZ w formacie JSON
  Partnership_for_goals <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=17.2&pageSize=1920')
  Target_17.2 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=17.3&pageSize=459')
  Target_17.3 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=17.4&pageSize=296')
  Target_17.4 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=17.6&pageSize=176')
  Target_17.5 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=17.8&pageSize=28380')
  Target_17.6 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=17.9&pageSize=187')
  Target_17.7 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=17.10&pageSize=125')
  Target_17.8 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=17.11&pageSize=1446')
  Target_17.9 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=17.12pageSize=1920')
  Target_17.10 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=17.15&pageSize=459')
  Target_17.11 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=17.16&pageSize=296')
  Target_17.12 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=17.18&pageSize=176')
  Target_17.13 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=17.19&pageSize=28380')
    },error = function(e) {
      warning("You used bad link!")
    })
    
  } else {
    warning("You lost connection to internet!")
  }
  
    # tworzenie ramki danych dla wszystkich celów
  # cel 1
  Goal1_df <- as.data.frame(matrix(unlist(No_poverty$data), nrow = nrow(No_poverty$data))) 
  Tg_1_2_df <- as.data.frame(matrix(unlist(Target_2$data), nrow = nrow(Target_2$data))) 
  tg_1_3_df <-  as.data.frame(matrix(unlist(Target_3$data), nrow = nrow(Target_3$data)))
  tg_1_4_df <-  as.data.frame(matrix(unlist(Target_4$data), nrow = nrow(Target_4$data)))
  tg_1_5_df <-  as.data.frame(matrix(unlist(Target_5$data), nrow = nrow(Target_5$data)))
  tg_1_6_df <-  as.data.frame(matrix(unlist(Target_6$data), nrow = nrow(Target_6$data)))  
  #cel2
  Goal2_df<-  as.data.frame(matrix(unlist(Zero_hunger$data), nrow = nrow(Zero_hunger$data)))
  tg_2_2_df <-  as.data.frame(matrix(unlist(Target_2.2$data), nrow = nrow(Target_2.2$data))) 
  tg_2_3_df <-  as.data.frame(matrix(unlist(Target_2.5$data), nrow = nrow(Target_2.5$data))) 
  tg_2_4_df <-  as.data.frame(matrix(unlist(Target_2.a$data), nrow = nrow(Target_2.a$data))) 
  tg_2_5_df <-  as.data.frame(matrix(unlist(Target_2.b$data), nrow = nrow(Target_2.b$data))) 
  tg_2_6_df <-  as.data.frame(matrix(unlist(target_2.c$data), nrow = nrow(target_2.c$data))) 
  #cel 3 
  Goal3_df <- as.data.frame(matrix(unlist(target_2.c$data), nrow = nrow(target_2.c$data)))
  tg_3_2_df <- as.data.frame(matrix(unlist(Target_3.2$data), nrow = nrow(Target_3.2$data)))
  tg_3_3_df <- as.data.frame(matrix(unlist(Target_3.3$data), nrow = nrow(Target_3.3$data))) 
  tg_3_4_df <- as.data.frame(matrix(unlist(Target_3.4$data), nrow = nrow(Target_3.4$data))) 
  tg_3_5_df <- as.data.frame(matrix(unlist(Target_3.5$data), nrow = nrow(Target_3.5$data))) 
  tg_3_6_df <- as.data.frame(matrix(unlist(Target_3.6$data), nrow = nrow(Target_3.6$data)))
  tg_3_7_df <- as.data.frame(matrix(unlist(Target_3.7$data), nrow = nrow(Target_3.7$data)))
  tg_3_8_df <- as.data.frame(matrix(unlist(Target_3.8$data), nrow = nrow(Target_3.8$data))) 
  tg_3_9_df <- as.data.frame(matrix(unlist(Target_3.9$data), nrow = nrow(Target_3.9$data))) 
  tg_3_10_df <- as.data.frame(matrix(unlist(Target_3.a$data), nrow = nrow(Target_3.a$data))) 
  tg_3_11_df <- as.data.frame(matrix(unlist(Target_3.b$data), nrow = nrow(Target_3.b$data))) 
  tg_3_12_df <- as.data.frame(matrix(unlist(Target_3.c$data), nrow = nrow(Target_3.c$data))) 
  tg_3_13_df <- as.data.frame(matrix(unlist(Target_3.d$data), nrow = nrow(Target_3.d$data))) 
  #cel 4
  tg_4_1_df <- as.data.frame(matrix(unlist(Education$data), nrow = nrow(Education$data))) 
  tg_4_2_df <- as.data.frame(matrix(unlist(Target_4.2$data), nrow = nrow(Target_4.2$data)))
  tg_4_3_df <- as.data.frame(matrix(unlist(Target_4.3$data), nrow = nrow(Target_4.3$data))) 
  tg_4_4_df <- as.data.frame(matrix(unlist(Target_4.4$data), nrow = nrow(Target_4.4$data))) 
  tg_4_5_df <- as.data.frame(matrix(unlist(Target_4.5$data), nrow = nrow(Target_4.5$data))) 
  tg_4_6_df <- as.data.frame(matrix(unlist(Target_4.6$data), nrow = nrow(Target_4.6$data))) 
  tg_4_7_df <- as.data.frame(matrix(unlist(Target_4.7$data), nrow = nrow(Target_4.7$data))) 
  tg_4_8_df <- as.data.frame(matrix(unlist(Target_4.8$data), nrow = nrow(Target_4.8$data))) 
  tg_4_9_df <- as.data.frame(matrix(unlist(Target_4.9$data), nrow = nrow(Target_4.9$data))) 
  # cel 5
  tg_5_1_df <- as.data.frame(matrix(unlist(Gender_equality$data), nrow = nrow(Gender_equality$data))) 
  tg_5_2_df <- as.data.frame(matrix(unlist(Target_5.2$data), nrow = nrow(Target_5.2$data))) 
  tg_5_3_df <- as.data.frame(matrix(unlist(Target_5.3$data), nrow = nrow(Target_5.3$data))) 
  tg_5_4_df <- as.data.frame(matrix(unlist(Target_5.4$data), nrow = nrow(Target_5.4$data))) 
  tg_5_5_df <- as.data.frame(matrix(unlist(Target_5.5$data), nrow = nrow(Target_5.5$data))) 
  tg_5_6_df <- as.data.frame(matrix(unlist(Target_5.6$data), nrow = nrow(Target_5.6$data))) 
  # cel 6
  tg_6_1_df <- as.data.frame(matrix(unlist(Clean_water$data), nrow = nrow(Clean_water$data)))
  tg_6_2_df <- as.data.frame(matrix(unlist(Target_6.2$data), nrow = nrow(Target_6.2$data)))
  tg_6_3_df <- as.data.frame(matrix(unlist(Target_6.3$data), nrow = nrow(Target_6.3$data)))
  tg_6_4_df <- as.data.frame(matrix(unlist(Target_6.4$data), nrow = nrow(Target_6.4$data)))
  tg_6_5_df <- as.data.frame(matrix(unlist(Target_6.5$data), nrow = nrow(Target_6.5$data)))
  tg_6_6_df <- as.data.frame(matrix(unlist(Target_6.6$data), nrow = nrow(Target_6.6$data)))
  tg_6_7_df <- as.data.frame(matrix(unlist(Target_6.7$data), nrow = nrow(Target_6.7$data)))
  tg_6_8_df <- as.data.frame(matrix(unlist(Target_6.8$data), nrow = nrow(Target_6.8$data)))
  # cel 7
  tg_7_1_df <- as.data.frame(matrix(unlist(Clean_energy$data), nrow = nrow(Clean_energy$data)))
  tg_7_2_df <- as.data.frame(matrix(unlist(Target_7.2$data), nrow = nrow(Target_7.2$data)))
  tg_7_3_df <- as.data.frame(matrix(unlist(Target_7.3$data), nrow = nrow(Target_7.3$data)))
  # cel 8
  tg_8_1_df <- as.data.frame(matrix(unlist(Work_and_ekonomi$data), nrow = nrow(Work_and_ekonomi$data)))
  tg_8_2_df <- as.data.frame(matrix(unlist(Target_8.2$data), nrow = nrow(Target_8.2$data)))
  tg_8_3_df <- as.data.frame(matrix(unlist(Target_8.3$data), nrow = nrow(Target_8.3$data)))
  tg_8_4_df <- as.data.frame(matrix(unlist(Target_8.4$data), nrow = nrow(Target_8.4$data)))
  tg_8_5_df <- as.data.frame(matrix(unlist(Target_8.5$data), nrow = nrow(Target_8.5$data)))
  tg_8_6_df <- as.data.frame(matrix(unlist(Target_8.6$data), nrow = nrow(Target_8.6$data)))
  tg_8_7_df <- as.data.frame(matrix(unlist(Target_8.7$data), nrow = nrow(Target_8.7$data)))
  tg_8_8_df <- as.data.frame(matrix(unlist(Target_8.8$data), nrow = nrow(Target_8.8$data)))
  # cel 9
  tg_9_1_df <- as.data.frame(matrix(unlist(Industry$data), nrow = nrow(Industry$data)))
  tg_9_2_df <- as.data.frame(matrix(unlist(Target_9.2$data), nrow = nrow(Target_9.2$data)))
  tg_9_3_df <- as.data.frame(matrix(unlist(Target_9.3$data), nrow = nrow(Target_9.3$data)))
  tg_9_4_df <- as.data.frame(matrix(unlist(Target_9.4$data), nrow = nrow(Target_9.4$data)))
  tg_9_5_df <- as.data.frame(matrix(unlist(Target_9.5$data), nrow = nrow(Target_9.5$data)))
  tg_9_6_df <- as.data.frame(matrix(unlist(Target_9.6$data), nrow = nrow(Target_9.6$data)))
  tg_9_7_df <- as.data.frame(matrix(unlist(Target_9.7$data), nrow = nrow(Target_9.7$data)))
  tg_9_8_df <- as.data.frame(matrix(unlist(Target_9.8$data), nrow = nrow(Target_9.8$data)))
  # cel 10
  tg_10_1_df <- as.data.frame(matrix(unlist(Reduce_ineqality$data), nrow = nrow(Reduce_ineqality$data)))
  tg_10_2_df <- as.data.frame(matrix(unlist(Target_10.2$data), nrow = nrow(Target_10.2$data)))
  tg_10_3_df <- as.data.frame(matrix(unlist(Target_10.3$data), nrow = nrow(Target_10.3$data)))
  tg_10_4_df <- as.data.frame(matrix(unlist(Target_10.4$data), nrow = nrow(Target_10.4$data)))
  tg_10_5_df <- as.data.frame(matrix(unlist(Target_10.5$data), nrow = nrow(Target_10.5$data)))
  tg_10_6_df <- as.data.frame(matrix(unlist(Target_10.6$data), nrow = nrow(Target_10.6$data)))
  # cel 11 
  tg_11_1_df <- as.data.frame(matrix(unlist(Cities$data), nrow = nrow(Cities$data)))
  tg_11_2_df <- as.data.frame(matrix(unlist(Target_11.2$data), nrow = nrow(Target_11.2$data)))
  tg_11_3_df <- as.data.frame(matrix(unlist(Target_11.3$data), nrow = nrow(Target_11.3$data)))
  tg_11_4_df <- as.data.frame(matrix(unlist(Target_11.4$data), nrow = nrow(Target_11.4$data)))
  # cel 12 
  tg_12_1_df <- as.data.frame(matrix(unlist(Responsible_consumption$data), nrow = nrow(Responsible_consumption$data)))
  tg_12_2_df <- as.data.frame(matrix(unlist(Target_12.2$data), nrow = nrow(Target_12.2$data)))
  # cel 13 
  tg_13_1_df <- as.data.frame(matrix(unlist(Climate$data), nrow = nrow(Climate$data)))
  # cel 14 
  tg_14_1_df <- as.data.frame(matrix(unlist(Below_water$data), nrow = nrow(Below_water$data)))
  tg_14_2_df <- as.data.frame(matrix(unlist(Target_14.2$data), nrow = nrow(Target_14.2$data)))
  tg_14_3_df <- as.data.frame(matrix(unlist(Target_14.3$data), nrow = nrow(Target_14.3$data)))
  # cel 15 
  tg_15_1_df <- as.data.frame(matrix(unlist(Belowa_land$data), nrow = nrow(Belowa_land$data)))
  tg_15_2_df <- as.data.frame(matrix(unlist(Target_15.2$data), nrow = nrow(Target_15.2$data)))
  tg_15_3_df <- as.data.frame(matrix(unlist(Target_15.3$data), nrow = nrow(Target_15.3$data)))
  tg_15_4_df <- as.data.frame(matrix(unlist(Target_15.4$data), nrow = nrow(Target_15.4$data)))
  tg_15_5_df <- as.data.frame(matrix(unlist(Target_15.5$data), nrow = nrow(Target_15.5$data)))
  tg_15_6_df <- as.data.frame(matrix(unlist(Target_15.6$data), nrow = nrow(Target_15.6$data)))
  tg_15_7_df <- as.data.frame(matrix(unlist(Target_15.7$data), nrow = nrow(Target_15.7$data)))
  # cel 16
  tg_16_1_df <- as.data.frame(matrix(unlist(Peaca_andJustice$data), nrow = nrow(Peaca_andJustice$data)))
  tg_16_2_df <- as.data.frame(matrix(unlist(Target_16.2$data), nrow = nrow(Target_16.2$data)))
  tg_16_3_df <- as.data.frame(matrix(unlist(Target_16.3$data), nrow = nrow(Target_16.3$data)))
  tg_16_4_df <- as.data.frame(matrix(unlist(Target_16.4$data), nrow = nrow(Target_16.4$data)))
  tg_16_5_df <- as.data.frame(matrix(unlist(Target_16.5$data), nrow = nrow(Target_16.5$data)))
  tg_16_6_df <- as.data.frame(matrix(unlist(Target_16.6$data), nrow = nrow(Target_16.6$data)))
  tg_16_7_df <- as.data.frame(matrix(unlist(Target_16.7$data), nrow = nrow(Target_16.7$data)))
  tg_16_8_df <- as.data.frame(matrix(unlist(Target_16.8$data), nrow = nrow(Target_16.8$data)))
  #cel 17 
  tg_17_1_df <- as.data.frame(matrix(unlist(Partnership_for_goals$data), nrow = nrow(Partnership_for_goals$data)))
  tg_17_2_df <- as.data.frame(matrix(unlist(Target_17.2$data), nrow = nrow(Target_17.2$data)))
  tg_17_3_df <- as.data.frame(matrix(unlist(Target_17.3$data), nrow = nrow(Target_17.3$data)))
  tg_17_4_df <- as.data.frame(matrix(unlist(Target_17.4$data), nrow = nrow(Target_17.4$data)))
  tg_17_5_df <- as.data.frame(matrix(unlist(Target_17.5$data), nrow = nrow(Target_17.5$data)))
  tg_17_6_df <- as.data.frame(matrix(unlist(Target_17.6$data), nrow = nrow(Target_17.6$data)))
  tg_17_7_df <- as.data.frame(matrix(unlist(Target_17.7$data), nrow = nrow(Target_17.7$data)))
  tg_17_8_df <- as.data.frame(matrix(unlist(Target_17.8$data), nrow = nrow(Target_17.8$data)))
  tg_17_9_df <- as.data.frame(matrix(unlist(Target_17.9$data), nrow = nrow(Target_17.9$data)))
  tg_17_10_df <- as.data.frame(matrix(unlist(Target_17.10$data), nrow = nrow(Target_17.10$data)))
  tg_17_11_df <- as.data.frame(matrix(unlist(Target_17.11$data), nrow = nrow(Target_17.11$data)))
  tg_17_12_df <- as.data.frame(matrix(unlist(Target_17.12$data), nrow = nrow(Target_17.12$data)))
  tg_17_13_df <- as.data.frame(matrix(unlist(Target_17.13$data), nrow = nrow(Target_17.13$data)))
  
# łączenie wszystkich ramek danych w jedną bazę danych za pomocą funkcji rbind
  finall <- rbind(Goal1_df,Tg_1_2_df,tg_1_3_df,tg_1_4_df,tg_1_5_df,tg_1_6_df,tg_2_2_df,tg_2_3_df,tg_2_4_df,
                  tg_2_5_df,tg_2_6_df,tg_3_2_df,tg_3_2_df,tg_3_3_df,tg_3_4_df,tg_3_5_df,tg_3_6_df,tg_3_7_df,
                  tg_3_8_df,tg_3_9_df,tg_3_10_df,tg_3_11_df,tg_3_12_df,tg_3_13_df,tg_4_1_df,tg_4_2_df,tg_4_3_df,
                  tg_4_4_df,tg_4_5_df,tg_4_6_df,tg_4_7_df,tg_4_8_df,tg_4_8_df,tg_5_1_df,tg_5_2_df,tg_5_3_df,tg_5_4_df,
                  tg_5_5_df,tg_5_6_df,tg_6_1_df,tg_6_2_df,tg_6_3_df,tg_6_4_df,tg_6_5_df,tg_6_7_df,tg_6_8_df,tg_7_1_df,
                  tg_7_2_df,tg_7_3_df,tg_8_1_df,tg_8_2_df,tg_8_3_df,tg_8_4_df,tg_8_5_df,tg_8_6_df,tg_8_7_df,tg_8_8_df,
                  tg_9_1_df,tg_9_2_df,tg_9_3_df,tg_9_4_df,tg_9_5_df,tg_9_6_df,tg_9_7_df,tg_9_8_df,tg_10_1_df,tg_10_2_df,
                  tg_10_3_df,tg_10_4_df,tg_10_5_df,tg_10_6_df,tg_11_1_df,tg_11_2_df,tg_11_3_df,tg_11_4_df,tg_12_1_df,
                  tg_12_2_df,tg_13_1_df,tg_14_1_df,tg_14_2_df,tg_14_3_df,tg_15_1_df,tg_16_1_df,tg_16_2_df,tg_16_3_df,tg_16_4_df,
                  tg_16_5_df,tg_16_6_df,tg_16_7_df,tg_16_8_df,tg_17_1_df,tg_17_2_df,tg_17_3_df,tg_17_4_df,tg_17_5_df,tg_17_6_df,
                  tg_17_7_df,tg_17_8_df,vtg_17_9_df,tg_17_10_df,tg_17_11_df,tg_17_12_df,tg_17_13_df)
# wyświetl obiekt finall
  return(finall)
}
# wywołanie funkcji all_fun1 i przypisanie do zmiennej test_opt
test_opt <- all_fun1()

# zapisanie pibranych danych do formatu RDS w celu zmniejszenia rozmiaru i przyspieszenia ładowania apki
saveRDS(test_opt, "Baza_danych.rds")

# zamiana wartości w kolumnie value z factor na numeric
My_SDG <- My_SDG %>% mutate(Value = as.numeric(levels(Value))[Value])
