library(shiny)
shinyUI(fluidPage(
  titlePanel("Welcome to Jacky's Homepage"),
  sidebarPanel(
    img(src = "https://scontent.xx.fbcdn.net/v/t1.0-9/12243358_196481214019171_6619561930378164684_n.jpg?oh=0fa184a356f226aece0e0433bf376775&oe=5975F327",width = 405,height = 383)
  ),
  mainPanel(
    p("My name is Jacky, an Operations Research Analyst who works for Intercontinental Group.")
  ))
)