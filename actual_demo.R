
## Quick Demo #2
## WAS Dec 2016 for PDXRlang 

library(shiny)
library(shinythemes)

ui <- fluidPage(
                theme = shinytheme("united")
                , titlePanel("Central Limit and Sqrt(n)")
                , sidebarPanel(
                    radioButtons("stat", "Statistic:",
                            choices = c("Mean" = "mean",
                              "Median" = "median"), width = 4)
                    
                    , sliderInput("logpoints", "log10(points in each sample)", 
                                  min = 1, max = 5, value = 1, step = .5)
                    
                    , sliderInput("logsamples", "log10(samples)", min = 1, 
                                  max = 4, value = 1.5, step = .5)
                )
                
                , mainPanel(
                    plotOutput("disthist") 
                )
)

server <- function(input, output) {
    
    
    output$disthist <- renderPlot({
        
        stat.compute <- function(x, type) {
            switch(type,
                   mean = mean(x),
                   median = median(x))
            }
            
        
            set.seed(8765309)    
            
            sample.means <- 
                replicate(as.integer(10^input$logsamples), 
                            mean(
                                runif(as.integer(10^input$logpoints))
                                )
                         )
        
            hist(sample.means, xlim = c(0.2,0.8))
        abline(v = stat.compute(sample.means, input$stat), col = "red")
        })
    
    }
    
shinyApp(ui = ui, server = server)
