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
library(jsonlite)
#load("Assignment/Rice_plots/rice_data.Rdata")
# Define server logic required to color MDS plot
shinyServer(function(input, output) {

  output$Plot <- renderPlot({
    #set variable to an object to use for coloring.
    trait_color <- subset(data.pheno.mds, select = input$choice)
    pericarp <- subset(data.pheno.mds, select = Pericarp.color)
    region <- subset(data.pheno.mds, select = Region)
    
    
  #Plot a Violin plot  
  if( input$plot_choice == "Violin" )
  {
    # pl <- ggplot(data.pheno.mds, aes(popID, trait_color))
    # 
    # if(input$choice == "Pericarp.color" | input$choice == "Region")
    # {
    #   pl + geom_violin() + labs(title = input$choice) + theme(plot.title = element_text(size = rel(2)), axis.title.x = element_text(face="bold", colour="#990000", size=20), axis.title.y = element_text(face="bold", colour="#990000", size=20), legend.title = element_text(colour="red", size = 12, face = "bold"), legend.text = element_text(colour="blue", size = 12, face = "bold"))
    # }
    # 
    # # else
    # #{
    #   pl + geom_violin() + labs(title = input$choice) + ylab("Trait Value") +theme(plot.title = element_text(size = rel(2)), axis.title.x = element_text(face="bold", colour="#990000", size=20), axis.title.y = element_text(face="bold", colour="#990000", size=20), legend.title = element_text(colour="red", size = 12, face = "bold"), legend.text = element_text(colour="blue", size = 12, face = "bold"))
    # #}
  
      if(input$choice == "Pericarp.color")
      {
        pl <- ggplot(data.pheno.mds, aes(popID, pericarp)) 
        pl + labs(title = "Pericarp.color") + theme(plot.title = element_text(size = rel(2)), axis.title.x = element_text(face="bold", colour="#990000", size=20), axis.title.y = element_text(face="bold", colour="#990000", size=20), legend.title = element_text(colour="red", size = 12, face = "bold"), legend.text = element_text(colour="blue", size = 12, face = "bold"))
      }
      else
        if(input$choice == "Region")
        {
          pl <- ggplot(data.pheno.mds, aes(popID, factor(region)))
          pl +  labs(title = "Region") + theme(plot.title = element_text(size = rel(2)), axis.title.x = element_text(face="bold", colour="#990000", size=20), axis.title.y = element_text(face="bold", colour="#990000", size=20), legend.title = element_text(colour="red", size = 12, face = "bold"), legend.text = element_text(colour="blue", size = 12, face = "bold"))
        }
      else
        pl <- ggplot(data.pheno.mds, aes(popID, trait_color))
        pl + geom_violin() + labs(title = input$choice) + ylab("Trait Value") +theme(plot.title = element_text(size = rel(2)), axis.title.x = element_text(face="bold", colour="#990000", size=20), axis.title.y = element_text(face="bold", colour="#990000", size=20), legend.title = element_text(colour="red", size = 12, face = "bold"), legend.text = element_text(colour="blue", size = 12, face = "bold"))
      
      
  }
  else
  #Plot a scatterplot
  if( input$plot_choice == "Scatterplot" )
  {
    pl <- ggplot(data.pheno.mds, aes(V1,V2, color = trait_color))

    if(input$choice == "Pericarp.color" | input$choice == "Region")
    {
      pl + geom_point() +  scale_color_brewer(palette = "Set1") + labs(title = input$choice) + theme(plot.title = element_text(size = rel(2)), axis.title.x = element_text(face="bold", colour="#990000", size=20), axis.title.y = element_text(face="bold", colour="#990000", size=20), legend.title = element_text(colour="red", size = 12, face = "bold"), legend.text = element_text(colour="blue", size = 12, face = "bold"), legend.title = element_text(colour="blue", size = 16, face = "bold"))
    }

    else
    {
    pl + geom_point() + scale_color_gradient(low = input$onecolor, high = input$twocolor) + labs(title = input$choice) + theme(plot.title = element_text(size = rel(2)), axis.title.x = element_text(face="bold", colour="#990000", size=20), axis.title.y = element_text(face="bold", colour="#990000", size=20), legend.title = element_text(colour="red", size = 12, face = "bold"), legend.text = element_text(colour="blue", size = 12, face = "bold"), legend.title = element_text(colour="blue", size = 16, face = "bold"))
    }
   # Goodwork on the low/high scale color line above Jay -Sid
  }

  })
})