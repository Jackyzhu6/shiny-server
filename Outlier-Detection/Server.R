library(shiny)
source("Outlier Detection.R")
options(shiny.maxRequestSize=30*1024^2)
shinyServer(function(input, output) {
  result <- reactive({
    Infile <- input$data
    if (is.null(Infile)){
      return(NULL)
    } else {
      DATA <- read.table(Infile$datapath,header = TRUE,stringsAsFactors = FALSE)
      validate(
        need(input$BD < input$ED, 
             message = "Are you kidding me? The start date should be set before the end date!!!"),
        need(identical(names(DATA),c("hotel","pc","stay_date","day_of_week","BTA","COR",
                                     "EXT","FEN","GOV","GRO","HSL","MEM","OPQ","OTH","TAC","UNF")),
             message = "Please check the data format or column name.")
      )
      result <- Method5(DATA,input$BD,input$ED,input$p)
      return(result)
    }
  })
  output$values = renderDataTable({
    result()
  },options = list(aLengthMenu = c(10, 20, 50), iDisplayLength = 10))
  output$downloadData <- downloadHandler(
    filename = "outlier.csv",
    content = function(file) {
      write.csv(result(), file)
    }
  )
})

