library(shiny)
shinyUI(fluidPage(
  tags$head(includeScript("google-analytics.js")),
  tags$head(tags$style(HTML("
                            .shiny-split-layout > div {
                            overflow: visible;
                            }
                            #myplot1,#mytable1,#mytable2,#mytable3,#title{
                            font-size: 12px;
                            font-family: 'Times New Roman', 'Microsoft YaHei', '微软雅黑';
                            color: green;
                            }
                            #text1{
                            font-size: 12px;
                            font-family: 'Times New Roman', 'Microsoft YaHei', '微软雅黑';
                            color: red;
                            }
                            #personal{
                            font-size: 12px;
                            font-family: 'Times New Roman', 'Microsoft YaHei', '微软雅黑';
                            color: black;
                            background-image: url('http://pic2.52pk.com/files/091117/2272_135318_1_lit.jpg');
                            background-size: cover;
                            }
                            "))),
  tags$head(includeScript("google-analytics.js")),
  headerPanel(windowTitle = "69战场数据库",title = ""),
  div(
    h1("六朝寒暑空余念，九霄龙吟恨苍天 —— 69战场玩家属性数据库"),
    p(a("天下3论坛",href = "http://tx3.netease.com/",stype = "color:red;",target = "_blank"),
      "用户",a("ibm20023",href = "http://tx3.netease.com/space-uid-828023.html",target = "_blank"),"原创。",
      style = "text-align: right;
      color: black;"),
    style = "color: red;
    font-family: 'Times New Roman', 'Microsoft YaHei', '微软雅黑';
    text-align: center;
    "),
  p("最新信息请关注我的",a("新浪微博",href = "http://weibo.com/alexgenius?is_hot=1",target = "_blank"),
    style = "text-align: right;
    color: blue;"),
  p("App版本:3.0",style = "text-align: right;
    color: blue;"),
  sidebarPanel(id = "personal",
               p("此在线App提取2018年6月21日0点前英雄榜所有60-69级60000装评以上玩家的数据，如果您的号符合上述条件但是
                 不在列表中，请私信联系",a("作者",href = "http://tx3.netease.com/space-uid-828023.html"),"，谢谢！"),
               textInput("value","请输入您所关心的装评上限,不小于65000","120000"),
               selectInput("school","请选择您要查看的门派",choices = c("所有门派","荒火教","天机营","冰心堂",
                                                             "弈剑听雨阁","翎羽山庄","魍魉","太虚观","龙巫宫",
                                                             "鬼墨","云麓仙居")),
               selectInput("distribution","分布概览，请选择", choices = c("服务器","名字用字","门派","势力","翅膀","耳环一",
                                                                  "耳环二","戒指一","戒指二","项链","玉佩","手镯一",
                                                                  "手镯二","武器","副手","头冠","肩膀","衣服",
                                                                  "护腕","腰带","下摆","裤子","鞋")),
               selectInput("sort","单项属性排名,显示前50名,请选择属性名称,并在右侧列表中查看",choices = c("装评","修为","敏","力","魂","念","疾","体",
                                                                                "最小物攻","最大物攻","最小法攻","最大法攻","命中",
                                                                                "会心","重击","诛心","御心","万钧","铁壁","人祸","附伤",
                                                                                "疾语","追电","骤雨","物防","法防","生命值","技力值","神明",
                                                                                "回避","知彼","启慧","天灵")),
               textInput("similarity","请输入您要查看的玩家英雄榜，即可在右侧查看您的相关属性排名以及附近的20名玩家，
                         并可以相似度列表中查看与您属性最相近和最相反的各20名玩家。注：不输入此项并不影响查看右侧前三项功能",
                         "")
               
               
               
               ),
  
  
  
  mainPanel(
    tabsetPanel(id = "title",
                tabPanel("分布总览",tableOutput("myplot1")),
                tabPanel("单项属性排名",tableOutput("mytable1")),
                tabPanel("您的相关属性排名",textOutput("text1"),tableOutput("mytable3")),
                tabPanel("相似度",tableOutput("mytable2"))
    )
    
  )
  ))



