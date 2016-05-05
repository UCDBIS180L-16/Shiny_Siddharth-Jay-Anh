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
library(reshape2)


#melt.iris2 <- melt.iris[order(melt.iris),]



#melt.iris3 <- melt.iris2[!is.na(melt.iris2),]

# Define server logic required to draw a boxplot
shinyServer(function(input, output) {
  
  # Expression that generates a boxplot. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$boxPlot <- renderPlot({
    
    melt.iris <- melt(iris, id.vars="Species")
    
    colnames(melt.iris) <- c("species", "trait","value")
    
    melt.iris.sub <- subset(melt.iris, species==input$species)
    
    # set up the plot
    pl <- ggplot(data = melt.iris.sub,
                 #Use aes_string below so that input$trait is interpreted
                 #correctly.  The other variables need to be quoted
                 aes_string(x="species",
                            y="value",
                            fill="trait"
                            
                        
                 )
    )
    
    # draw the boxplot for the specified trait
    pl + geom_boxplot()
  })
})



