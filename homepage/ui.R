library(shiny)
shinyUI(fluidPage(
  tags$head(tags$style(HTML("
                            .shiny-split-layout > div {
                            overflow: visible;
                            }
                            body{
                            font-size: 12px;
                            font-family: 'Times New Roman', 'Microsoft YaHei', '微软雅黑';
                            color: black;
                            background-image: url('http://i3.img.969g.com/tx3/imgx2011/11/22/161_105149_bf09b.jpg');
                            background-size:cover;
                            }
                            "))),
  headerPanel(windowTitle = "天下3全等级段玩家属性数据库",title = ""),
  h1("天下3全等级段玩家属性数据库",style = "color:yellow;
                                            text-align: left;
                                           
                                            font-family: 'Times New Roman', 'Microsoft YaHei', '微软雅黑';"),
  p("作者:",a("ibm20023",href = "http://tx3.netease.com/space-uid-828023.html",target = "_blank"),style = "color:white;
                                                                                                       font-size: 14px;"),
  p("最新信息请关注我的",a("新浪微博",href = "http://weibo.com/alexgenius?is_hot=1",target = "_blank"),
    style = "text-align: left;
    color: white;"),
  br(),
  h3("神机经武，启运昌隆 —— 神启战场玩家属性数据库",style = "color:white;"),
  h3(a("七星沧海断飞云，九玄罂粟落梨花 —— 79战场玩家属性数据库",href = "http://159.203.121.218/Jacky/79/",target = "_blank",
       style = "color:white;")),
  h3(a("七绝仙魔阵，四海夜狼声 —— 74战场玩家属性数据库",href = "http://159.203.121.218/Jacky/74/",target = "_blank",style = "color:white;")),
  h3("六朝寒暑空余念，九霄龙吟恨苍天 —— 69战场玩家属性数据库",style = "color:white;"),
  h3("卅载天下多歧路，九死未悔忆初心 —— 39战场玩家属性数据库",style = "color:white;"),
  br(),
  br(),
  br(),
  br(),
  h4("其他功能:",style = "color:blue;"),
  h5(a("乘风斩妖天地间，强弩化飞烟 —— 79弈剑伤害模拟器",href = "http://159.203.121.218/Jacky/79YJ/",target = "_blank",
      style = "color:red;")),
  br(),
  br(),
  br(),
  br(),
  br(),
  br(),
  br(),
  br(),
  h4("相关链接:",style = "color:blue;"),
  h5(a("天下3官网",href = "http://tx3.163.com",target = "_blank",
       style = "color:red;")),
  h5(a("天下3论坛",href = "http://tx3.netease.com",target = "_blank",
       style = "color:red;")),
  h5(a("天下3藏宝阁",href = "http://tx3.cbg.163.com",target = "_blank",
       style = "color:red;"))
  ))
