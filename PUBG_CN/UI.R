library(shiny)
shinyUI(fluidPage(
  tags$head(
    tags$style(HTML("
                    .shiny-output-error-validation {
                    width: 600px;
                    height: 590px;
                    color: red;
                    text-align: left;
                    font-size: 20px;
                    font-family: 'Times New Roman',sans-serif;
                    }
                    "))
    ),
  
  headerPanel('绝地求生高级数据分析'),
  sidebarPanel(
    textInput("id","请输入你要查询玩家的昵称:",""),
    selectInput("server","请选择服务器:",choices = c("na","eu","as","sea","krjp","oc","sa")),
    selectInput("recent","请选择要查询的时间段:",choices = c("Most recent season","All historical data")),
    selectInput("advance","请选择分析方式",choices = c("基础数据","高级数据")),
    actionButton("button", "Go ====>")
  ),
  
    conditionalPanel(
      condition = "input.advance == '基础数据'",
      mainPanel(
      tabsetPanel(
        tabPanel("亮点",htmlOutput("highlights1")),
        tabPanel("场均击杀趋势",plotOutput("killplot")),
        tabPanel("爆头率趋势",plotOutput("headshotplot")),
        tabPanel("场均伤害趋势",plotOutput("damageplot")),
        tabPanel("场均排名趋势",plotOutput("rankplot")),
        tabPanel("场均存活时间趋势",plotOutput("surviveplot")),
        tabPanel("分数走势（仅对最近赛季有效）",plotOutput("scoreplot"))
      )
    )),
    conditionalPanel(
      condition = "input.advance == '高级数据'",
      mainPanel(
      tabsetPanel(
        tabPanel("亮点",htmlOutput("highlights")),
        tabPanel("击杀/被击杀武器频率图",plotOutput("weaponplot")),
        tabPanel("曾匹配到的显著作弊者名单",dataTableOutput("cheaters"))
      )
    ))
))