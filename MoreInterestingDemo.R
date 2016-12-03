## Something a little more real
## Plot of supercomputer data
##
## Download data from web
## 


## GET REQUIRED PACKAGES

    required.packages <- c(
        "shiny",
        "RCurl",
        "tidyverse",
        "stringr",
        "devtools", 
        "yo"
    )
    
    for (x in required.packages) {
        if (length(find.package(x)) == 0){ 
            if (x == "yo") {
                devtools::install_github("ww44ss/yo") 
            } else {
                install.packages(x)
            }
        }
        library(x, character.only = TRUE)
    }


## GET DATA 
    ## read a file with 10 years of supercomputer data
    
    ## define column types
    cols.sc <- c("i", "i", "i", "i", "c", "c", "c",
                 "c", "c", "i", "c", "i", "i", "d", 
                 "d", "d", "d", "d", "c", "d", "c", 
                 "c", "c", "d", "c", "c", "c", "i", 
                 "c", "c", "c", "c", "c", "c", "c", 
                 "D", "i", "d", "d" )
    sc.col.types <- str_c(cols.sc, collapse = "")
    
    url <- "https://raw.githubusercontent.com/ww44ss/HPC_Exascalar/master/results/BigExascalar.csv"
    
    supercomputer <- read_csv(url, col_names = TRUE, col_types = sc.col.types)

## SHINY FUNCTIONS    

ui <- fluidPage(
    # Application title
    titlePanel("Top Ranked Super Computers"),
    
    sidebarLayout(
        # Sidebar with a slider and selection inputs
        sidebarPanel(selectInput("value", "Value:", 
                                choices=c("rmax", "power", "mflopsperwatt", "processorspeed.mhz","corespersocket")),
        
                     
                    selectInput("date", "Date", 
                                choices=unique(supercomputer$list.date)),
                                  
                     
        hr(),
        helpText("Data from Top500.org")
            
        ),
        
        # plot
        mainPanel(
            plotOutput("plot")
        )
    )
)



server <- function(input, output) {
    # Define a reactive expression for the document term matrix
    
    output$text <- renderPrint(input$value)
    
    
    output$plot <- renderPlot({
        
        plot_data <- 
            supercomputer %>% 
            filter(list.date == input$date) %>%
            #select(input$value) %>%
            yo
        
        c("rmax", "power", "mflopsperwatt", "processorspeed.mhz","corespersocket", "Exascalar")
        
        if (input$value == "rmax") {plot_data <- plot_data %>% select(rank, "y.dat" = rmax)
            title.text = "Supercomputer Performance (mflops)"}
        if (input$value == "power") {plot_data <- plot_data %>% select(rank, "y.dat" = green500power)
            title.text = "Supercomputer Power (kWatt)"}
        if (input$value == "mflopsperwatt") {plot_data <- plot_data %>% select(rank, "y.dat" = mflopsperwatt)
            title.text = "Supercomputer Efficiency (mflops per Watt)"}
        if (input$value == "processorspeed.mhz") {plot_data <- plot_data %>% select(rank, "y.dat" = processorspeed.mhz)
            title.text = "Supercomputer Processor Speed (MHz)"}
        if (input$value == "corespersocket") {plot_data <- plot_data %>% select(rank, "y.dat" = corespersocket)
            title.text = "Supercomputer Processor Cores (Cores per Socket)"}
        if (input$value == "Exascalar") {plot_data <- plot_data %>% select(rank, "y.dat" = Exascalar)
        title.text = "Supercomputer Exascalar"}
        
        
        p <- 
            ggplot(plot_data, aes(x = rank, y = y.dat) ) + 
            geom_point( size = 2, color = "#7321A3") + 
            coord_trans(y = "log10") +
            labs(y = input$value, title = title.text, subtitle = input$date) +
            theme(axis.text=element_text(size=14),
                  axis.title=element_text(size=16,face="bold"),
                  title=element_text(size=18,face="bold", color = "#333333")) 
            
        
        
        print(p) 
    })
}

shinyApp(ui = ui, server = server)