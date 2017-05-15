library(shiny)
library(XML)
informationofYJrole<-function(url){
  pagetree<-htmlTreeParse(url, error=function(...){}, useInternalNodes = TRUE)
  name<-xpathSApply(pagetree,"//head//title",xmlValue)
  name0<-gsub("\t|\n|%","",name)
  Name<-unlist(strsplit(name0,split="-"))[1]
  rank<-xpathSApply(pagetree,"//span//em",xmlValue)[2]
  school <- xpathSApply(pagetree,"//span//a",xmlValue)[1]
  class <- xpathSApply(pagetree,"//span//a",xmlValue)[3]
  quality0<-xpathSApply(pagetree,"//ul//li",xmlValue)
  quality<-gsub("\t|\n|%","",quality0)
  value<-unlist(strsplit(quality[46],split="装备评价:"))[2]
  li<-quality[55]
  ji<-quality[61]
  ti<-quality[57]
  min<-quality[59]
  hun<-quality[63]
  nian<-quality[65]
  wanjun<-unlist(strsplit(quality[86],split="万钧"))[2]
  tiebi<-unlist(strsplit(quality[87],split="铁壁"))[2]
  mingzhong<-unlist(strsplit(quality[68],split="命中"))[2]
  fushang<-unlist(strsplit(quality[72],split="附加伤害"))[2]
  yuxin<-unlist(strsplit(quality[85],split="御心"))[2]
  huixin<-unlist(strsplit(quality[71],split="会心一击"))[2]
  zhuxin<-unlist(strsplit(quality[84],split="诛心"))[2]
  speed<-unlist(strsplit(quality[89],split="追电"))[2]
  renhuo<-unlist(strsplit(quality[94],split="人祸"))[2]
  zhongji<-unlist(strsplit(quality[70],split="重击"))[2]
  wugong<-unlist(strsplit(quality[67],split="攻力"))[2]
  wugong1<-unlist(strsplit(wugong,split="-"))[1]
  wugong2<-unlist(strsplit(wugong,split="-"))[2]
  fagong<-unlist(strsplit(quality[69],split="法力"))[2]
  fagong1<-unlist(strsplit(fagong,split="-"))[1]
  fagong2<-unlist(strsplit(fagong,split="-"))[2]
  sing<-unlist(strsplit(quality[91],split="疾语"))[2]
  defence<-unlist(strsplit(quality[74],split="防御"))[2]
  fafang<-unlist(strsplit(quality[76],split="法防"))[2]
  blood<-quality[51]
  mana<-quality[53]
  shenming<-unlist(strsplit(quality[77],split="神明"))[2]
  huibi<-unlist(strsplit(quality[75],split="回避"))[2]
  zhibi<-unlist(strsplit(quality[79],split="知彼"))[2]
  zhuangbei<-xpathSApply(pagetree,"//div//h3",xmlValue)
  n <- length(zhuangbei)
  zhuangbei <- zhuangbei[1:(n-2)]
  Zhuangbei<-rep("无效",19)
  if (length(zhuangbei)==19){
    Zhuangbei<-zhuangbei}
  result <- c(Name,rank,school,class,value,li,hun,ti,min,ji,nian,wugong1,wugong2,fagong1,fagong2,mingzhong,huixin,fushang,zhongji,zhuxin,yuxin,wanjun,tiebi,renhuo,sing,speed,defence,fafang,blood,mana,shenming,huibi,zhibi,Zhuangbei)
  names <- c("昵称","等级","门派","势力","装评","力","魂","体","敏","疾","念","最小物攻","最大物攻","最小法攻",
             "最大法攻","命中","会心","附伤","重击","诛心","御心","万钧","铁壁","人祸","疾语",
             "追电","物防","法防","生命值","技力值","神明","回避","知彼","耳环一","头冠","耳环二",
             "肩膀","手镯一","翅膀","衣服","手镯二","护腕","腰带","武器","戒指一","下摆","副手",
             "戒指二","裤子","项链","玉佩","鞋")
  final <- data.frame(名称 = names, 属性 = result, stringsAsFactors = FALSE)
  final
}

