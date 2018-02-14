library(XML)
library(RCurl)
library(rjson)
options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "Rcurl")))
credentials$handshake()
PUBG_player_DATA <- function(Nickname,server,recent){
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
  
#####################################
  if (is.null(general_data)){
    match_info <- c()
  } else {
    match_info <- c()
    for (j in 1:num_of_game){
      url <- paste("https://pubg.op.gg/api/matches/",general_data$match_id[j],"/deaths",sep = "")
      web <- fromJSON(getURL(url))
      if (is.null(web$deaths)){
        match_info <- match_info
      } else {
        map <- web$map_id
        if (is.null(map)){
          map <- "ERANGEL"
        }
        time_event <-  sapply(web$deaths,function(x) x$time_event)
        description <- sapply(web$deaths,function(x) x$description)
        victim_name <- sapply(web$deaths,function(x) x$victim$user$nickname)
        victim_x <-  sapply(web$deaths,function(x) x$victim$position$x)
        victim_y <- sapply(web$deaths,function(x) x$victim$position$y)
        killer_name <- sapply(web$deaths,function(x) paste(x$killer$user$nickname,"",sep = ""))
        killer_x <- sapply(web$deaths,function(x) sum(x$killer$position$x))
        killer_y <- sapply(web$deaths,function(x) sum(x$killer$position$y))
        distance <- sqrt((victim_x - killer_x)^2 + (victim_y - killer_y)^2)/100
        for (i in 1:length(time_event)){
          if (victim_x[i] == 0 & killer_x[i] > 0 | victim_x[i] > 0 & killer_x[i] == 0){
            distance[i] <- "Error"
          }
        }
        distance <- as.character(distance)
        new_data <- data.frame(match_id = rep(general_data$match_id[j],length(time_event)),map = rep(map,length(time_event)),time_event,description,victim_name,
                               victim_x,victim_y,killer_name,killer_x,killer_y,distance)
        match_info <- rbind(match_info,new_data)
        print(paste("Parsing Data...",round(100*j/num_of_game,2),"%",sep = ""))
      }
    }
  }
  maps <- c()
  for (i in 1:dim(general_data)[1]){
    maps[i] <- unique(as.character(match_info[match_info$match_id == general_data$match_id[i],]$map))
  }
  general_data <- data.frame(maps,general_data)
  list(general_data = general_data, match_info = match_info)
}





