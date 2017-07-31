#### Outlier Detection Function ####
OD <- function(data,percentage){
  N <- dim(data)[1]
  n <- floor(N*percentage)
  if (n == 0){
    Result <- rep(TRUE,N)
  } else {
    dist <- as.matrix(dist(data))
    score <- c()
    for (i in 1:N){
      score[i] <- sum(dist[order(dist[,i])[1:(2*n)],i]) 
    }
    Result <- rep(TRUE,N)
    Result[order(-score)[1:n]] <- FALSE
  }
  Result
}
# Input:
#   begin_date: beginning date for prediction
#   train_length: length of historical date for training model
#   p: outlier percentage setting
# Output:
#   Outlier
Method5 <- function(DATA,begin_date,end_date,p){
  DATA$date <- as.Date(DATA$date,"%d%b%Y")
  HOTEL <- unique(DATA$hotel)
  DOW <- as.character(unique(DATA$day_of_week))
  if (begin_date > end_date - 1){
    message("Are you kidding me? The start date should be set before the end date!!!")
  } else {
    data <- DATA[DATA$date < end_date + 1 & DATA$date > begin_date - 1,]
    Outlier <- c()
    for (i in 1:length(HOTEL)){
      PC <- unique(DATA$pc[DATA$hotel == HOTEL[i]])
      for (j in 1:length(PC)){
        for (k in 1:length(DOW)){
          dat <- data[data$hotel == HOTEL[i] & data$pc == PC[j] & data$day_of_week == DOW[k],]
          Outlier <- rbind(Outlier,dat[OD(dat[,-c(1,2,3,4)],p) == FALSE,])
        }
      }
    }
    Outlier
  }
}