Damage <- function(data1,data2,weiyang,zidian,wugou,menghu,shuisheng,luoxu,shenqi,ligui,qiangdao,linghou,xinyan){
  mingzhong <- as.numeric(as.character(data1[data1[,1] == "命中",2]))
  huixin <- as.numeric(as.character(data1[data1[,1] == "会心",2]))
  zhongji <- as.numeric(as.character(data1[data1[,1] == "重击",2]))
  wugong1 <- as.numeric(as.character(data1[data1[,1] == "最小物攻",2]))
  wugong2 <- as.numeric(as.character(data1[data1[,1] == "最大物攻",2]))
  fushang <- as.numeric(as.character(data1[data1[,1] == "附伤",2]))
  zhuxin <- ceiling(as.numeric(as.character(data1[data1[,1] == "诛心",2]))/17.1)/100
  if(zhuxin > 0.25){zhuxin = 0.25}
  renhuo <- as.numeric(as.character(data1[data1[,1] == "人祸",2]))/100
  wanjun <- ceiling(as.numeric(as.character(data1[data1[,1] == "万钧",2]))/17.1)/100
  if(wanjun > 0.25){zhuxin = 0.25}
  huibi <- as.numeric(as.character(data2[data2[,1] == "回避",2]))
  shenming <- as.numeric(as.character(data2[data2[,1] == "神明",2]))
  wufang <- as.numeric(as.character(data2[data2[,1] == "物防",2]))*(1 - 0.25*luoxu - 0.2*shuisheng)/6160
  wufang_pg <- as.numeric(as.character(data2[data2[,1] == "物防",2]))*(1 - 0.25*luoxu - 0.3*shuisheng)/6160
  fafang <- as.numeric(as.character(data2[data2[,1] == "法防",2]))/6160
  zhibi <- as.numeric(as.character(data2[data2[,1] == "知彼",2]))/100
  yuxin <- ceiling(as.numeric(as.character(data2[data2[,1] == "御心",2]))/17.1)/100
  if(yuxin > 0.25){yuxin = 0.25}
  tiebi <- ceiling(as.numeric(as.character(data2[data2[,1] == "铁壁",2]))/17.1)/100
  if(tiebi > 0.25){tiebi = 0.25}
  if (wufang > 0.8){wufang = 0.8}
  if (wufang_pg > 0.8){wufang_pg = 0.8}
  if (fafang > 0.8){fafang = 0.8}
  
  jz <- (mingzhong + 2580*xinyan - huibi)/2580 + 0.85 + 0.1*shuisheng + 0.15*ligui
  if (jz < 0){jz = 0} else if (jz > 1){jz = 1}
  hx <- (huixin - shenming)/3080 + 0.1*shenqi + 0.08*linghou
  if (hx < 0){hx = 0} else if (hx > 1){hx = 1}
  yh <- zhongji/1540 + 0.16*shenqi + (0.09 + 50/1540)*ligui +0.06*qiangdao
  if (yh > 1){yh = 1}
  
  ppgdk <- 1 - jz
  ppghx <- jz*hx
  ppgyh <- jz*(1-hx)*yh
  ppghj <- 0
  ppgjz <- 1 - ppgdk - ppghx - ppgyh - ppghj
  
  pjnhx <- hx
  pjnyh <- (1 - hx)*jz*yh
  pjnhj <- 0
  pjnjz <- (1 - hx)*jz*(1-yh)
  pjnhgyh <- (1 - hx)*(1 - jz)*yh
  pjnhg <- (1-hx)*(1 - jz)*(1 - yh)
  pjnhghj <- 0
  
  p <- c(ppgdk,ppgjz,ppgyh,ppghx,ppghj,rep(c(pjnjz,pjnyh,pjnhx,pjnhg,pjnhgyh,pjnhj,pjnhghj),4))
  p <- round(p*100,2)
  p <- paste(p,"%",sep = "")
  
  jizhong1 <- round(wugong1*(1-wufang_pg)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian) + 
                      fushang*(1-fafang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  jizhong2 <- round(wugong2*(1-wufang_pg)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian) + 
                      fushang*(1-fafang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  jizhong <- paste(jizhong1,jizhong2,sep = " ~ ")
  yaohai1 <- round(wugong1*(1-wufang_pg)*(1-zhibi)*(1+wanjun)*(1+0.1*ligui)*(1-tiebi)*(1+renhuo)*2*(1+0.1*zidian) + 
                     fushang*(1-fafang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  yaohai2 <- round(wugong2*(1-wufang_pg)*(1-zhibi)*(1+wanjun)*(1+0.1*ligui)*(1-tiebi)*(1+renhuo)*2*(1+0.1*zidian) + 
                     fushang*(1-fafang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  yaohai <- paste(yaohai1,yaohai2,sep = " ~ ")
  huixin1 <- round(wugong2*(1-wufang_pg)*(1-zhibi)*(1+zhuxin)*(1+0.15*qiangdao)*(1-yuxin)*(1+renhuo)*(1+0.1*zidian)*(1+0.08*wugou)*1.4 + 
                     fushang*(1-fafang)*(1-zhibi)*(1+zhuxin)*(1+0.15*qiangdao)*(1-yuxin)*(1+renhuo)*(1+0.08*wugou)*1.4*(1+0.1*zidian),2)
  huixin2 <- round(wugong2*(1-wufang_pg)*(1-zhibi)*(1+zhuxin)*(1+0.15*qiangdao)*(1-yuxin)*(1+renhuo)*(1+0.1*zidian)*(1+0.08*wugou)*1.6 +
                     fushang*(1-fafang)*(1-zhibi)*(1+zhuxin)*(1+0.15*qiangdao)*(1-yuxin)*(1+renhuo)*(1+0.08*wugou)*1.6*(1+0.1*zidian),2)
  huixin <- paste(huixin1,huixin2,sep = " ~ ")
  duokai <- paste(0,0,sep = " ~ ")
  huajie1 <- round(wugong1*(1-wufang_pg)*(1-zhibi)*(1+renhuo)*0.5*(1+0.1*zidian) + 
                     fushang*(1-fafang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  huajie2 <- round(wugong2*(1-wufang_pg)*(1-zhibi)*(1+renhuo)*0.5*(1+0.1*zidian) + 
                     fushang*(1-fafang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  huajie <- paste(huajie1,huajie2,sep = " ~ ")
  mea <- function(a,b){(a+b)/2}
  epg <- mea(jizhong1,jizhong2)*ppgjz + mea(yaohai1,yaohai2)*ppgyh + mea(huixin1,huixin2)*ppghx + mea(huajie1,huajie2)*ppghj
  
  lfjz1 <- round(((1.1+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*(1+0.3*weiyang)*wugong1 + 414)*(1-wufang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian)
                 + ((1.1+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 552)*(1-fafang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  lfjz2 <- round(((1.1+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong2 + 691)*(1-wufang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian) 
                 + ((1.1+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 552)*(1-fafang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  lfjz <- paste(lfjz1,lfjz2,sep = " ~ ")
  lfyh1 <- round(((1.1+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong1 + 414)*2*(1-wufang)*(1+wanjun)*(1+0.1*ligui)*(1-tiebi)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian)
                 + ((1.1+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 552)*(1-fafang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  lfyh2 <- round(((1.1+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong2 + 691)*2*(1-wufang)*(1+wanjun)*(1+0.1*ligui)*(1-tiebi)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian)
                 + ((1.1+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 552)*(1-fafang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  lfyh <- paste(lfyh1,lfyh2,sep = " ~ ")
  lfhx1 <- round(((1.1+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong2 + 691)*1.4*(1+0.08*wugou)*(1-wufang)*(1+zhuxin)*(1+0.15*qiangdao)*(1-yuxin)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian)
                 + ((1.1+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 552)*1.4*(1+0.08*wugou)*(1-fafang)*(1+zhuxin)*(1+0.15*qiangdao)*(1-yuxin)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  lfhx2 <- round(((1.1+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong2 + 691)*1.6*(1+0.08*wugou)*(1-wufang)*(1+zhuxin)*(1+0.15*qiangdao)*(1-yuxin)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian)
                 + ((1.1+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 552)*1.6*(1+0.08*wugou)*(1-fafang)*(1+zhuxin)*(1+0.15*qiangdao)*(1-yuxin)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  lfhx <- paste(lfhx1,lfhx2,sep = " ~ ")
  lfhg1 <- round(lfjz1*0.4*(1+0.1*zidian),2)
  lfhg2 <- round(lfjz1*0.6*(1+0.1*zidian),2)
  lfhg <- paste(lfhg1,lfhg2,sep = " ~ ")
  lfhgyh1 <- round(lfyh1*0.4*(1+0.1*zidian),2)
  lfhgyh2 <- round(lfyh1*0.6*(1+0.1*zidian),2)
  lfhgyh <- paste(lfhgyh1,lfhgyh2,sep = " ~ ")
  lfhj1 <- round(((1.1+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong1 + 414)*(1-wufang)*(1-zhibi)*(1+renhuo)*0.5*(1+0.1*zidian)
                + ((1.1+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 552)*(1-fafang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  lfhj2 <- round(((1.1+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong2 + 691)*(1-wufang)*(1-zhibi)*(1+renhuo)*0.5*(1+0.1*zidian) 
                + ((1.1+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 552)*(1-fafang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  lfhj <- paste(lfhj1,lfhj2,sep = " ~ ")
  lfhghj1 <- round(lfjz1*0.2*(1+0.1*zidian),2)
  lfhghj2 <- round(lfjz1*0.3*(1+0.1*zidian),2)
  lfhghj <- paste(lfhghj1,lfhghj2,sep = " ~ ")
  
  elf <- mea(lfjz1,lfjz2)*pjnjz + mea(lfyh1,lfyh2)*pjnyh + mea(lfhx1,lfhx2)*pjnhx + mea(lfhg1,lfhg2)*pjnhg + 
    mea(lfhghj1,lfhghj2)*pjnhghj+mea(lfhgyh1,lfhgyh2)*pjnhgyh
  
  gyjz1 <- round((((1.4+menghu*0.15+shenqi*0.1)+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong1 + 626)*(1-wufang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian)
                 + ((1.4+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 835)*(1-fafang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  gyjz2 <- round(((1.4+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong2 + 1044)*(1-wufang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian) 
                 + ((1.4+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 835)*(1-fafang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  gyjz <- paste(gyjz1,gyjz2,sep = " ~ ")
  gyyh1 <- round(((1.4+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong1 + 626)*2*(1-wufang)*(1+wanjun)*(1+0.1*ligui)*(1-tiebi)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian)
                 + ((1.4+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 835)*(1-fafang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  gyyh2 <- round(((1.4+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong2 + 1044)*2*(1-wufang)*(1+wanjun)*(1+0.1*ligui)*(1-tiebi)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian)
                 + ((1.4+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 835)*(1-fafang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  gyyh <- paste(gyyh1,gyyh2,sep = " ~ ")
  gyhx1 <- round(((1.4+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong2 + 1044)*1.4*(1+0.08*wugou)*(1-wufang)*(1+zhuxin)*(1+0.15*qiangdao)*(1-yuxin)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian)
                 + ((1.4+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 835)*1.4*(1+0.08*wugou)*(1-fafang)*(1+zhuxin)*(1+0.15*qiangdao)*(1-yuxin)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  gyhx2 <- round(((1.4+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong2 + 1044)*1.6*(1+0.08*wugou)*(1-wufang)*(1+zhuxin)*(1+0.15*qiangdao)*(1-yuxin)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian)
                 + ((1.4+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 835)*1.6*(1+0.08*wugou)*(1-fafang)*(1+zhuxin)*(1+0.15*qiangdao)*(1-yuxin)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  gyhx <- paste(gyhx1,gyhx2,sep = " ~ ")
  gyhg1 <- round(gyjz1*0.4*(1+0.1*zidian),2)
  gyhg2 <- round(gyjz1*0.6*(1+0.1*zidian),2)
  gyhg <- paste(gyhg1,gyhg2,sep = " ~ ")
  gyhgyh1 <- round(gyyh1*0.4*(1+0.1*zidian),2)
  gyhgyh2 <- round(gyyh1*0.6*(1+0.1*zidian),2)
  gyhgyh <- paste(gyhgyh1,gyhgyh2,sep = " ~ ")
  gyhj1 <- round(((1.4+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong1 + 626)*(1-wufang)*(1-zhibi)*(1+renhuo)*0.5*(1+0.1*zidian)
                 + ((1.4+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 835)*(1-fafang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  gyhj2 <- round(((1.4+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong2 + 1044)*(1-wufang)*(1-zhibi)*(1+renhuo)*0.5 *(1+0.1*zidian)
                 + ((1.4+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 835)*(1-fafang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  gyhj <- paste(gyhj1,gyhj2,sep = " ~ ")
  gyhghj1 <- round(gyjz1*0.2*(1+0.1*zidian),2)
  gyhghj2 <- round(gyjz1*0.3*(1+0.1*zidian),2)
  gyhghj <- paste(gyhghj1,gyhghj2,sep = " ~ ")
  
  egy <- mea(gyjz1,gyjz2)*pjnjz + mea(gyyh1,gyyh2)*pjnyh + mea(gyhx1,gyhx2)*pjnhx + mea(gyhg1,gyhg2)*pjnhg + 
    mea(gyhghj1,gyhghj2)*pjnhghj + mea(gyhgyh1,gyhgyh2)*pjnhgyh
  
  skjz1 <- round(((1.2+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong1 + 0)*(1-wufang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian)
                 + ((1.2+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 700)*(1-fafang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  skjz2 <- round(((1.2+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong2 + 0)*(1-wufang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian) 
                 + ((1.2+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 700)*(1-fafang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  skjz <- paste(skjz1,skjz2,sep = " ~ ")
  skyh1 <- round(((1.2+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong1 + 0)*2*(1-wufang)*(1+wanjun)*(1+0.1*ligui)*(1-tiebi)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian)
                 + ((1.2+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 700)*(1-fafang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  skyh2 <- round(((1.2+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong2 + 0)*2*(1-wufang)*(1+wanjun)*(1+0.1*ligui)*(1-tiebi)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian)
                 + ((1.2+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 700)*(1-fafang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  skyh <- paste(skyh1,skyh2,sep = " ~ ")
  skhx1 <- round(((1.2+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong2 + 0)*1.4*(1+0.08*wugou)*(1-wufang)*(1+zhuxin)*(1+0.15*qiangdao)*(1-yuxin)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian)
                 + ((1.2+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 700)*1.4*(1+0.08*wugou)*(1-fafang)*(1+zhuxin)*(1+0.15*qiangdao)*(1-yuxin)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  skhx2 <- round(((1.2+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong2 + 0)*1.6*(1+0.08*wugou)*(1-wufang)*(1+zhuxin)*(1+0.15*qiangdao)*(1-yuxin)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian)
                 + ((1.2+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 700)*1.6*(1+0.08*wugou)*(1-fafang)*(1+zhuxin)*(1+0.15*qiangdao)*(1-yuxin)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  skhx <- paste(skhx1,skhx2,sep = " ~ ")
  skhg1 <- round(skjz1*0.4*(1+0.1*zidian),2)
  skhg2 <- round(skjz1*0.6*(1+0.1*zidian),2)
  skhg <- paste(skhg1,skhg2,sep = " ~ ")
  skhgyh1 <- round(skyh1*0.4*(1+0.1*zidian),2)
  skhgyh2 <- round(skyh1*0.6*(1+0.1*zidian),2)
  skhgyh <- paste(skhgyh1,skhgyh2,sep = " ~ ")
  skhj1 <- round(((1.2+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong1 + 0)*(1-wufang)*(1-zhibi)*(1+renhuo)*0.5*(1+0.1*zidian)
                 + ((1.2+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 700)*(1-fafang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  skhj2 <- round(((1.2+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong2 + 0)*(1-wufang)*(1-zhibi)*(1+renhuo)*0.5*(1+0.1*zidian) 
                 + ((1.2+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 700)*(1-fafang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  skhj <- paste(skhj1,skhj2,sep = " ~ ")
  skhghj1 <- round(skjz1*0.2*(1+0.1*zidian),2)
  skhghj2 <- round(skjz1*0.3*(1+0.1*zidian),2)
  skhghj <- paste(skhghj1,skhghj2,sep = " ~ ")
  
  esk <- mea(skjz1,skjz2)*pjnjz + mea(skyh1,skyh2)*pjnyh + mea(skhx1,skhx2)*pjnhx + mea(skhg1,skhg2)*pjnhg + 
    mea(skhghj1,skhghj2)*pjnhghj + mea(skhgyh1,skhgyh2)*pjnhgyh
  
  qjjz1 <- round(((0.75+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong1 + 300)*(1-wufang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian)
                 + ((0.75+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 0)*(1-fafang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  qjjz2 <- round(((0.75+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong2 + 300)*(1-wufang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian) 
                 + ((0.75+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 0)*(1-fafang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  qjjz <- paste(qjjz1,qjjz2,sep = " ~ ")
  qjyh1 <- round(((0.75+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong1 + 300)*2*(1-wufang)*(1+wanjun)*(1+0.1*ligui)*(1-tiebi)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian)
                 + ((0.75+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 0)*(1-fafang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  qjyh2 <- round(((0.75+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong2 + 300)*2*(1-wufang)*(1+wanjun)*(1+0.1*ligui)*(1-tiebi)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian)
                 + ((0.75+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 0)*(1-fafang)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  qjyh <- paste(qjyh1,qjyh2,sep = " ~ ")
  qjhx1 <- round(((0.75+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong2 + 300)*1.4*(1+0.08*wugou)*(1-wufang)*(1+zhuxin)*(1+0.15*qiangdao)*(1-yuxin)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian)
                 + ((0.75+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 0)*1.4*(1+0.08*wugou)*(1-fafang)*(1+zhuxin)*(1+0.15*qiangdao)*(1-yuxin)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  qjhx2 <- round(((0.75+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong2 + 300)*1.6*(1+0.08*wugou)*(1-wufang)*(1+zhuxin)*(1+0.15*qiangdao)*(1-yuxin)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian)
                 + ((0.75+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 0)*1.6*(1+0.08*wugou)*(1-fafang)*(1+zhuxin)*(1+0.15*qiangdao)*(1-yuxin)*(1-zhibi)*(1+renhuo)*(1+0.1*zidian),2)
  qjhx <- paste(qjhx1,qjhx2,sep = " ~ ")
  qjhg1 <- round(qjjz1*0.4*(1+0.1*zidian),2)
  qjhg2 <- round(qjjz1*0.6*(1+0.1*zidian),2)
  qjhg <- paste(qjhg1,qjhg2,sep = " ~ ")
  qjhgyh1 <- round(qjyh1*0.4*(1+0.1*zidian),2)
  qjhgyh2 <- round(qjyh1*0.6*(1+0.1*zidian),2)
  qjhgyh <- paste(qjhgyh1,qjhgyh2,sep = " ~ ")
  qjhj1 <- round(((0.75+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong1 + 300)*(1-wufang)*(1-zhibi)*(1+renhuo)*0.5*(1+0.1*zidian)
                 + ((0.75+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 0)*(1-fafang)*(1-zhibi)*(1+renhuo),2)
  qjhj2 <- round(((0.75+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*wugong2 + 300)*(1-wufang)*(1-zhibi)*(1+renhuo)*0.5*(1+0.1*zidian) 
                 + ((0.75+menghu*0.15+shenqi*0.1)*(1+0.3*weiyang)*fushang + 0)*(1-fafang)*(1-zhibi)*(1+renhuo),2)
  qjhj <- paste(qjhj1,qjhj2,sep = " ~ ")
  qjhghj1 <- round(qjjz1*0.2*(1+0.1*zidian),2)
  qjhghj2 <- round(qjjz1*0.3*(1+0.1*zidian),2)
  qjhghj <- paste(qjhghj1,qjhghj2,sep = " ~ ")
  
  eqj <- 4*(mea(qjjz1,qjjz2)*pjnjz + mea(qjyh1,qjyh2)*pjnyh + mea(qjhx1,qjhx2)*pjnhx + mea(qjhg1,qjhg2)*pjnhg + 
              mea(qjhghj1,qjhghj2)*pjnhghj + mea(qjhgyh1,qjhgyh2)*pjnhgyh)
  
  result1 <- data.frame(名称 = c("普攻躲开","普攻击中","普攻要害","普攻会心","普攻化解",
                              "流风击中","流风要害","流风会心","流风滑过","流风滑过要害","流风化解","流风滑过化解",
                              "归元击中","归元要害","归元会心","归元滑过","归元滑过要害","归元化解","归元滑过化解",
                              "疏狂把酒击中","疏狂把酒要害","疏狂把酒会心","疏狂把酒滑过","疏狂把酒滑过要害","疏狂把酒化解","疏狂把酒滑过化解",
                              "单次七剑天山击中","单次七剑天山要害","单次七剑天山会心","单次七剑天山滑过","单次七剑天山滑过要害","单次七剑天山化解","单次七剑天山滑过化解"),
                         伤害或吟唱时间 = c(duokai,jizhong,yaohai,huixin,huajie,
                                     lfjz,lfyh,lfhx,lfhg,lfhgyh,lfhj,lfhghj,
                                     gyjz,gyyh,gyhx,gyhg,gyhgyh,gyhj,gyhghj,
                                     skjz,skyh,skhx,skhg,skhgyh,skhj,skhghj,
                                     qjjz,qjyh,qjhx,qjhg,qjhgyh,qjhj,qjhghj),
                         概率 = p, stringsAsFactors = FALSE)
  result2 <- data.frame(名称 = c("普攻","流风","归元","疏狂把酒","七剑天山四次"),
                          期望伤害 = round(c(epg,elf,egy,esk,eqj),2),stringsAsFactors = FALSE)
  r <- list("r1" = result1,"r2" = result2)
  return(r)
}
# source("YJ1.R")
# source("Damage.R")
shinyServer(function(input, output) {
  
  bang <- reactive({
    yjbang <- informationofYJrole(input$url)
    validate(
      need(yjbang[2,2] == "79" & yjbang[3,2] == "弈剑听雨阁",
      message  = "您要查询的玩家并非79级弈剑听雨阁门人")
    )
    fenggang <- 0
    bingjie <- 0
    xinyan <- 0
    weiyang <- 0
    if (input$buff3 == "有"){weiyang <- 1}
    if (input$buff4 == "有"){bingjie <- 1}
    if (input$buff6 == "有"){fenggang <- 1}
    if (input$buff11 == "有"){xinyan <- 1}
    validate(need(bingjie*fenggang == 0, "兵解和封缸酒不能共存"))
    validate(need(xinyan*weiyang == 0, "心眼和威扬不能共存"))
    
    if (input$buff9 == "猛虎"){
      yjbang[yjbang[,1] == "最小物攻",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "最小物攻",2]))*1.1
      yjbang[yjbang[,1] == "最大物攻",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "最大物攻",2]))*1.1
      yjbang[yjbang[,1] == "命中",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "命中",2]))*1.08
      yjbang[yjbang[,1] == "重击",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "重击",2]))*1.1
    }
    if (input$buff9 == "水生"){
      yjbang[yjbang[,1] == "命中",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "命中",2]))*1.1
      yjbang[yjbang[,1] == "回避",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "回避",2]))*1.1
    }
    if (input$buff9 == "蜃气"){
      yjbang[yjbang[,1] == "命中",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "命中",2]))*1.15
      yjbang[yjbang[,1] == "疾语",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "疾语",2])) + 5
      yjbang[yjbang[,1] == "生命值",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "生命值",2]))*1.07
    }
    if (input$buff9 == "仙狐"){
      yjbang[yjbang[,1] == "疾语",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "疾语",2])) + 10
      yjbang[yjbang[,1] == "追电",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "追电",2]))*1.05
      yjbang[yjbang[,1] == "生命值",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "生命值",2]))*0.85
    }
    if (input$buff9 == "厉鬼"){
      yjbang[yjbang[,1] == "追电",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "追电",2]))*1.08
      yjbang[yjbang[,1] == "回避",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "回避",2]))*1.1
    }
    if (input$buff9 == "强盗"){
      yjbang[yjbang[,1] == "命中",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "命中",2]))*1.15 + 150
      yjbang[yjbang[,1] == "会心",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "会心",2]))*1.05
      yjbang[yjbang[,1] == "回避",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "回避",2]))*1.05
      yjbang[yjbang[,1] == "最小物攻",2]<- as.numeric(as.character(yjbang[yjbang[,1] == "最小物攻",2]))*1.1
      if (as.numeric(as.character(yjbang[yjbang[,1] == "最小物攻",2])) > 
          as.numeric(as.character(yjbang[yjbang[,1] == "最大物攻",2]))){
        yjbang[yjbang[,1] == "最大物攻",2] <- 
          as.numeric(as.character(yjbang[yjbang[,1] == "最小物攻",2]))
      }
    }
    if (input$buff9 == "灵猴"){
      yjbang[yjbang[,1] == "命中",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "命中",2]))*1.05
      yjbang[yjbang[,1] == "附伤",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "附伤",2]))*1.11 + 270
      yjbang[yjbang[,1] == "追电",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "追电",2]))*1.05
    }
    yjbang0 <- yjbang
    if (input$buff7 == "有"){
      yjbang0[yjbang0[,1] == "附伤",2]<-as.numeric(as.character(yjbang0[yjbang0[,1] == "附伤",2])) + 414
    }
    if (input$buff1 == "有但未开启落絮随风" | input$buff1 == "有且开启落絮随风"){
      yjbang0[yjbang0[,1] == "最小物攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最小物攻",2])) +
                                             as.numeric(as.character(yjbang[yjbang[,1] == "最小物攻",2]))*0.32
      yjbang0[yjbang0[,1] == "最大物攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最大物攻",2])) + 
                                             as.numeric(as.character(yjbang[yjbang[,1] == "最大物攻",2]))*0.32
      yjbang0[yjbang0[,1] == "重击",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "重击",2])) + 864
    }
    if (input$buff4 == "有"){
      yjbang0[yjbang0[,1] == "最小法攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最小法攻",2])) + 377
      yjbang0[yjbang0[,1] == "最大法攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最大法攻",2])) + 629
    }
    if (input$buff2 == "85% ~ 100%血"){
      yjbang0[yjbang0[,1] == "最小物攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最小物攻",2])) +
        as.numeric(as.character(yjbang[yjbang[,1] == "最小物攻",2]))*0.4 + 
        as.numeric(as.character(yjbang[yjbang[,1] == "最小法攻",2]))*0.1
      yjbang0[yjbang0[,1] == "最大物攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最大物攻",2])) + 
        as.numeric(as.character(yjbang[yjbang[,1] == "最大物攻",2]))*0.4 +
        as.numeric(as.character(yjbang[yjbang[,1] == "最大法攻",2]))*0.1
      yjbang0[yjbang0[,1] == "会心",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "会心",2])) + 
        as.numeric(as.character(yjbang[yjbang[,1] == "会心",2]))*0.1
      yjbang0[yjbang0[,1] == "重击",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "重击",2])) + 140
    } else if (input$buff2 == "60% ~ 85%血"){
      yjbang0[yjbang0[,1] == "最小物攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最小物攻",2])) +
        as.numeric(as.character(yjbang[yjbang[,1] == "最小物攻",2]))*0.6 + 
        as.numeric(as.character(yjbang[yjbang[,1] == "最小法攻",2]))*0.11
      yjbang0[yjbang0[,1] == "最大物攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最大物攻",2])) + 
        as.numeric(as.character(yjbang[yjbang[,1] == "最大物攻",2]))*0.6 +
        as.numeric(as.character(yjbang[yjbang[,1] == "最大法攻",2]))*0.11
      yjbang0[yjbang0[,1] == "会心",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "会心",2])) + 
        as.numeric(as.character(yjbang[yjbang[,1] == "会心",2]))*0.15
      yjbang0[yjbang0[,1] == "重击",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "重击",2])) + 200
    } else if (input$buff2 == "35% ~ 60%血"){
      yjbang0[yjbang0[,1] == "最小物攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最小物攻",2])) +
        as.numeric(as.character(yjbang[yjbang[,1] == "最小物攻",2]))*0.8 + 
        as.numeric(as.character(yjbang[yjbang[,1] == "最小法攻",2]))*0.13
      yjbang0[yjbang0[,1] == "最大物攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最大物攻",2])) + 
        as.numeric(as.character(yjbang[yjbang[,1] == "最大物攻",2]))*0.8 +
        as.numeric(as.character(yjbang[yjbang[,1] == "最大法攻",2]))*0.13
      yjbang0[yjbang0[,1] == "会心",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "会心",2])) + 
        as.numeric(as.character(yjbang[yjbang[,1] == "会心",2]))*0.2
      yjbang0[yjbang0[,1] == "重击",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "重击",2])) + 260
    } else if (input$buff2 == "35%血以下"){
      yjbang0[yjbang0[,1] == "最小物攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最小物攻",2])) +
        as.numeric(as.character(yjbang[yjbang[,1] == "最小物攻",2]))*1 + 
        as.numeric(as.character(yjbang[yjbang[,1] == "最小法攻",2]))*0.13
      yjbang0[yjbang0[,1] == "最大物攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最大物攻",2])) + 
        as.numeric(as.character(yjbang[yjbang[,1] == "最大物攻",2]))*1 +
        as.numeric(as.character(yjbang[yjbang[,1] == "最大法攻",2]))*0.15
      yjbang0[yjbang0[,1] == "会心",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "会心",2])) + 
        as.numeric(as.character(yjbang[yjbang[,1] == "会心",2]))*0.25
      yjbang0[yjbang0[,1] == "重击",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "重击",2])) + 320
    }
    if (input$buff6 == "有"){
      x<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最小物攻",2])) +
        as.numeric(as.character(yjbang0[yjbang0[,1] == "最小法攻",2]))
      y<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最大物攻",2])) +
        as.numeric(as.character(yjbang0[yjbang0[,1] == "最大法攻",2]))
      yjbang0[yjbang0[,1] == "最小物攻",2] <- x
      yjbang0[yjbang0[,1] == "最小法攻",2] <- x
      yjbang0[yjbang0[,1] == "最大物攻",2] <- y
      yjbang0[yjbang0[,1] == "最大法攻",2] <- y
    }
    yjbang0
  })
  bang2 <- reactive({
    bxbang <- informationofYJrole(input$url2)
    validate(
      need(bxbang[2,2] == "79",
           message  = "您要查询的对手并非79级")
    )
    if (input$buff10 == "有"){
      bxbang[bxbang[,1] == "回避",2]<-as.numeric(as.character(bxbang[bxbang[,1] == "回避",2]))*0.25
    }
    
    bxbang
  })
  damage <- reactive({
    yjbang <- informationofYJrole(input$url)
    validate(
      need(yjbang[2,2] == "79" & yjbang[3,2] == "弈剑听雨阁",
           message  = "您要查询的玩家并非79级弈剑听雨阁门人")
    )
    bxbang <- informationofYJrole(input$url2)
    validate(
      need(bxbang[2,2] == "79",
           message  = "您要查询的对手并非79级")
    )
    fenggang <- 0
    bingjie <- 0
    xinyan <- 0
    weiyang <- 0
    if (input$buff3 == "有"){weiyang <- 1}
    if (input$buff4 == "有"){bingjie <- 1}
    if (input$buff6 == "有"){fenggang <- 1}
    if (input$buff11 == "有"){xinyan <- 1}
    validate(need(bingjie*fenggang == 0, "兵解和封缸酒不能共存"))
    validate(need(xinyan*weiyang == 0, "心眼和威扬不能共存"))
    if (input$buff9 == "猛虎"){
      yjbang[yjbang[,1] == "最小物攻",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "最小物攻",2]))*1.1
      yjbang[yjbang[,1] == "最大物攻",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "最大物攻",2]))*1.1
      yjbang[yjbang[,1] == "命中",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "命中",2]))*1.08
      yjbang[yjbang[,1] == "重击",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "重击",2]))*1.1
    }
    if (input$buff9 == "水生"){
      yjbang[yjbang[,1] == "命中",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "命中",2]))*1.1
      yjbang[yjbang[,1] == "回避",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "回避",2]))*1.1
    }
    if (input$buff9 == "蜃气"){
      yjbang[yjbang[,1] == "命中",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "命中",2]))*1.15
      yjbang[yjbang[,1] == "疾语",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "疾语",2])) + 5
      yjbang[yjbang[,1] == "生命值",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "生命值",2]))*1.07
    }
    if (input$buff9 == "仙狐"){
      yjbang[yjbang[,1] == "人祸",2]<-(as.numeric(as.character(yjbang[yjbang[,1] == "人祸",2])) + 100)*1.2 - 100
      yjbang[yjbang[,1] == "疾语",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "疾语",2])) + 10
      yjbang[yjbang[,1] == "追电",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "追电",2]))*1.05
      yjbang[yjbang[,1] == "生命值",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "生命值",2]))*0.85
    }
    if (input$buff9 == "厉鬼"){
      yjbang[yjbang[,1] == "追电",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "追电",2]))*1.08
      yjbang[yjbang[,1] == "回避",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "回避",2]))*1.1
    }
    if (input$buff9 == "强盗"){
      yjbang[yjbang[,1] == "命中",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "命中",2]))*1.15 + 150
      yjbang[yjbang[,1] == "会心",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "会心",2]))*1.05
      yjbang[yjbang[,1] == "回避",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "回避",2]))*1.05
      yjbang[yjbang[,1] == "最小物攻",2]<- as.numeric(as.character(yjbang[yjbang[,1] == "最小物攻",2]))*1.1
      if (as.numeric(as.character(yjbang[yjbang[,1] == "最小物攻",2])) > 
          as.numeric(as.character(yjbang[yjbang[,1] == "最大物攻",2]))){
        yjbang[yjbang[,1] == "最大物攻",2] <- 
          as.numeric(as.character(yjbang[yjbang[,1] == "最小物攻",2]))
      }
    }
    if (input$buff9 == "灵猴"){
      yjbang[yjbang[,1] == "命中",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "命中",2]))*1.05
      yjbang[yjbang[,1] == "附伤",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "附伤",2]))*1.11 + 270
      yjbang[yjbang[,1] == "追电",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "追电",2]))*1.05
    }
    yjbang0 <- yjbang
    if (input$buff7 == "有"){
      yjbang0[yjbang0[,1] == "附伤",2]<-as.numeric(as.character(yjbang0[yjbang0[,1] == "附伤",2])) + 414
    }
    if (input$buff1 == "有但未开启落絮随风" | input$buff1 == "有且开启落絮随风"){
      yjbang0[yjbang0[,1] == "最小物攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最小物攻",2])) +
        as.numeric(as.character(yjbang[yjbang[,1] == "最小物攻",2]))*0.32
      yjbang0[yjbang0[,1] == "最大物攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最大物攻",2])) + 
        as.numeric(as.character(yjbang[yjbang[,1] == "最大物攻",2]))*0.32
      yjbang0[yjbang0[,1] == "重击",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "重击",2])) + 864
    }
    if (input$buff4 == "有"){
      yjbang0[yjbang0[,1] == "最小法攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最小法攻",2])) + 377
      yjbang0[yjbang0[,1] == "最大法攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最大法攻",2])) + 629
    }
    if (input$buff2 == "85% ~ 100%血"){
      yjbang0[yjbang0[,1] == "最小物攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最小物攻",2])) +
        as.numeric(as.character(yjbang[yjbang[,1] == "最小物攻",2]))*0.4 + 
        as.numeric(as.character(yjbang[yjbang[,1] == "最小法攻",2]))*0.1
      yjbang0[yjbang0[,1] == "最大物攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最大物攻",2])) + 
        as.numeric(as.character(yjbang[yjbang[,1] == "最大物攻",2]))*0.4 +
        as.numeric(as.character(yjbang[yjbang[,1] == "最大法攻",2]))*0.1
      yjbang0[yjbang0[,1] == "会心",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "会心",2])) + 
        as.numeric(as.character(yjbang[yjbang[,1] == "会心",2]))*0.1
      yjbang0[yjbang0[,1] == "重击",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "重击",2])) + 140
    } else if (input$buff2 == "60% ~ 85%血"){
      yjbang0[yjbang0[,1] == "最小物攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最小物攻",2])) +
        as.numeric(as.character(yjbang[yjbang[,1] == "最小物攻",2]))*0.6 + 
        as.numeric(as.character(yjbang[yjbang[,1] == "最小法攻",2]))*0.11
      yjbang0[yjbang0[,1] == "最大物攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最大物攻",2])) + 
        as.numeric(as.character(yjbang[yjbang[,1] == "最大物攻",2]))*0.6 +
        as.numeric(as.character(yjbang[yjbang[,1] == "最大法攻",2]))*0.11
      yjbang0[yjbang0[,1] == "会心",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "会心",2])) + 
        as.numeric(as.character(yjbang[yjbang[,1] == "会心",2]))*0.15
      yjbang0[yjbang0[,1] == "重击",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "重击",2])) + 200
    } else if (input$buff2 == "35% ~ 60%血"){
      yjbang0[yjbang0[,1] == "最小物攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最小物攻",2])) +
        as.numeric(as.character(yjbang[yjbang[,1] == "最小物攻",2]))*0.8 + 
        as.numeric(as.character(yjbang[yjbang[,1] == "最小法攻",2]))*0.13
      yjbang0[yjbang0[,1] == "最大物攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最大物攻",2])) + 
        as.numeric(as.character(yjbang[yjbang[,1] == "最大物攻",2]))*0.8 +
        as.numeric(as.character(yjbang[yjbang[,1] == "最大法攻",2]))*0.13
      yjbang0[yjbang0[,1] == "会心",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "会心",2])) + 
        as.numeric(as.character(yjbang[yjbang[,1] == "会心",2]))*0.2
      yjbang0[yjbang0[,1] == "重击",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "重击",2])) + 260
    } else if (input$buff2 == "35%血以下"){
      yjbang0[yjbang0[,1] == "最小物攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最小物攻",2])) +
        as.numeric(as.character(yjbang[yjbang[,1] == "最小物攻",2]))*1 + 
        as.numeric(as.character(yjbang[yjbang[,1] == "最小法攻",2]))*0.13
      yjbang0[yjbang0[,1] == "最大物攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最大物攻",2])) + 
        as.numeric(as.character(yjbang[yjbang[,1] == "最大物攻",2]))*1 +
        as.numeric(as.character(yjbang[yjbang[,1] == "最大法攻",2]))*0.15
      yjbang0[yjbang0[,1] == "会心",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "会心",2])) + 
        as.numeric(as.character(yjbang[yjbang[,1] == "会心",2]))*0.25
      yjbang0[yjbang0[,1] == "重击",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "重击",2])) + 320
    }
    if (input$buff6 == "有"){
      x<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最小物攻",2])) +
        as.numeric(as.character(yjbang0[yjbang0[,1] == "最小法攻",2]))
      y<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最大物攻",2])) +
        as.numeric(as.character(yjbang0[yjbang0[,1] == "最大法攻",2]))
      yjbang0[yjbang0[,1] == "最小物攻",2] <- x
      yjbang0[yjbang0[,1] == "最小法攻",2] <- x
      yjbang0[yjbang0[,1] == "最大物攻",2] <- y
      yjbang0[yjbang0[,1] == "最大法攻",2] <- y
    }
    
    weiyang <- 0
    zidian <- 0
    wugou <- 0
    menghu <- 0
    shuisheng <- 0
    luoxu <- 0
    shenqi <- 0
    ligui <- 0
    qiangdao <- 0
    linghou <- 0
    bingjie <- 0
    xinyan <- 0
    if (input$buff10 == "有"){
      bxbang[bxbang[,1] == "回避",2]<-as.numeric(as.character(bxbang[bxbang[,1] == "回避",2]))*0.25
      zidian <- 1
    }
    if (input$buff3 == "有"){
      weiyang <- 1
    }
    if (input$buff8 == "有"){
      wugou <- 1
    }
    if (input$buff9 == "猛虎"){
      menghu <- 1
    }
    if (input$buff9 == "水生"){
      shuisheng <- 1
    }
    if (input$buff9 == "蜃气"){
      shenqi <- 1
    }
    if (input$buff1 == "有且开启落絮随风"){
      luoxu <- 1
    }
    if (input$buff9 == "厉鬼"){
      bxbang[bxbang[,1] == "回避",2]<-as.numeric(as.character(bxbang[bxbang[,1] == "回避",2]))*0.85
      ligui <- 1
    }
    if (input$buff9 == "强盗"){
      qiangdao <- 1
    }
    if (input$buff9 == "灵猴"){
      linghou <- 1
    }
    if (input$buff11 == "有"){
      xinyan <- 1
    }
    Damage(yjbang0,bxbang,weiyang,zidian,wugou,menghu,shuisheng,luoxu,shenqi,ligui,qiangdao,linghou,xinyan)$r1
  })
    damage_exp <- reactive({
      yjbang <- informationofYJrole(input$url)
      validate(
        need(yjbang[2,2] == "79" & yjbang[3,2] == "弈剑听雨阁",
             message  = "您要查询的玩家并非79级弈剑听雨阁门人")
      )
      bxbang <- informationofYJrole(input$url2)
      validate(
        need(bxbang[2,2] == "79",
             message  = "您要查询的对手并非79级")
      )
      fenggang <- 0
      bingjie <- 0
      xinyan <- 0
      weiyang <- 0
      if (input$buff3 == "有"){weiyang <- 1}
      if (input$buff4 == "有"){bingjie <- 1}
      if (input$buff6 == "有"){fenggang <- 1}
      if (input$buff11 == "有"){xinyan <- 1}
      validate(need(bingjie*fenggang == 0, "兵解和封缸酒不能共存"))
      validate(need(xinyan*weiyang == 0, "心眼和威扬不能共存"))
      
      if (input$buff9 == "猛虎"){
        yjbang[yjbang[,1] == "最小物攻",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "最小物攻",2]))*1.1
        yjbang[yjbang[,1] == "最大物攻",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "最大物攻",2]))*1.1
        yjbang[yjbang[,1] == "命中",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "命中",2]))*1.08
        yjbang[yjbang[,1] == "重击",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "重击",2]))*1.1
      }
      if (input$buff9 == "水生"){
        yjbang[yjbang[,1] == "命中",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "命中",2]))*1.1
        yjbang[yjbang[,1] == "回避",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "回避",2]))*1.1
      }
      if (input$buff9 == "蜃气"){
        yjbang[yjbang[,1] == "命中",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "命中",2]))*1.15
        yjbang[yjbang[,1] == "疾语",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "疾语",2])) + 5
        yjbang[yjbang[,1] == "生命值",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "生命值",2]))*1.07
      }
      if (input$buff9 == "仙狐"){
        yjbang[yjbang[,1] == "人祸",2]<-(as.numeric(as.character(yjbang[yjbang[,1] == "人祸",2])) + 100)*1.2 - 100
        yjbang[yjbang[,1] == "疾语",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "疾语",2])) + 10
        yjbang[yjbang[,1] == "追电",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "追电",2]))*1.05
        yjbang[yjbang[,1] == "生命值",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "生命值",2]))*0.85
      }
      if (input$buff9 == "厉鬼"){
        yjbang[yjbang[,1] == "追电",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "追电",2]))*1.08
        yjbang[yjbang[,1] == "回避",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "回避",2]))*1.1
      }
      if (input$buff9 == "强盗"){
        yjbang[yjbang[,1] == "命中",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "命中",2]))*1.15 + 150
        yjbang[yjbang[,1] == "会心",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "会心",2]))*1.05
        yjbang[yjbang[,1] == "回避",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "回避",2]))*1.05
        yjbang[yjbang[,1] == "最小物攻",2]<- as.numeric(as.character(yjbang[yjbang[,1] == "最小物攻",2]))*1.1
        if (as.numeric(as.character(yjbang[yjbang[,1] == "最小物攻",2])) > 
            as.numeric(as.character(yjbang[yjbang[,1] == "最大物攻",2]))){
          yjbang[yjbang[,1] == "最大物攻",2] <- 
            as.numeric(as.character(yjbang[yjbang[,1] == "最小物攻",2]))
        }
      }
      if (input$buff9 == "灵猴"){
        yjbang[yjbang[,1] == "命中",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "命中",2]))*1.05
        yjbang[yjbang[,1] == "附伤",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "附伤",2]))*1.11 + 270
        yjbang[yjbang[,1] == "追电",2]<-as.numeric(as.character(yjbang[yjbang[,1] == "追电",2]))*1.05
      }
      yjbang0 <- yjbang
      if (input$buff7 == "有"){
        yjbang0[yjbang0[,1] == "附伤",2]<-as.numeric(as.character(yjbang0[yjbang0[,1] == "附伤",2])) + 414
      }
      if (input$buff1 == "有但未开启落絮随风" | input$buff1 == "有且开启落絮随风"){
        yjbang0[yjbang0[,1] == "最小物攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最小物攻",2])) +
          as.numeric(as.character(yjbang[yjbang[,1] == "最小物攻",2]))*0.32
        yjbang0[yjbang0[,1] == "最大物攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最大物攻",2])) + 
          as.numeric(as.character(yjbang[yjbang[,1] == "最大物攻",2]))*0.32
        yjbang0[yjbang0[,1] == "重击",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "重击",2])) + 864
      }
      if (input$buff4 == "有"){
        yjbang0[yjbang0[,1] == "最小法攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最小法攻",2])) + 377
        yjbang0[yjbang0[,1] == "最大法攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最大法攻",2])) + 629
      }
      if (input$buff2 == "85% ~ 100%血"){
        yjbang0[yjbang0[,1] == "最小物攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最小物攻",2])) +
          as.numeric(as.character(yjbang[yjbang[,1] == "最小物攻",2]))*0.4 + 
          as.numeric(as.character(yjbang[yjbang[,1] == "最小法攻",2]))*0.1
        yjbang0[yjbang0[,1] == "最大物攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最大物攻",2])) + 
          as.numeric(as.character(yjbang[yjbang[,1] == "最大物攻",2]))*0.4 +
          as.numeric(as.character(yjbang[yjbang[,1] == "最大法攻",2]))*0.1
        yjbang0[yjbang0[,1] == "会心",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "会心",2])) + 
          as.numeric(as.character(yjbang[yjbang[,1] == "会心",2]))*0.1
        yjbang0[yjbang0[,1] == "重击",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "重击",2])) + 140
      } else if (input$buff2 == "60% ~ 85%血"){
        yjbang0[yjbang0[,1] == "最小物攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最小物攻",2])) +
          as.numeric(as.character(yjbang[yjbang[,1] == "最小物攻",2]))*0.6 + 
          as.numeric(as.character(yjbang[yjbang[,1] == "最小法攻",2]))*0.11
        yjbang0[yjbang0[,1] == "最大物攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最大物攻",2])) + 
          as.numeric(as.character(yjbang[yjbang[,1] == "最大物攻",2]))*0.6 +
          as.numeric(as.character(yjbang[yjbang[,1] == "最大法攻",2]))*0.11
        yjbang0[yjbang0[,1] == "会心",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "会心",2])) + 
          as.numeric(as.character(yjbang[yjbang[,1] == "会心",2]))*0.15
        yjbang0[yjbang0[,1] == "重击",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "重击",2])) + 200
      } else if (input$buff2 == "35% ~ 60%血"){
        yjbang0[yjbang0[,1] == "最小物攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最小物攻",2])) +
          as.numeric(as.character(yjbang[yjbang[,1] == "最小物攻",2]))*0.8 + 
          as.numeric(as.character(yjbang[yjbang[,1] == "最小法攻",2]))*0.13
        yjbang0[yjbang0[,1] == "最大物攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最大物攻",2])) + 
          as.numeric(as.character(yjbang[yjbang[,1] == "最大物攻",2]))*0.8 +
          as.numeric(as.character(yjbang[yjbang[,1] == "最大法攻",2]))*0.13
        yjbang0[yjbang0[,1] == "会心",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "会心",2])) + 
          as.numeric(as.character(yjbang[yjbang[,1] == "会心",2]))*0.2
        yjbang0[yjbang0[,1] == "重击",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "重击",2])) + 260
      } else if (input$buff2 == "35%血以下"){
        yjbang0[yjbang0[,1] == "最小物攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最小物攻",2])) +
          as.numeric(as.character(yjbang[yjbang[,1] == "最小物攻",2]))*1 + 
          as.numeric(as.character(yjbang[yjbang[,1] == "最小法攻",2]))*0.13
        yjbang0[yjbang0[,1] == "最大物攻",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最大物攻",2])) + 
          as.numeric(as.character(yjbang[yjbang[,1] == "最大物攻",2]))*1 +
          as.numeric(as.character(yjbang[yjbang[,1] == "最大法攻",2]))*0.15
        yjbang0[yjbang0[,1] == "会心",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "会心",2])) + 
          as.numeric(as.character(yjbang[yjbang[,1] == "会心",2]))*0.25
        yjbang0[yjbang0[,1] == "重击",2]<- as.numeric(as.character(yjbang0[yjbang0[,1] == "重击",2])) + 320
      }
      if (input$buff6 == "有"){
        x<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最小物攻",2])) +
          as.numeric(as.character(yjbang0[yjbang0[,1] == "最小法攻",2]))
        y<- as.numeric(as.character(yjbang0[yjbang0[,1] == "最大物攻",2])) +
          as.numeric(as.character(yjbang0[yjbang0[,1] == "最大法攻",2]))
        yjbang0[yjbang0[,1] == "最小物攻",2] <- x
        yjbang0[yjbang0[,1] == "最小法攻",2] <- x
        yjbang0[yjbang0[,1] == "最大物攻",2] <- y
        yjbang0[yjbang0[,1] == "最大法攻",2] <- y
      }
      weiyang <- 0
      zidian <- 0
      wugou <- 0
      menghu <- 0
      shuisheng <- 0
      luoxu <- 0
      shenqi <- 0
      ligui <- 0
      qiangdao <- 0
      xinyan <- 0
      linghou <- 0
      if (input$buff10 == "有"){
        bxbang[bxbang[,1] == "回避",2]<-as.numeric(as.character(bxbang[bxbang[,1] == "回避",2]))*0.25
        zidian <- 1
      }
      if (input$buff3 == "有"){
        weiyang <- 1
      }
      if (input$buff8 == "有"){
        wugou <- 1
      }
      if (input$buff9 == "猛虎"){
        menghu <- 1
      }
      if (input$buff9 == "水生"){
        shuisheng <- 1
      }
      if (input$buff9 == "蜃气"){
        shenqi <- 1
      }
      if (input$buff1 == "有且开启落絮随风"){
        luoxu <- 1
      }
      if (input$buff9 == "厉鬼"){
        bxbang[bxbang[,1] == "回避",2]<-as.numeric(as.character(bxbang[bxbang[,1] == "回避",2]))*0.85
        ligui <- 1
      }
      if (input$buff9 == "强盗"){
        qiangdao <- 1
      }
      if (input$buff9 == "灵猴"){
        linghou <- 1
      }
      if (input$buff11 == "有"){
        xinyan <- 1
      }
      Damage(yjbang0,bxbang,weiyang,zidian,wugou,menghu,shuisheng,luoxu,shenqi,ligui,qiangdao,linghou,xinyan)$r2
    })
  
  output$mytable <- renderDataTable({
    bang()
  },options = list(aLengthMenu = c(5,10,25,50),iDisplayLength = 50))
  output$mytable2 <- renderDataTable({
    bang2()
  },options = list(aLengthMenu = c(5,10,25,50),iDisplayLength = 50))
  output$mytable3 <- renderDataTable({
    damage()
  },options = list(aLengthMenu = c(5,10,25,50),iDisplayLength = 50))
  output$mytable4 <- renderDataTable({
    damage_exp()
  },options = list(aLengthMenu = c(5,10,25,50),iDisplayLength = 50))
})