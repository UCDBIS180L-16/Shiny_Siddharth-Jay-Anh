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

# Define server logic required to color MDS plot
shinyServer(function(input, output) {

  output$Plot <- renderPlot({
    
  #Plot a histogram  
  if( input$plot_choice == "Histogram" )
  {
    trait_color <- subset(data.pheno.mds, select = input$choice)  
    pl <- ggplot(data.pheno.mds, aes(x = trait_color))
    
    if(input$choice == "Pericarp.color" | input$choice == "Region")
    {
      pl + geom_histogram(binwidth=3) + ggtitle("trait_color") + scale_color_brewer(palette = "Set1") # + facet_wrap(facets= ~ popID, ncol=3)
    }
  
    else
    {
      pl + geom_histogram(binwidth=3) + ggtitle("trait_color") + scale_color_gradient(low = input$onecolor, high = input$twocolor) # + facet_wrap(facets= ~ popID, ncol=3)
    }
  
  }

  #Plot a scatterplot
  if( input$plot_choice == "Scatterplot" )  
  {  
    trait_color <- subset(geno.pheno.mds, select = input$choice)
    pl <- ggplot(geno.pheno.mds, aes(V1,V2, color = trait_color))

    if(input$choice == "Pericarp.color" | input$choice == "Region")
    {
      pl + geom_point() + scale_color_brewer(palette = "Set1")
    }
  
    else
    {
    pl + geom_point() + scale_color_gradient(low = input$onecolor, high = input$twocolor)
    }
   # Goodwork on the low/high scale color line above Jay -Sid
  }  
  
  })
})