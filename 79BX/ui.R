library(shiny)
shinyUI(fluidPage(
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
  sidebarPanel(width = 2,
    h2("头部"),
    selectInput("head1","装备选择:",
                choices = c("妙手之古始冠","元破之古始冠","浩风之古始冠","轻焰之古始冠",
                            "寒雨之古始冠","闇火之古始冠","龙卷之古始冠","沉忧之古始冠",
                            "混元之古始冠","罂散之古始冠","紫陌冠·玄","紫陌冠·素",
                            "燕影之无极冠","蓝沁冠","上净云水冠","秋水落霞冠","长天孤鹜冠")),
    p("注：若为燕影之无极冠，请进一步选择三条隐藏属性,否则忽略此步骤",style = "color:red;"),
    selectInput("head2_1","第一条:",choices = "无"),
    selectInput("head2_2","第二条:",choices = "无"),
    selectInput("head2_3","第三条:",choices = "无"),
    selectInput("head_zuan1","加护数",choices = c(0:20)),
    p("炼化",style = "color:red;"),
    selectInput("head3_1","蓝:",choices = c("无","力","敏","魂","念","疾","体")),
    selectInput("head3_2","橙:",choices = c("无","附火","附水","附元","附风","附毒",
                                           "白刃","阴伤","崩击","水重","火重","风重",
                                           "元重","毒重","挥砍化解","钝系化解","穿刺化解",
                                           "火系化解","水系化解","风系化解","元系化解","毒系化解")),
    selectInput("head3_3","金:",choices = c("无","追电","神明","明思","疾语")),
    selectInput("head3_4","紫:",choices = c("无","最大物攻","最小物攻","物防","最小法攻","最大法攻","法防")),
    selectInput("head_zuan2","炼护数",choices = c(0:20)),
    selectInput("head4","鉴定",choices = c("无"))
  ),
  mainPanel(
    tabsetPanel(
      tabPanel("最终属性",dataTableOutput("mytable"))
  )
)
))
  
  
  
  