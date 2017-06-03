library(shiny)
library(XML)
data <- read.table("BX_79data.txt",header = TRUE,stringsAsFactors = FALSE)
data <- data[,-1]
dataname <- c("英雄榜","昵称","大区","服务器","等级","门派","势力","装评","力","魂","体","敏","疾","念","最小物攻","最大物攻","最小法攻",
              "最大法攻","命中","会心","附伤","重击","诛心","御心","万钧","铁壁","人祸","疾语",
              "追电","物防","法防","生命值","技力值","神明","回避","知彼","耳环一","头冠","耳环二",
              "肩膀","手镯一","翅膀","衣服","手镯二","护腕","腰带","武器","戒指一","下摆","副手",
              "戒指二","裤子","项链","玉佩","鞋")

shinyServer(function(input, output) {
  paixu <- reactive({
    n <- which(dataname == input$sort)
    result <- data[order(-data[,n])[1:50],c(1:4,n)]
    names(result) <- dataname[c(1:4,n)]
    result
  }
)
  distributionplot <- reactive({
    if (input$distribution == "名字用字"){
      z <- unlist(strsplit(data[,2],split = ""))
      z <- z[which(z != " ")]
      x <- sort(table(z),decreasing = TRUE)[1:40]
      ylim <- c(0, 1.1*max(x))
      par(family='STKaiti') 
      xx <- barplot(x,xaxt = 'n', xlab = '', width = 0.85,ylim = ylim,main = "名字用字分布",ylab = "人数")
      text(x = xx, y = x, label = x, pos = 3, cex = 0.8, col = "red")
      axis(1, at=xx, labels=names(x), tick=FALSE, las=2, line=-0.5, cex.axis=0.8)
    } else {
      z <- data[,which(dataname == input$distribution)]
      x <- sort(table(z),decreasing = TRUE)
      if (length(x) > 40){
        x <- x[1:40]
      }
      ylim <- c(0, 1.1*max(x))
      par(family='STKaiti') 
      xx <- barplot(x,xaxt = 'n', xlab = '', width = 0.85,ylim = ylim,main = paste(input$distribution,"分布",sep = ""),ylab = "人数")
      text(x = xx, y = x, label = x, pos = 3, cex = 0.8, col = "red")
      axis(1, at=xx, labels=names(x), tick=FALSE, las=2, line=-0.5, cex.axis=0.8)
    }
  })
  similarity <- reactive({
    validate(
      need(unlist(strsplit(input$similarity,split = "http://bang.tx3.163.com/bang/role/"))[1] == "" &
             input$similarity != "http://bang.tx3.163.com/bang/role/",
           message  = "该玩家不存在或您输入的英雄榜不正确")
    )
    pagetree<-htmlTreeParse(input$similarity, error=function(...){}, useInternalNodes = TRUE)
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
    final <- data.frame(t(result), stringsAsFactors = FALSE)
    names(final) <- names
    final_data <- as.numeric(final[,6:33])
    sim <- c()
    for (i in 1:dim(data)[1]){
      sim[i] <- cor(as.numeric(data[i,9:36]),final_data)
    }
    small <- order(sim)[1:10]
    large <- order(-sim)[1:10]
    zz <- c(large,small)
    r <- data.frame(data[zz,1:4],相似度 = c(rep("最相似",10),rep("最不相似",10)))
    names(r)[1:4] <- dataname[1:4]
    r
  })
  
  output$mytable1 <- renderTable(
    paixu()
  )
  output$myplot1 <- renderPlot(
    distributionplot()
  )
  output$mytable2 <- renderTable(
    similarity()
  )
})
