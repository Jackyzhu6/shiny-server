library(shiny)

shinyUI(fluidPage(
  tags$head(
    tags$style(HTML("
                    .shiny-output-error-validation {
                    font-size: 40px;
                    color: red;
                    }
                    "))
    ),
  
  # tags$head(includeScript("google-analytics.js")),
  div(
  h1("天下3 - 79弈剑伤害模拟器"),
  p(a("天下3论坛",href = "http://tx3.netease.com/",stype = "color:red;"),
    "用户",a("ibm20023",href = "http://tx3.netease.com/space-uid-828023.html"),"原创",
                                 style = "text-align: right;
                                          color: black;"),
                                 style = "color: red;
                                          font-family: 'Times New Roman', 'Microsoft YaHei', '微软雅黑';
                                          text-align: center;
  
  "),
  div(sidebarPanel(
      textInput("url", "请输入弈剑英雄榜",  
                   "http://bang.tx3.163.com/bang/role/47_4243247"),
      textInput("url2", "请输入对手英雄榜",
                "http://bang.tx3.163.com/bang/role/37_10817379"),
      helpText("合体功能默认开启最高级神启节点，不计算概率触发的节点效果，只开放攻击流派合体，灵猴合体地魂附伤增加默认为150"),
      selectInput("buff9","合体:",
                  choices = c("无","猛虎","水生","蜃气","仙狐","厉鬼","强盗","灵猴")),
      selectInput("buff12","润脉:",
                  choices = c("无","无老婆，还是无","注定孤独一生，依然是无")),
      selectInput("buff7","听雨:",
                  choices = c("无","有")),
      selectInput("buff1","幻心:",
                  choices = c("无","有但未开启落絮随风","有且开启落絮随风")),
      selectInput("buff2","乱红千点:",
                  choices = c("无","85% ~ 100%血","60% ~ 85%血","35% ~ 60%血","35%血以下")),
      selectInput("buff3","威扬:",
                  choices = c("无","有")),
      selectInput("buff11","心眼:",
                  choices = c("无","有")),
      selectInput("buff10","紫电青霜:",
                  choices = c("无","有")),
      selectInput("buff4","兵解:",
                  choices = c("无","有")),
      selectInput("buff5","古剑通灵:",
                  choices = c("无","有")),
      selectInput("buff8","吴钩霜雪:",
                  choices = c("无","有")),
      selectInput("buff6","封缸酒:",
                  choices = c("无","有"))
      
    ),style = "color: red;"),
    mainPanel(
      tabsetPanel(
        tabPanel("弈剑属性",dataTableOutput("mytable")),
        tabPanel("对手属性",dataTableOutput("mytable2")),
        tabPanel("物理伤害数值",dataTableOutput("mytable3")),
        tabPanel("期望物理伤害",dataTableOutput("mytable4")),
        tabPanel("法术伤害数值",dataTableOutput("mytable5")),
        tabPanel("期望法术伤害",dataTableOutput("mytable6"))
      )
    )
  ))
