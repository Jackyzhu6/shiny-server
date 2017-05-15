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
final <- data.frame(名称 = names, 属性 = result)
final
}

# informationofYJrole("http://bang.tx3.163.com/bang/role/37_10817379")
# informationofYJrole("http://bang.tx3.163.com/bang/role/47_4243247")
# 
# url <- "http://bang.tx3.163.com/bang/role/37_10817379"

# 
# ZP<-c()
# for (i in 1:62){
# data<-tx3information("装备","弈剑听雨阁",TXservername[i])
# zhuangping<-data[2:501,9]
# ZP[i]<-mean(as.numeric(zhuangping))
# }
# 
# YJservername<-TXservername[order(-ZP)]
# 
# c<-paste("&server=",YJservername,sep="")
# for (j in 52:62){
# serverurl<-paste("http://bang.tx3.163.com/bang/ranks?school=8","&role_id=&order_key=equ_xiuwei",c[j],"&page=",1:25,"&count=20",sep="")
# Pagetree<-list()
# for (i in 1:10){
# Pagetree[[i]]<-htmlTreeParse(iconv(serverurl[i],"gbk","utf-8"), error=function(...){}, useInternalNodes = TRUE)
# }
# Bang<-list()
# for (i in 1:5){
# hello<-data.frame(xpathSApply(Pagetree[[i]],"//td//@href"))
# colnames(hello)=c("bang")
# Bang[[i]]<-as.character(hello$bang)
# }
# BAng<-c()
# for (i in 1:5){
# BAng<-c(BAng,Bang[[i]])
# }
# BANG<-paste("http://bang.tx3.163.com",BAng,sep="")
# RESULT<-c()
# for (i in 1:100){
# if (getURL(BANG[2*i-1],encoding="gbk")==""){
# RESULT<-RESULT
# }else
# {RESULT<-rbind(RESULT,informationofYJrole(BANG[2*i-1]))
# }
# }
# write.csv(RESULT,paste(YJservername[j],"弈剑数据.csv",sep=""))
# }
