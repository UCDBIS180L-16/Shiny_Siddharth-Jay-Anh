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
   
  output$histPlot <- renderPlot({
    
    
    # qplot(x=Alu.Tol,data=data.pheno.mds)
    
    #multiple histograms of Alu.Tol.
    pl <- ggplot(data=data.pheno.mds,aes(x = input$trait)) #create the basic plot object
    pl <- pl + geom_histogram() #tell R that we want a histogram, with binwidth of 3
    # pl <- pl + facet_wrap(facets= ~ popID, ncol=3) # a separate plot ("facet") for each region, arranged in 3 columns
    # pl <- pl + ggtitle("input$trait") #add a title

    #bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # pl + geom_histogram()
    
    #FOR LATER
    # #boxplot of Alu.Tol
    # qplot(x=popID,y=Alu.Tol,geom="boxplot",data=data.pheno.mds)
    # 
    # #BONUS violin plot
    # v <- ggplot(data.pheno.mds, aes(popID, Alu.Tol))
    # v + geom_violin()
    
    # 
    # # generate bins based on input$bins from ui.R
    # x    <- faithful[, 2] 
    # bins <- seq(min(x), max(x), length.out = input$bins + 1)
    # 
    # # draw the histogram with the specified number of bins
    # hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
  })
  
})
