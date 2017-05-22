library(shiny)
shinyUI(fluidPage(
  # tags$head(includeScript("google-analytics.js")),
  tags$head(tags$style(HTML("
                            .shiny-split-layout > div {
                            overflow: visible;
                            }
                            #personal,#head,#clothes,#shoulder,#pant,#arm,#belt,#shoes,#short{
                            font-size: 12px;
                            font-family: 'Times New Roman', 'Microsoft YaHei', '微软雅黑';
                            color: brown;
                            background-color: #4CBDBD;
                            }
                            "))),
  tags$head(includeScript("google-analytics.js")),
  div(
    h1("天下3 - 79冰心属性制作App"),
    p(a("天下3论坛",href = "http://tx3.netease.com/",stype = "color:red;"),
      "用户",a("ibm20023",href = "http://tx3.netease.com/space-uid-828023.html"),"原创",
      style = "text-align: right;
                                          color: black;"),
    style = "color: red;
                                          font-family: 'Times New Roman', 'Microsoft YaHei', '微软雅黑';
                                          text-align: center;
  
  "),
  column(8,
    sidebarPanel(width = 3,id = "personal",
                 h3("人物基本属性"),
                 selectInput("base","主属性:",choices = c("无","力","敏","魂","念","疾","体")),
                 selectInput("chengwei","称谓:",choices = c("无","立悯常所慈","立才常所傲","立智常所明")),
                 p("默认没有称谓强化属性")
    ),
    sidebarPanel(width = 3,id = "head",
                 h3("冠"),
                 selectInput("head1","装备选择:",
                             choices = c("妙手之古始冠","元破之古始冠","浩风之古始冠","轻焰之古始冠",
                                         "寒雨之古始冠","闇火之古始冠","龙卷之古始冠","沉忧之古始冠",
                                         "混元之古始冠","罂散之古始冠","紫陌冠·玄","紫陌冠·素",
                                         "燕影之无极冠","蓝沁冠","上净云水冠","秋水落霞冠","长天孤鹜冠")),
                 p("注：若为燕影之无极冠，请进一步选择三条隐藏属性,否则忽略此步骤",style = "color:red;"),
                 splitLayout(
                   selectInput("head2_1","第一条:",choices = "无"),
                   selectInput("head2_2","第二条:",choices = "无"),
                   selectInput("head2_3","第三条:",choices = "无")
                 ),
                 h5("炼化",style = "color:red;"),
                 splitLayout(
                   selectInput("head3_1","蓝:",choices = c("无","力","敏","魂","念","疾","体")),
                   selectInput("head3_2","橙:",choices = c("无","附火","附水","附元","附风","附毒",
                                                          "白刃","阴伤","崩击","水重","火重","风重",
                                                          "元重","毒重","挥砍化解","钝系化解","穿刺化解",
                                                          "火系化解","水系化解","风系化解","元系化解","毒系化解"))
                 ),
                 splitLayout(
                   selectInput("head3_3","金:",choices = c("无","追电","神明","明思","疾语")),
                   selectInput("head3_4","紫:",choices = c("无","最大物攻","最小物攻","物防","最小法攻","最大法攻","法防"))
                 ),
                 splitLayout(
                   selectInput("head_zuan1","加护数",choices = c(0:20)),
                   selectInput("head_zuan2","炼护数",choices = c(0:20)),
                   selectInput("head4","鉴定",choices = c("无"))
                 )
    ),
    sidebarPanel(width = 3,id = "shoulder",
                 h3("肩"),
                 selectInput("shoulder1","装备选择:",
                             choices = c("妙手之古始肩","元破之古始肩","浩风之古始肩","轻焰之古始肩",
                                         "寒雨之古始肩","闇火之古始肩","龙卷之古始肩","沉忧之古始肩",
                                         "混元之古始肩","罂散之古始肩","紫陌肩·玄","紫陌肩·素",
                                         "燕影之无极肩","蓝沁肩","上净云水肩","秋水落霞肩","长天孤鹜肩")),
                 p("注：若为燕影之无极肩，请进一步选择三条隐藏属性,否则忽略此步骤",style = "color:red;"),
                 splitLayout(
                   selectInput("shoulder2_1","第一条:",choices = "无"),
                   selectInput("shoulder2_2","第二条:",choices = "无"),
                   selectInput("shoulder2_3","第三条:",choices = "无")
                 ),
                 h5("炼化",style = "color:red;"),
                 splitLayout(
                   selectInput("shoulder3_1","蓝:",choices = c("无","力","敏","魂","念","疾","体")),
                   selectInput("shoulder3_2","橙:",choices = c("无","附火","附水","附元","附风","附毒",
                                                              "白刃","阴伤","崩击","水重","火重","风重",
                                                              "元重","毒重","挥砍化解","钝系化解","穿刺化解",
                                                              "火系化解","水系化解","风系化解","元系化解","毒系化解"))
                 ),
                 splitLayout(
                   selectInput("shoulder3_3","金:",choices = c("无","追电","神明","明思","疾语")),
                   selectInput("shoulder3_4","紫:",choices = c("无","最大物攻","最小物攻","物防","最小法攻","最大法攻","法防"))
                 ),
                 splitLayout(
                   selectInput("shoulder_zuan1","加护数",choices = c(0:20)),
                   selectInput("shoulder_zuan2","炼护数",choices = c(0:20)),
                   selectInput("shoulder4","鉴定",choices = c("无"))
                 )
    ),
    sidebarPanel(width = 3,id = "clothes",
                 h3("袍"),
                 selectInput("clothes1","装备选择:",
                             choices = c("妙手之古始袍","元破之古始袍","浩风之古始袍","轻焰之古始袍",
                                         "寒雨之古始袍","闇火之古始袍","龙卷之古始袍","沉忧之古始袍",
                                         "混元之古始袍","罂散之古始袍","紫陌袍·玄","紫陌袍·素",
                                         "燕影之无极袍","蓝沁袍","上净云水袍","秋水落霞袍","长天孤鹜袍")),
                 p("注：若为燕影之无极袍，请进一步选择三条隐藏属性,否则忽略此步骤",style = "color:red;"),
                 splitLayout(
                   selectInput("clothes2_1","第一条:",choices = "无"),
                   selectInput("clothes2_2","第二条:",choices = "无"),
                   selectInput("clothes2_3","第三条:",choices = "无")
                 ),
                 h5("炼化",style = "color:red;"),
                 splitLayout(
                   selectInput("clothes3_1","蓝:",choices = c("无","力","敏","魂","念","疾","体")),
                   selectInput("clothes3_2","橙:",choices = c("无","附火","附水","附元","附风","附毒",
                                                             "白刃","阴伤","崩击","水重","火重","风重",
                                                             "元重","毒重","挥砍化解","钝系化解","穿刺化解",
                                                             "火系化解","水系化解","风系化解","元系化解","毒系化解"))
                 ),
                 splitLayout(
                   selectInput("clothes3_3","金:",choices = c("无","追电","神明","明思","疾语")),
                   selectInput("clothes3_4","紫:",choices = c("无","最大物攻","最小物攻","物防","最小法攻","最大法攻","法防"))
                 ),
                 splitLayout(
                   selectInput("clothes_zuan1","加护数",choices = c(0:20)),
                   selectInput("clothes_zuan2","炼护数",choices = c(0:20)),
                   selectInput("clothes4","鉴定",choices = c("无"))
                 )
    ),
    sidebarPanel(width = 3,id = "belt",
                 h3("带"),
                 selectInput("belt1","装备选择:",
                             choices = c("妙手之古始带","元破之古始带","浩风之古始带","轻焰之古始带",
                                         "寒雨之古始带","闇火之古始带","龙卷之古始带","沉忧之古始带",
                                         "混元之古始带","罂散之古始带","紫陌带·玄","紫陌带·素",
                                         "燕影之无极带","蓝沁带","上净云水带","秋水落霞带","长天孤鹜带")),
                 p("注：若为燕影之无极带，请进一步选择三条隐藏属性,否则忽略此步骤",style = "color:red;"),
                 splitLayout(
                   selectInput("belt2_1","第一条:",choices = "无"),
                   selectInput("belt2_2","第二条:",choices = "无"),
                   selectInput("belt2_3","第三条:",choices = "无")
                 ),
                 splitLayout(
                   selectInput("belt_zuan1","加护数",choices = c(0:20)),
                   selectInput("belt4","鉴定",choices = c("无"))
                 )
    ),
    sidebarPanel(width = 3,id = "pant",
                 h3("长裤"),
                 selectInput("pant1","装备选择:",
                             choices = c("妙手之古始长裤","元破之古始长裤","浩风之古始长裤","轻焰之古始长裤",
                                         "寒雨之古始长裤","闇火之古始长裤","龙卷之古始长裤","沉忧之古始长裤",
                                         "混元之古始长裤","罂散之古始长裤","紫陌长裤·玄","紫陌长裤·素",
                                         "燕影之无极长裤","蓝沁长裤","上净云水长裤","秋水落霞长裤","长天孤鹜长裤")),
                 p("注：若为燕影之无极长裤，请进一步选择三条隐藏属性,否则忽略此步骤",style = "color:red;"),
                 splitLayout(
                   selectInput("pant2_1","第一条:",choices = "无"),
                   selectInput("pant2_2","第二条:",choices = "无"),
                   selectInput("pant2_3","第三条:",choices = "无")
                 ),
                 h5("炼化",style = "color:red;"),
                 splitLayout(
                   selectInput("pant3_1","蓝:",choices = c("无","力","敏","魂","念","疾","体")),
                   selectInput("pant3_2","橙:",choices = c("无","附火","附水","附元","附风","附毒",
                                                          "白刃","阴伤","崩击","水重","火重","风重",
                                                          "元重","毒重","挥砍化解","钝系化解","穿刺化解",
                                                          "火系化解","水系化解","风系化解","元系化解","毒系化解"))
                 ),
                 splitLayout(
                   selectInput("pant3_3","金:",choices = c("无","追电","神明","明思","疾语")),
                   selectInput("pant3_4","紫:",choices = c("无","最大物攻","最小物攻","物防","最小法攻","最大法攻","法防"))
                 ),
                 splitLayout(
                   selectInput("pant_zuan1","加护数",choices = c(0:20)),
                   selectInput("pant_zuan2","炼护数",choices = c(0:20)),
                   selectInput("pant4","鉴定",choices = c("无"))
                 )
    ),
    sidebarPanel(width = 3,id = "short",
                 h3("摆"),
                 selectInput("short1","装备选择:",
                             choices = c("妙手之古始摆","元破之古始摆","浩风之古始摆","轻焰之古始摆",
                                         "寒雨之古始摆","闇火之古始摆","龙卷之古始摆","沉忧之古始摆",
                                         "混元之古始摆","罂散之古始摆","紫陌摆·玄","紫陌摆·素",
                                         "燕影之无极摆","蓝沁摆","上净云水摆","秋水落霞摆","长天孤鹜摆")),
                 p("注：若为燕影之无极摆，请进一步选择三条隐藏属性,否则忽略此步骤",style = "color:red;"),
                 splitLayout(
                   selectInput("short2_1","第一条:",choices = "无"),
                   selectInput("short2_2","第二条:",choices = "无"),
                   selectInput("short2_3","第三条:",choices = "无")
                 ),
                 splitLayout(
                   selectInput("short_zuan1","加护数",choices = c(0:20)),
                   selectInput("short4","鉴定",choices = c("无"))
                 )
    ),
    sidebarPanel(width = 3,id = "arm",
                 h3("腕"),
                 selectInput("arm1","装备选择:",
                             choices = c("妙手之古始腕","元破之古始腕","浩风之古始腕","轻焰之古始腕",
                                         "寒雨之古始腕","闇火之古始腕","龙卷之古始腕","沉忧之古始腕",
                                         "混元之古始腕","罂散之古始腕","紫陌腕·玄","紫陌腕·素",
                                         "燕影之无极腕","蓝沁腕","上净云水腕","秋水落霞腕","长天孤鹜腕")),
                 p("注：若为燕影之无极腕，请进一步选择三条隐藏属性,否则忽略此步骤",style = "color:red;"),
                 splitLayout(
                   selectInput("arm2_1","第一条:",choices = "无"),
                   selectInput("arm2_2","第二条:",choices = "无"),
                   selectInput("arm2_3","第三条:",choices = "无")
                 ),
                 h5("炼化",style = "color:red;"),
                 splitLayout(
                   selectInput("arm3_1","蓝:",choices = c("无","力","敏","魂","念","疾","体")),
                   selectInput("arm3_2","橙:",choices = c("无","附火","附水","附元","附风","附毒",
                                                         "白刃","阴伤","崩击","水重","火重","风重",
                                                         "元重","毒重","挥砍化解","钝系化解","穿刺化解",
                                                         "火系化解","水系化解","风系化解","元系化解","毒系化解"))
                 ),
                 splitLayout(
                   selectInput("arm3_3","金:",choices = c("无","追电","神明","明思","疾语")),
                   selectInput("arm3_4","紫:",choices = c("无","最大物攻","最小物攻","物防","最小法攻","最大法攻","法防"))
                 ),
                 splitLayout(
                   selectInput("arm_zuan1","加护数",choices = c(0:20)),
                   selectInput("arm_zuan2","炼护数",choices = c(0:20)),
                   selectInput("arm4","鉴定",choices = c("无"))
                 )
    ),
    sidebarPanel(width = 3,id = "shoes",
                 h3("履"),
                 selectInput("shoes1","装备选择:",
                             choices = c("妙手之古始履","元破之古始履","浩风之古始履","轻焰之古始履",
                                         "寒雨之古始履","闇火之古始履","龙卷之古始履","沉忧之古始履",
                                         "混元之古始履","罂散之古始履","紫陌履·玄","紫陌履·素",
                                         "燕影之无极履","蓝沁履","上净云水履","秋水落霞履","长天孤鹜履")),
                 p("注：若为燕影之无极履，请进一步选择三条隐藏属性,否则忽略此步骤",style = "color:red;"),
                 splitLayout(
                   selectInput("shoes2_1","第一条:",choices = "无"),
                   selectInput("shoes2_2","第二条:",choices = "无"),
                   selectInput("shoes2_3","第三条:",choices = "无")
                 ),
                 splitLayout(
                   selectInput("shoes_zuan1","加护数",choices = c(0:20)),
                   selectInput("shoes4","鉴定",choices = c("无"))
                 )
    )),
  mainPanel(width = 4,
    tabsetPanel(
      tabPanel("最终属性",dataTableOutput("mytable"))
  )
)
))
  
  
  
  