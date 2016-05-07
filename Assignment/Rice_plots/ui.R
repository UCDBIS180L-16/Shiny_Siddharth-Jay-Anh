#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
#load("Assignment/data_from_SNP_lab.RData") do this manually.


# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  titlePanel("Rice plots"),
  
  helpText("This application creates a multiple plots to show difference between",
           "Rice samples.  Please use the radio box below to choose a species",
           "for plotting"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      
      radioButtons("plot_choice",
                   "Choose how you want to plot the data:",
                   c("Scatterplot",
                     "Histogram")
      ),
      
      radioButtons("choice", #the input variable that the value will go into
                   "Choose a trait to display:",
                   c("Alu.Tol",
                     "Protein.content",
                     "Amylose.content",
                     "Region",
                     "Pericarp.color")
      ),
      
      helpText("Below: For Alu.Tol, Protein.content and Amylose.content"),
      
      radioButtons("onecolor",
                   "Choose a low scale color:",
                   c("Red",
                     "Blue")
      ),
      radioButtons("twocolor",
                 "Choose a high scale color:",
                 c("Blue",
                   "Red")
    )),
    # Show a plot of the generated distribution
    mainPanel(plotOutput("Plot")
    )
  )

))


