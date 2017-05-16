library(shiny)
shinyUI(fluidPage(
  tags$head(
    tags$style(HTML("
                    .shiny-output-error-validation {
                    width: 600px;
                    height: 590px;
                    color: red;
                    text-align: center;
                    font-size: 30px;
                    font-family: 'Times New Roman',sans-serif;
                    }
                    "))
    ),
  
  headerPanel('Anomaly Date'),
  sidebarPanel(
  fileInput("data","Data",placeholder = "Please upload data"),
  dateInput("BD", 
              "Begin Date", 
              value = as.Date("2015-03-11"),
              min = as.Date("2012-11-01"), 
              max = Sys.Date()),
  dateInput("ED", 
              "End Date", 
              value = as.Date("2015-03-12"),
              min = as.Date("2012-11-01"), 
              max = Sys.Date()),
  sliderInput("p",
              "Proportion of Anomaly Date",
              value = 0.5,
              min = 0,
              max = 1),
  downloadButton('downloadData', 'Download the Outlier Date Table'),
  br(),
  br(),
  br(),
  br(),
  img(src = "http://40.media.tumblr.com/adfec22ce1145ac05de9421b087ba4f4/tumblr_o1mjkdgPsa1tpisfso1_500.png",width = 405,height = 383)
  ),
  mainPanel(
    tabPanel("Anomaly Date",dataTableOutput("values")),
    br(),
    img(src = "https://www.ihgmarketplace.net/images/ihg_brand_footer.jpg",width = 1024,height = 203)
  )
 ))
