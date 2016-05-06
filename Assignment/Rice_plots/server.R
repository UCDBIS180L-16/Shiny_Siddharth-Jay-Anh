#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  output$Plot <- renderPlot({

  new <- subset(geno.pheno.mds, select = input$choice)

   pl <- ggplot(geno.pheno.mds, aes(V1,V2, color = new))

   if(input$choice == "Pericarp.color" | input$choice == "Region")
   {
      pl + geom_point() + scale_color_brewer(palette="Set1")
   }

   else
     pl + geom_point()
  })
})