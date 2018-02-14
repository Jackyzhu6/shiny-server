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
  
  headerPanel('PUBG Advanced Player Statistics'),
  sidebarPanel(
    textInput("id","Please input your ID:",""),
    selectInput("server","Please choose the server:",choices = c("na","eu","as","sea","krjp","oc","sa")),
    selectInput("recent","Please choose the period:",choices = c("Most recent season","All historical data")),
    actionButton("button", "Go")
  ),
  mainPanel(
    tabsetPanel(
      tabPanel("Hightlights",htmlOutput("highlights")),
      tabPanel("Kill Trend",plotOutput("killplot")),
      tabPanel("Headshot% Trend",plotOutput("headshotplot")),
      tabPanel("Damage Trend",plotOutput("damageplot"))
    )
  )
))