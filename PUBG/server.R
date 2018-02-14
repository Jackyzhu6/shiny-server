library(shiny)
library(XML)
library(RCurl)
options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))
library(rjson)
source("pubg_player_data.R")
shinyServer(function(input, output) {
  nog <- eventReactive(input$button,{
    Nickname <- input$id
    server <- input$server
    if (input$recent == "Most recent season"){
      recent <- 1
    }
    if (input$recent == "All historical data"){
      recent <- 0
    }
    uu <- paste("https://pubg.op.gg/user/",Nickname,"?server=",server,sep = "")
    ww <- getURL(uu)
    pagetree <- htmlTreeParse(ww, error=function(...){}, useInternalNodes = TRUE, encoding = "UTF-8")
    user_id <- unique(unlist(xpathSApply(pagetree,"//div", xmlGetAttr,'data-u-user_id')))
    if (is.null(user_id)){
      general_data <- c()
    } else {
      num_of_game <- xpathSApply(pagetree,"//div[@class = 'game-server__wrap']", xmlValue)
      num_of_game_b <- num_of_game
      if (server == "krjp"){
        server0 <- "KR/JP"
      } else {
        server0 <- toupper(server)
      }
      if (recent == 1){
        num_of_game <- as.numeric(gsub('[^0-9]','',unlist(strsplit(num_of_game[grepl(server0,num_of_game)],split = "Pre"))[1]))
        most_recent <- num_of_game
      }
      if (recent == 0){
        num_of_game <- sum(as.numeric(gsub('[^0-9]','',unlist(strsplit(num_of_game[grepl(server0,num_of_game)],split = "Pre")))))
        most_recent <- as.numeric(gsub('[^0-9]','',unlist(strsplit(num_of_game_b[grepl(server0,num_of_game_b)],split = "Pre"))[1]))
      }
    }
    return(num_of_game)
  })
  result1 <- eventReactive(input$button,{
    if (input$recent == "Most recent season"){
      recent1 <- 1
    }
    if (input$recent == "All historical data"){
      recent1 <- 0
    }
    Infile <- PUBG_player_DATA(input$id,input$server,recent1)
    validate(
      need(is.null(Infile$general_data) == FALSE, 
           message = "An Error Happens, Possible Reason:\n1. ID does not exist.\n2. ID has been banned by PUBG.\n3. No match data in this server.")
    )
      return(Infile)
    })
  
  output$highlights = renderUI({
    input$button
    withProgress(message = 'Parsing Data...', value = 1/13, {
      incProgress(1/13, detail = paste("Please wait for about ",1.1*nog()," seconds."))
      Sys.sleep(0.3)
      Map_p <- table(result1()$general_data$maps)
      Map_p <- Map_p/sum(Map_p)
      Map_prob <- paste("Map Probability: ",input$id," played on ",names(Map_p)[1]," with the probability of ",round((Map_p[1]*100),2),"%",","
                        ,input$id," played on ",names(Map_p)[2]," with the probability of ",round((Map_p[2]*100),2),"%",sep = "")
      incProgress(1/13, detail = paste("Most kill"))
      Sys.sleep(0.3)
      most_kill <- paste("Most Kill: ",input$id," killed ",max(result1()$general_data$kill),
                         " players on ",as.character(result1()$general_data$gametime[which.max(result1()$general_data$kill)]),sep = "")
      incProgress(1/13, detail = paste("Most headshot"))
      Sys.sleep(0.3)
      most_headshot <- paste("Most headshot: ",input$id," killed ",max(result1()$general_data$headshot_kill),
                             " players with headshot on ",as.character(result1()$general_data$gametime[which.max(result1()$general_data$headshot_kill)]),sep = "")
      incProgress(1/13, detail = paste("Most Damage"))
      Sys.sleep(0.3)
      most_damage <- paste("Most Damage: ",input$id," contributed a damage of ",max(result1()$general_data$damage),
                           " on ",as.character(result1()$general_data$gametime[which.max(result1()$general_data$damage)]),sep = "")
      incProgress(1/13, detail = paste("Most Walk Distance"))
      Sys.sleep(0.3)
      most_walk_distance <- paste("Most walking distance: ",input$id," walked ",max(result1()$general_data$walk_distance),
                                  " meters on ",as.character(result1()$general_data$gametime[which.max(result1()$general_data$walk_distance)]),sep = "")
      incProgress(1/13, detail = paste("Most ride distance"))
      Sys.sleep(0.3)
      most_ride_distance <- paste("Most riding distance: ",input$id," rided ",max(result1()$general_data$ride_distance),
                                  " meters on ",as.character(result1()$general_data$gametime[which.max(result1()$general_data$ride_distance)]),sep = "")
      incProgress(1/13, detail = paste("longest kill"))
      Sys.sleep(0.3)
      kill_info <- result1()$match_info[result1()$match_info$killer_name == input$id,]
      lk <- max(as.numeric(as.character(kill_info$distance)),na.rm = TRUE)
      longest_kill <- paste("Longest Kill: ",input$id," killed ",kill_info$victim_name[kill_info$distance == lk][1]," with ",kill_info$description[kill_info$distance == lk][1]," from ",lk,
                            " meters away on ",
                            as.character(result1()$general_data$gametime[result1()$general_data$match_id == kill_info$match_id[kill_info$distance == lk][1]]))
      incProgress(1/13, detail = paste("longest death"))
      Sys.sleep(0.3)
      vic_info <- result1()$match_info[result1()$match_info$victim_name == input$id,]
      lvic <- max(as.numeric(as.character(vic_info$distance)),na.rm = TRUE)
      longest_death <- paste("Longest death: ",input$id," was killed by ",vic_info$killer_name[vic_info$distance == lvic][1]," with ",vic_info$description[vic_info$distance == lvic][1]," from ",
                             lvic," meters away on ",
                             as.character(result1()$general_data$gametime[result1()$general_data$match_id == vic_info$match_id[vic_info$distance == lvic][1]]))
      incProgress(1/13, detail = paste("Weapon kill"))
      Sys.sleep(0.3)
      w_kill <- table(kill_info$description[kill_info$description != "Down and Out"])[which.max(table(kill_info$description[kill_info$description != "Down and Out"]))[1]]
      weapon_kill <- paste("Most used weapon for killing: ",input$id," has used ",names(w_kill)," killing ",as.numeric(w_kill)," players among all matches.")
      incProgress(1/13, detail = paste("Weapon killed"))
      Sys.sleep(0.3)
      w_vic <- table(vic_info$description[vic_info$description != "Down and Out"])[which.max(table(vic_info$description[vic_info$description != "Down and Out"]))[1]]
      weapon_vic <- paste("Killed by most used weapon : ",input$id," has been killed by ",names(w_vic)," by ",as.numeric(w_vic)," players among all matches.")
      incProgress(1/13, detail = paste("Control player"))
      Sys.sleep(0.3)
      control <- table(kill_info$victim_name)
      control <- control[names(control)%in% c("",input$id,"#unknown") == FALSE]
      control_player <- paste("Player who is controlled by you: ",input$id," killed ",names(control[which.max(control)])," ",as.numeric(control[which.max(control)]),
                              " times among all matches.")
      incProgress(1/13, detail = paste("Controlled by"))
      Sys.sleep(0.3)
      controlled <- table(vic_info$killer_name)
      controlled <- controlled[names(controlled)%in% c("",input$id,"#unknown") == FALSE]
      controlled_player <- paste("Player who controll you: ",input$id," is killed by ",names(controlled[which.max(controlled)])," ",as.numeric(controlled[which.max(controlled)]),
                                 " times among all matches.")
    })
    HTML(paste(Map_prob,most_kill,most_headshot,most_damage,most_walk_distance,most_ride_distance,longest_kill,longest_death,weapon_kill,weapon_vic,
               control_player,controlled_player, sep = '<br/><br/>'))
    HTML(paste(Map_prob,most_kill,most_headshot,most_damage,most_walk_distance,most_ride_distance,longest_kill,longest_death,weapon_kill,weapon_vic,
               control_player,controlled_player, sep = '<br/><br/>'))
  })
  
  output$killplot <- renderPlot({
    mode_list <- unique(result1()$general_data[,6:7])
    par(mfrow = c(dim(mode_list)[1],2))
    for (i in 1:dim(mode_list)[1]){
      mode <- result1()$general_data[result1()$general_data$match_mode == mode_list$match_mode[i] & result1()$general_data$queue_size == mode_list$queue_size[i],]
      kill <- c()
      for (j in 1:dim(mode)[1]){
        kill[j] <- mean(mode$kill[(dim(mode)[1] - j + 1):dim(mode)[1]])
      }
      plot(kill,type = "l",col = i,xlab = "time",ylab = "Average Kill",xaxt = 'n',
           main = paste("Match mode:",as.character(mode_list$match_mode[i]),",","Queue Size:",as.character(mode_list$queue_size[i])))
      axis(side = 1, at = 1:dim(mode)[1],labels = mode$gametime[dim(mode)[1]:1])
    }
  },height = 1600, width = 1600)
  
  output$headshotplot <- renderPlot({
    mode_list <- unique(result1()$general_data[,6:7])
    par(mfrow = c(dim(mode_list)[1],2))
    for (i in 1:dim(mode_list)[1]){
      mode <- result1()$general_data[result1()$general_data$match_mode == mode_list$match_mode[i] & result1()$general_data$queue_size == mode_list$queue_size[i],]
      headshot <- c()
      for (j in 1:dim(mode)[1]){
        if (sum(mode$kill[(dim(mode)[1] - j + 1):dim(mode)[1]]) == 0){
          headshot[j] <- 0
        } else {
          headshot[j] <- sum(mode$headshot_kill[(dim(mode)[1] - j + 1):dim(mode)[1]])/sum(mode$kill[(dim(mode)[1] - j + 1):dim(mode)[1]])
        }
      }
      plot(headshot,type = "l",col = i,xlab = "time",ylab = "Headshot%",xaxt = 'n',
           main = paste("Match mode:",as.character(mode_list$match_mode[i]),",","Queue Size:",as.character(mode_list$queue_size[i])))
      axis(side = 1, at = 1:dim(mode)[1],labels = mode$gametime[dim(mode)[1]:1])
    }
  },height = 1600, width = 1600)
  
  output$damageplot <- renderPlot({
    mode_list <- unique(result1()$general_data[,6:7])
    par(mfrow = c(dim(mode_list)[1],2))
    for (i in 1:dim(mode_list)[1]){
      mode <- result1()$general_data[result1()$general_data$match_mode == mode_list$match_mode[i] & result1()$general_data$queue_size == mode_list$queue_size[i],]
      damage <- c()
      for (j in 1:dim(mode)[1]){
          damage[j] <- mean(mode$damage[(dim(mode)[1] - j + 1):dim(mode)[1]])
      }
      plot(damage,type = "l",col = i,xlab = "time",ylab = "Headshot%",xaxt = 'n',
           main = paste("Match mode:",as.character(mode_list$match_mode[i]),",","Queue Size:",as.character(mode_list$queue_size[i])))
      axis(side = 1, at = 1:dim(mode)[1],labels = mode$gametime[dim(mode)[1]:1])
    }
  },height = 1600, width = 1600)
  
  # output$info <- renderText({
  #   paste("You have ",nog()," matches in the record based on your information. The estimation time for analyzing your data is ",nog()*1.1," seconds, and it also
  #         depends on your network environment, maybe longer or shorter. If you would like to continue analyzing your advanced data, please click the 'Analyze' button
  #         on the left. Thank you for your patience.")
  # })
  # output$values = renderDataTable({
  #   result1()$general_data[,-c(4,5)]
  # },options = list(aLengthMenu = c(10, 20, 50), iDisplayLength = 10))
})
