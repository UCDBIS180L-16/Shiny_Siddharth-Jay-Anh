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
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      radioButtons("trait", #the input variable that the value will go into
                   "Choose a trait to display:",
                   c("Alu.Tol",
                     "Protein.content",
                     "Amylose.content",
                     "Region",
                     "Pericarp.color",
                     "laziness.content")
      )),
    # Show a plot of the generated distribution
    mainPanel(plotOutput("boxPlot")
    )
  )

))


