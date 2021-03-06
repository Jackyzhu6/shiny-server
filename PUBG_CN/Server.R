library(shiny)
library(XML)
library(RCurl)
# options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))
library(rjson)
library(plotrix)
source("pubg_player_data.R")
shinyServer(function(input, output) {
############################################
  nog <- eventReactive(input$button,{
    Nickname <- input$id
    server <- input$server
    if (input$recent == "最近赛季"){
      recent <- 1
    }
    if (input$recent == "正式版以来所有数据"){
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
#################################################
  result1 <- eventReactive(input$button,{
    Nickname <- input$id
    server <- input$server
    if (input$recent == "最近赛季"){
      recent <- 1
    }
    if (input$recent == "正式版以来所有数据"){
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
      ###############################################
      uu <- paste("https://pubg.op.gg/api/users/",user_id,"/matches/recent?server=",server,"&queue_size=&mode=&after=",sep = "")
      ww <- fromJSON(getURL(uu))
      offset <- sapply(ww$matches$items,function(x) x$offset)
      gametime <- sapply(ww$matches$items,function(x) x$started_at)
      gametime <- gsub("T"," ",gametime)
      gametime <- as.POSIXct(gametime,format = "%Y-%m-%d %H:%M:%S")
      match_id <- sapply(ww$matches$items,function(x) x$match_id)
      match_mode <- sapply(ww$matches$items,function(x) x$mode)
      queue_size <- sapply(ww$matches$items,function(x) x$queue_size)
      damage <- sapply(ww$matches$items,function(x) x$participant$stats$combat$damage$damage_dealt)
      kill <- sapply(ww$matches$items,function(x) x$participant$stats$combat$kda$kills)
      headshot_kill <- sapply(ww$matches$items,function(x) x$participant$stats$combat$kda$headshot_kills)
      longest_kill <- sapply(ww$matches$items,function(x) x$participant$stats$combat$kda$longest_kill)
      assist <- sapply(ww$matches$items,function(x) x$participant$stats$combat$kda$assists)
      total_rank <- sapply(ww$matches$items,function(x) x$total_rank)
      player_rank <- sapply(ww$matches$items,function(x) x$participant$stats$rank)
      score_diff <- sapply(ww$matches$items,function(x) x$participant$stats$rating_delta)
      walk_distance <- sapply(ww$matches$items,function(x) x$participant$stats$combat$distance_traveled$walk_distance)
      ride_distance <- sapply(ww$matches$items,function(x) x$participant$stats$combat$distance_traveled$ride_distance)
      survive_time <- sapply(ww$matches$items,function(x) x$participant$stats$combat$time_survived)
      general_data <- data.frame(offset,match_id,match_mode,queue_size,gametime,score_diff,total_rank,player_rank,damage,kill,headshot_kill,longest_kill,assist,survive_time,walk_distance,ride_distance)
      
      pages <- floor((num_of_game - 1)/20)
      
      if (pages == 0){
        general_data <- general_data
      } else {
        for (k in 1:pages){
          tail <- offset[length(offset)]
          uu <- paste("https://pubg.op.gg/api/users/",user_id,"/matches/recent?server=",server,"&queue_size=&mode=&after=",tail,sep = "")
          ww <- fromJSON(getURL(uu))
          offset <- sapply(ww$matches$items,function(x) x$offset)
          gametime <- sapply(ww$matches$items,function(x) x$started_at)
          gametime <- gsub("T"," ",gametime)
          gametime <- as.POSIXct(gametime,format = "%Y-%m-%d %H:%M:%S")
          match_id <- sapply(ww$matches$items,function(x) x$match_id)
          match_mode <- sapply(ww$matches$items,function(x) x$mode)
          queue_size <- sapply(ww$matches$items,function(x) x$queue_size)
          damage <- sapply(ww$matches$items,function(x) x$participant$stats$combat$damage$damage_dealt)
          kill <- sapply(ww$matches$items,function(x) x$participant$stats$combat$kda$kills)
          headshot_kill <- sapply(ww$matches$items,function(x) x$participant$stats$combat$kda$headshot_kills)
          longest_kill <- sapply(ww$matches$items,function(x) x$participant$stats$combat$kda$longest_kill)
          assist <- sapply(ww$matches$items,function(x) x$participant$stats$combat$kda$assists)
          total_rank <- sapply(ww$matches$items,function(x) x$total_rank)
          player_rank <- sapply(ww$matches$items,function(x) x$participant$stats$rank)
          score_diff <- sapply(ww$matches$items,function(x) x$participant$stats$rating_delta)
          walk_distance <- sapply(ww$matches$items,function(x) x$participant$stats$combat$distance_traveled$walk_distance)
          ride_distance <- sapply(ww$matches$items,function(x) x$participant$stats$combat$distance_traveled$ride_distance)
          survive_time <- sapply(ww$matches$items,function(x) x$participant$stats$combat$time_survived)
          new_data <- data.frame(offset,match_id,match_mode,queue_size,gametime,score_diff,total_rank,player_rank,damage,kill,headshot_kill,longest_kill,assist,survive_time,walk_distance,ride_distance)
          general_data <- rbind(general_data,new_data)
        }
      }
      general_data <- general_data[1:num_of_game,]
      general_data_recent <- general_data[1:most_recent,]
      score <- rep(0,num_of_game)
      for (i in 1:most_recent){
        xx <- general_data_recent[general_data_recent$match_mode == general_data_recent$match_mode[i] & general_data_recent$queue_size == general_data_recent$queue_size[i],]
        score[i] <- 1200 + sum(xx[xx$gametime < general_data_recent$gametime[i],]$score_diff)
      }
      general_data <- data.frame(player_id = rep(Nickname,num_of_game),score,general_data)
    }
    validate(
      need(is.null(general_data) == FALSE, 
           message = "发生了错误, 可能的原因:\n1. 昵称不存在.\n2. 玩家被开发者封禁.\n3. 该服务器上没有匹配数据.")
    )
    return(list(general_data = general_data))
  })
  
  result2 <- eventReactive(input$button,{
    if (input$recent == "最近赛季"){
      recent1 <- 1
    }
    if (input$recent == "正式版以来所有数据"){
      recent1 <- 0
    }
    Infile <- PUBG_player_DATA(input$id,input$server,recent1)
    validate(
      need(is.null(Infile$general_data) == FALSE, 
           message = "发生了错误, 可能的原因:\n1. 昵称不存在.\n2. 玩家被开发者封禁.\n3. 该服务器上没有匹配数据.")
    )
    return(Infile)
  })
  
  
  output$highlights = renderUI({
    withProgress(message = '调取数据...', value = 1/8, {
      incProgress(1/8, detail = paste("请等待大约",1.1*nog(),"秒."))
      Sys.sleep(0.1)
      Map_p <- table(result2()$general_data$maps)
      Map_p <- Map_p/sum(Map_p)
      Map_prob <- paste("地图匹配概率：",input$id,"在地图",names(Map_p)[1],"上匹配的概率为",round((Map_p[1]*100),2),"%",","
                        ,input$id,"在地图",names(Map_p)[2],"上匹配的概率为",round((Map_p[2]*100),2),"%",sep = "")
      incProgress(1/8, detail = paste("Most kill"))
      Sys.sleep(0.1)
      
      distance <- result2()$match_info$distance
      distance <- as.numeric(as.character(distance))
      cheater_info <- unique(result2()$match_info$killer_name[which(distance > 600)])
      hacker <- paste("曾经匹配到的作弊者: 在",nog(),"场比赛里, ",input$id,"曾遇到过",length(cheater_info),"个显著的作弊者.",sep = "")
     
      kill_info <- result2()$match_info[result2()$match_info$killer_name == input$id,]
      lk <- max(as.numeric(as.character(kill_info$distance)),na.rm = TRUE)
      longest_kill <- paste("最远距离击杀: ",input$id,"在",
                            as.character(result2()$general_data$gametime[result2()$general_data$match_id == kill_info$match_id[kill_info$distance == lk][1]])
                            ,"用",kill_info$description[kill_info$distance == lk][1],"在",lk,
                            "米外击杀了",kill_info$victim_name[kill_info$distance == lk][1])
      incProgress(1/8, detail = paste("kill/death information"))
      Sys.sleep(0.1)
      vic_info <- result2()$match_info[result2()$match_info$victim_name == input$id,]
      lvic <- max(as.numeric(as.character(vic_info$distance)),na.rm = TRUE)
      longest_death <- paste("最远距离被击杀: ",input$id,"在",
                             as.character(result2()$general_data$gametime[result2()$general_data$match_id == vic_info$match_id[vic_info$distance == lvic][1]]),
                             "被",vic_info$killer_name[vic_info$distance == lvic][1],"以",vic_info$description[vic_info$distance == lvic][1],"在",
                             lvic,"米之外击杀. ")
      incProgress(1/8, detail = paste("Weapon kill"))
      Sys.sleep(0.1)
      w_kill <- table(kill_info$description[kill_info$description != "Down and Out"])[which.max(table(kill_info$description[kill_info$description != "Down and Out"]))[1]]
      weapon_kill <- paste("击杀人数最多的武器: ",input$id,"在所有比赛里用",names(w_kill),"击杀了",as.numeric(w_kill),"名玩家.")
      incProgress(1/8, detail = paste("Weapon killed"))
      Sys.sleep(0.1)
      w_vic <- table(vic_info$description[vic_info$description != "Down and Out"])[which.max(table(vic_info$description[vic_info$description != "Down and Out"]))[1]]
      weapon_vic <- paste("被最多的武器击杀: ",input$id,"在所有比赛里被",names(w_vic),"击杀了",as.numeric(w_vic),"次.")
      incProgress(1/8, detail = paste("Control player"))
      Sys.sleep(0.1)
      control <- table(kill_info$victim_name)
      control <- control[names(control)%in% c("",input$id,"#unknown") == FALSE]
      control_player <- paste("被你控制的玩家: ",input$id,"在所有比赛里击杀了",names(control[which.max(control)]),"共计",as.numeric(control[which.max(control)]),
                              "次.")
      incProgress(1/8, detail = paste("Controlled by"))
      Sys.sleep(0.1)
      controlled <- table(vic_info$killer_name)
      controlled <- controlled[names(controlled)%in% c("",input$id,"#unknown") == FALSE]
      controlled_player <- paste("控制你的玩家: ",input$id,"在所有比赛里被",names(controlled[which.max(controlled)]),"共计击杀了",as.numeric(controlled[which.max(controlled)]),
                                 "次.")
    })
    HTML(paste(Map_prob,longest_kill,longest_death,weapon_kill,weapon_vic,
               control_player,controlled_player, hacker,sep = '<br/><br/>'))
    
  })
  
  output$weaponplot <- renderPlot({
    par(mfrow = c(1,2))
    kill_info <- result2()$match_info[result2()$match_info$killer_name == input$id,]
    weapon <- data.frame(table(kill_info$description))
    weapon <- weapon[weapon$Var1 != "Down and Out",]
    weapon <- weapon[weapon$Freq != 0,]
    weapon <- weapon[order(-weapon$Freq)[1:min(10,dim(weapon)[1])],]
    pie3D(weapon$Freq, labels = paste(weapon$Var1,"\n",weapon$Freq,sep = ""),explode=0.05,
          main="Weapon: Frequency of kill")
    vic_info <- result2()$match_info[result2()$match_info$victim_name == input$id,]
    weapon <- data.frame(table(vic_info$description))
    weapon <- weapon[weapon$Var1 != "Down and Out",]
    weapon <- weapon[weapon$Freq != 0,]
    weapon <- weapon[order(-weapon$Freq)[1:min(10,dim(weapon)[1])],]
    pie3D(weapon$Freq, labels = paste(weapon$Var1,"\n",weapon$Freq,sep = ""),explode=0.05,
          main="Weapon: Frequency of death")
  })
  
  output$cheaters <- renderDataTable({
    distance <- result2()$match_info$distance
    distance <- as.numeric(as.character(distance))
    cheater_info <- merge(result2()$general_data[,c(5,8)],unique(result2()$match_info[which(distance > 600),c(1,8)]),by = "match_id")[,c(3,2)]
    cheater_info <- cheater_info[order(cheater_info$gametime),]
    cheater_info[dim(cheater_info)[1]:1,]
  },options = list(aLengthMenu = c(10, 20, 50), iDisplayLength = 10))
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  output$highlights1 = renderUI({
    withProgress(message = '调取数据...', value = 1/6, {
      incProgress(1/6, detail = paste("请等待大约",0.015*nog(),"秒."))
      Sys.sleep(0.2)
      most_kill <- paste("最多击杀: ",input$id,"在",as.character(result1()$general_data$gametime[which.max(result1()$general_data$kill)]), "击杀了",max(result1()$general_data$kill),
                         "名玩家",sep = "")
      incProgress(1/6, detail = paste("Most headshot"))
      Sys.sleep(0.2)
      most_headshot <- paste("最多爆头数: ",input$id,"在",as.character(result1()$general_data$gametime[which.max(result1()$general_data$headshot_kill)]),
                             "以爆头击杀了",max(result1()$general_data$headshot_kill),
                             "名玩家",sep = "")
      incProgress(1/6, detail = paste("Most Damage"))
      Sys.sleep(0.2)
      most_damage <- paste("最高伤害: ",input$id,"在",as.character(result1()$general_data$gametime[which.max(result1()$general_data$damage)])
                           ,"打出了",max(result1()$general_data$damage),
                           "点伤害",sep = "")
      incProgress(1/6, detail = paste("Most Walk Distance"))
      Sys.sleep(0.2)
      most_walk_distance <- paste("最远步行距离: ",input$id,"在",as.character(result1()$general_data$gametime[which.max(result1()$general_data$walk_distance)])
                                  ,"步行前进了",max(result1()$general_data$walk_distance),
                                  "米.",sep = "")
      incProgress(1/6, detail = paste("Most ride distance"))
      Sys.sleep(0.2)
      most_ride_distance <- paste("最远驾驶距离: ",input$id,"在",as.character(result1()$general_data$gametime[which.max(result1()$general_data$ride_distance)])
                                  ,"驾驶前进了",max(result1()$general_data$ride_distance),
                                  "米.",sep = "")
    })
    HTML(paste(most_kill,most_headshot,most_damage,most_walk_distance,most_ride_distance, sep = '<br/><br/>'))
    
  })
  
  output$killplot <- renderPlot({
    mode_list <- unique(result1()$general_data[,5:6])
    par(mfrow = c(ceiling(dim(mode_list)[1]/2),2))
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
  },height = 600, width = 800)
  
  output$headshotplot <- renderPlot({
    mode_list <- unique(result1()$general_data[,5:6])
    par(mfrow = c(ceiling(dim(mode_list)[1]/2),2))
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
  },height = 600, width = 800)
  
  output$damageplot <- renderPlot({
    mode_list <- unique(result1()$general_data[,5:6])
    par(mfrow = c(ceiling(dim(mode_list)[1]/2),2))
    for (i in 1:dim(mode_list)[1]){
      mode <- result1()$general_data[result1()$general_data$match_mode == mode_list$match_mode[i] & result1()$general_data$queue_size == mode_list$queue_size[i],]
      damage <- c()
      for (j in 1:dim(mode)[1]){
        damage[j] <- mean(mode$damage[(dim(mode)[1] - j + 1):dim(mode)[1]])
      }
      plot(damage,type = "l",col = i,xlab = "time",ylab = "Damage",xaxt = 'n',
           main = paste("Match mode:",as.character(mode_list$match_mode[i]),",","Queue Size:",as.character(mode_list$queue_size[i])))
      axis(side = 1, at = 1:dim(mode)[1],labels = mode$gametime[dim(mode)[1]:1])
    }
  },height = 600, width = 800)
  
  output$rankplot <- renderPlot({
    mode_list <- unique(result1()$general_data[,5:6])
    par(mfrow = c(ceiling(dim(mode_list)[1]/2),2))
    for (i in 1:dim(mode_list)[1]){
      mode <- result1()$general_data[result1()$general_data$match_mode == mode_list$match_mode[i] & result1()$general_data$queue_size == mode_list$queue_size[i],]
      rank <- c()
      for (j in 1:dim(mode)[1]){
        rank[j] <- mean(mode$player_rank[(dim(mode)[1] - j + 1):dim(mode)[1]])
      }
      plot(rank,type = "l",col = i,xlab = "time",ylab = "Average Rank",xaxt = 'n',
           main = paste("Match mode:",as.character(mode_list$match_mode[i]),",","Queue Size:",as.character(mode_list$queue_size[i])))
      axis(side = 1, at = 1:dim(mode)[1],labels = mode$gametime[dim(mode)[1]:1])
    }
  },height = 600, width = 800)
  
  output$rankplot <- renderPlot({
    mode_list <- unique(result1()$general_data[,5:6])
    par(mfrow = c(ceiling(dim(mode_list)[1]/2),2))
    for (i in 1:dim(mode_list)[1]){
      mode <- result1()$general_data[result1()$general_data$match_mode == mode_list$match_mode[i] & result1()$general_data$queue_size == mode_list$queue_size[i],]
      rank <- c()
      for (j in 1:dim(mode)[1]){
        rank[j] <- mean(mode$player_rank[(dim(mode)[1] - j + 1):dim(mode)[1]])
      }
      plot(rank,type = "l",col = i,xlab = "time",ylab = "Average Rank",xaxt = 'n',
           main = paste("Match mode:",as.character(mode_list$match_mode[i]),",","Queue Size:",as.character(mode_list$queue_size[i])))
      axis(side = 1, at = 1:dim(mode)[1],labels = mode$gametime[dim(mode)[1]:1])
    }
  },height = 600, width = 800)
  
  output$surviveplot <- renderPlot({
    mode_list <- unique(result1()$general_data[,5:6])
    par(mfrow = c(ceiling(dim(mode_list)[1]/2),2))
    for (i in 1:dim(mode_list)[1]){
      mode <- result1()$general_data[result1()$general_data$match_mode == mode_list$match_mode[i] & result1()$general_data$queue_size == mode_list$queue_size[i],]
      survive <- c()
      for (j in 1:dim(mode)[1]){
        survive[j] <- mean(mode$survive_time[(dim(mode)[1] - j + 1):dim(mode)[1]])
      }
      plot(survive,type = "l",col = i,xlab = "time",ylab = "Average Survive Trend",xaxt = 'n',
           main = paste("Match mode:",as.character(mode_list$match_mode[i]),",","Queue Size:",as.character(mode_list$queue_size[i])))
      axis(side = 1, at = 1:dim(mode)[1],labels = mode$gametime[dim(mode)[1]:1])
    }
  },height = 600, width = 800)
  
  output$scoreplot <- renderPlot({
    mode_list <- unique(result1()$general_data[,5:6])
    par(mfrow = c(ceiling(dim(mode_list)[1]/2),2))
    for (i in 1:dim(mode_list)[1]){
      mode <- result1()$general_data[result1()$general_data$match_mode == mode_list$match_mode[i] & result1()$general_data$queue_size == mode_list$queue_size[i],]
      score <- c()
      for (j in 1:dim(mode)[1]){
        score[j] <- mode$score[dim(mode)[1] - j + 1]
      }
      plot(score,type = "l",col = i,xlab = "time",ylab = "Average Survive Trend",xaxt = 'n',
           main = paste("Match mode:",as.character(mode_list$match_mode[i]),",","Queue Size:",as.character(mode_list$queue_size[i])))
      axis(side = 1, at = 1:dim(mode)[1],labels = mode$gametime[dim(mode)[1]:1])
    }
  },height = 600, width = 800)
  
  # output$weaponplot <- renderPlot({
  #   
  # })
  
  # output$info <- renderText({
  #   paste("You have ",nog()," matches in the record based on your information. The estimation time for analyzing your data is ",nog()*1.1," seconds, and it also
  #         depends on your network environment, maybe longer or shorter. If you would like to continue analyzing your advanced data, please click the 'Analyze' button
  #         on the left. Thank you for your patience.")
  # })
  # output$values = renderDataTable({
  #   result1()$general_data[,-c(4,5)]
  # },options = list(aLengthMenu = c(10, 20, 50), iDisplayLength = 10))
})
