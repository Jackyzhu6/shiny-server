library(shiny)
shinyUI(fluidPage(
  # tags$head(includeScript("google-analytics.js")),
  tags$head(tags$style(HTML("
                            .shiny-split-layout > div {
                            overflow: visible;
                            }
                            #personal,#weapon,#head,#clothes,#shoulder,#pant,#arm,#belt,#shoes,#short{
                            font-size: 12px;
                            font-family: 'Times New Roman', 'Microsoft YaHei', '微软雅黑';
                            color: brown;
                            background-color: #4CBDBD;
                            }
                            "))),
  tags$head(includeScript("google-analytics.js")),
  div(
    h1("七星沧海断飞云，九玄罂粟落梨花 - 79战场数据库"),
    p(a("天下3论坛",href = "http://tx3.netease.com/",stype = "color:red;"),
      "用户",a("ibm20023",href = "http://tx3.netease.com/space-uid-828023.html"),"原创",
      style = "text-align: right;
      color: black;"),
    style = "color: red;
    font-family: 'Times New Roman', 'Microsoft YaHei', '微软雅黑';
    text-align: center;
    "),
  sidebarPanel(id = "personal",
               p("此在线App提取2017年6月4日10点前英雄榜所有75-79级70000装评以上玩家的数据，如果您的号符合上述条件但是
                 不在列表中，请私信联系",a("作者",href = "http://tx3.netease.com/space-uid-828023.html"),"，谢谢！"),
               selectInput("school","请选择您要查看的门派",choices = c("所有门派","荒火教","天机营","冰心堂",
                                                             "弈剑听雨阁","翎羽山庄","魍魉","太虚观","龙巫宫",
                                                             "鬼墨","云麓仙居")),
               selectInput("distribution","分布概览，请选择", choices = c("服务器","名字用字","势力","翅膀","耳环一",
                                                                  "耳环二","戒指一","戒指二","项链","玉佩","手镯一",
                                                                  "手镯二","武器","副手","头冠","肩膀","衣服",
                                                                  "护腕","腰带","下摆","裤子","鞋")),
               selectInput("sort","属性排序,显示前50名,请选择属性名称,并在右侧列表中查看",choices = c("装评","敏","力","魂","念","疾","体",
                                                            "最小物攻","最大物攻","最小法攻","最大法攻","命中",
                                                            "会心","重击","诛心","御心","万钧","铁壁","人祸","附伤",
                                                            "疾语","追电","物防","法防","生命值","技力值","神明",
                                                            "回避","知彼")),
               textInput("similarity","相似度,请输入您的英雄榜，并在右侧列表中查看与您属性最相近和最相反的各20名玩家",
                         "")
               
  ),
 
               
  
  mainPanel(
            tabsetPanel(
              tabPanel("分布总览",tableOutput("myplot1")),
              tabPanel("属性排序",tableOutput("mytable1")),
              tabPanel("相似度",tableOutput("mytable2"))
              
            )
            
  )
    ))



