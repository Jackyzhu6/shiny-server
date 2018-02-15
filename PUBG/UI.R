library(shiny)
shinyUI(fluidPage(
  tags$head(includeScript("google-analytics.js")),
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
    selectInput("advance","Please choose the data you would like to analyze",choices = c("Basic Data","Advanced Data")),
    actionButton("button", "Go ====>")
  ),
  
  conditionalPanel(
    condition = "input.advance == 'Basic Data'",
    mainPanel(
      tabsetPanel(
        tabPanel("Hightlights",htmlOutput("highlights1")),
        tabPanel("Kill Trend",plotOutput("killplot")),
        tabPanel("Headshot% Trend",plotOutput("headshotplot")),
        tabPanel("Damage Trend",plotOutput("damageplot")),
        tabPanel("Rank Trend",plotOutput("rankplot")),
        tabPanel("Survive Time Trend",plotOutput("surviveplot")),
        tabPanel("Score Trend(Only for the most recent season)",plotOutput("scoreplot"))
      )
    )),
  conditionalPanel(
    condition = "input.advance == 'Advanced Data'",
    mainPanel(
      tabsetPanel(
        tabPanel("Hightlights",htmlOutput("highlights")),
        tabPanel("Weapon Frequency",plotOutput("weaponplot")),
        tabPanel("Highly Significant Cheaters List",dataTableOutput("cheaters"))
      )
    ))
))