Damage <- function(data1,data2){
  wugong1 <- as.numeric(as.character(data1[data1[,1] == "最小物攻",2]))
  wugong2 <- as.numeric(as.character(data1[data1[,1] == "最大物攻",2]))
  fushang <- as.numeric(as.character(data1[data1[,1] == "附伤",2]))
  zhuxin <- ceiling(as.numeric(as.character(data1[data1[,1] == "诛心",2]))/17.1)/100
  if(zhuxin > 0.25){zhuxin = 0.25}
  renhuo <- as.numeric(as.character(data1[data1[,1] == "人祸",2]))/100
  wanjun <- ceiling(as.numeric(as.character(data1[data1[,1] == "万钧",2]))/17.1)/100
  if(wanjun > 0.25){zhuxin = 0.25}
  wufang <- as.numeric(as.character(data2[data2[,1] == "物防",2]))/6160
  fafang <- as.numeric(as.character(data2[data2[,1] == "法防",2]))/6160
  zhibi <- as.numeric(as.character(data2[data2[,1] == "知彼",2]))/100
  if (wufang > 0.8){wufang = 0.8}
  if (fafang > 0.8){fafang = 0.8}
  jizhong1 <- round(wugong1*(1-wufang)*(1-zhibi)*(1+renhuo) + fushang*(1-fafang)*(1-zhibi)*(1+renhuo),2)
  jizhong2 <- round(wugong2*(1-wufang)*(1-zhibi)*(1+renhuo) + fushang*(1-fafang)*(1-zhibi)*(1+renhuo),2)
  jizhong <- paste(jizhong1,jizhong2,sep = " ~ ")
  yaohai1 <- round(wugong1*(1-wufang)*(1-zhibi)*(1+renhuo)*2 + fushang*(1-fafang)*(1-zhibi)*(1+renhuo),2)
  yaohai2 <- round(wugong1*(1-wufang)*(1-zhibi)*(1+renhuo)*2 + fushang*(1-fafang)*(1-zhibi)*(1+renhuo),2)
  yaohai <- paste(yaohai1,yaohai2,sep = " ~ ")
  huixin1 <- round(wugong1*(1-wufang)*(1-zhibi)*(1+renhuo)*1.4 + fushang*(1-fafang)*(1-zhibi)*(1+renhuo)*1.4,2)
  huixin2 <- round(wugong1*(1-wufang)*(1-zhibi)*(1+renhuo)*1.6 + fushang*(1-fafang)*(1-zhibi)*(1+renhuo)*1.6,2)
  huixin <- paste(huixin1,huixin2,sep = " ~ ")
  result <- data.frame(名称 = c("普攻击中","普攻要害","普攻会心"),伤害 = c(jizhong,yaohai,huixin))
  result
}
