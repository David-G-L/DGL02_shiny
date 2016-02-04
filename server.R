library(shiny)
library(ggplot2)
library(reshape2)

load("data.Rda")

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
dataset<- reactive({melt(dataplot[,c(input$uncert_type,"certainty","year")],id.vars="year")})

  output$mixPlot <- renderPlot({
  # Fill in the spot we created for a plot
    p <- ggplot(dataset(), aes(x=year, y=value, group=variable, colour=variable)) + 
      geom_line() +
      geom_line(size=2) + 
      scale_y_continuous("%",limits=c(0, 100)) + 
      theme(
        axis.title=element_text(size=16),
        panel.grid.major = element_line(colour="gray",size=0.35),
        panel.grid.minor = element_line(colour="gray60",size=0.1),
        panel.background = element_rect(fill = "white"),
        text = element_text(family="Lato"),
        axis.ticks =  element_blank(),
        axis.text.x=element_text(colour="black"),
        axis.text.y=element_text(colour="black"),
        legend.text=element_text(size=16),
        legend.position="top",
        legend.title=element_blank(),
        legend.key = element_blank()
      ) 
    print(p)
  })
})