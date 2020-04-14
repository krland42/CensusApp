# server.R

source("helpers.R") 
counties <- readRDS("data/counties.rds")
library(maps) 
library(mapproj)

shinyServer(
  function(input, output) {
    
    output$map <- renderPlot({
      
      data <- switch(input$var, 
                  "Percent White" = counties$white,
                  "Percent Black" = counties$black,
                  "Percent Hispanic" = counties$hispanic,
                  "Percent Asian" = counties$asian)
      
      col <- switch(input$var, 
                  "Percent White" = "darkblue",
                  "Percent Black" = "black",
                  "Percent Hispanic" = "darkgreen",
                  "Percent Asian" = "darkred")
      
      leg <- switch(input$var, 
                  "Percent White" = "% White",
                  "Percent Black" = "% Black",
                  "Percent Hispanic" = "% Hispanic",
                  "Percent Asian" = "% Asian")
      
      min <- input$range[1]
      
      max <- input$range[2]
      
      percent_map(data, col, leg, min, max)
    })
      
  }
)
    