library(shiny)
library(ggplot2)
load("data.Rda")
# Define the overall UI
shinyUI(
  # Use a fluid Bootstrap layout
  fluidPage(    
    # Give the page a title
    titlePanel("Optimal Mitigation-Adaptation mix"),
    # Generate a row with a sidebar
    sidebarLayout(      
      # Define the sidebar with one input
      sidebarPanel(
        selectInput("uncert_type", "Uncertainty scenario:", 
                    choices=colnames(dataplot[,2:6])),
        hr()
      ),
      # Create a spot for the plot
      mainPanel(
        plotOutput("mixPlot")  
      )
    )
  )
)