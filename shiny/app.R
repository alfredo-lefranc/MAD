#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


# Correr imports.R antes de correr la app

instalar <- function(paquete) {
    
    if (!require(paquete,character.only = TRUE, quietly = TRUE, warn.conflicts = FALSE)) {
        install.packages(as.character(paquete), dependecies = TRUE, repos = "http://cran.us.r-project.org")
        library(paquete, character.only = TRUE, quietly = TRUE, warn.conflicts = FALSE)
    }
}

paquetes <- c("shiny","plotly","ggplot2")

lapply(paquetes, instalar);

# Define UI for application that draws a histogram
ui <- fluidPage(
    
    # Application title
    titlePanel("1985 Auto Imports Database"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            conditionalPanel(condition = "input.tabs == 'Histograma'",
                             selectInput("nombre1", "Caracteristica", names(imp_num))),
            conditionalPanel(condition = "input.tabs == 'Boxplot' | input.tabs == 'Summary'",
                             selectInput("nombre", "Caracteristica", names(imp_num))),
            conditionalPanel(condition = "input.tabs == 'Scatterplot'",
                             selectInput("ejey", "Variable 1", names(imp_num)),
                             selectInput("ejex", "Variable 2", names(imp_num))),
            conditionalPanel(condition = "input.tabs == 'Barras'",
                             selectInput("relleno","Categorica",names(imp_fac)))
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            tabsetPanel(type = "tabs", id="tabs",
                        tabPanel("Histograma", plotlyOutput("distPlot")),
                        tabPanel("Summary", verbatimTextOutput("summary")),
                        tabPanel("Boxplot", plotlyOutput("boxplot")),
                        tabPanel("Scatterplot", plotOutput("scatter")),
                        tabPanel("Barras", plotOutput("barchart"))
            )
        )        
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    # Histograma
    output$distPlot <- renderPlotly({
        #input variable
        variable <- input$nombre1
        
        # draw the histogram
        p <-ggplot(imp_num)+
            geom_histogram(mapping=aes_string(variable))
        
        ggplotly(p)
    })
    
    # Summary of the data
    output$summary <- renderPrint({
        summary(imp_num[input$nombre])
    })
    
    # Boxplot
    output$boxplot <- renderPlotly({
        variable <- input$nombre
        
        p <-ggplot(imp_num)+
            geom_boxplot(mapping=aes_string(y=variable))
        
        ggplotly(p)
    })
    
    # Scatterplot
    output$scatter <- renderPlot({
        vary <- input$ejey
        varx <- input$ejex
        
        ggplot(imp_num, aes_string(vary, varx)) +
            geom_point() +
            geom_smooth(method=lm, se=FALSE)
    })
    
    # Bar chart para la marca
    output$barchart <- renderPlot({
        var_relleno <- input$relleno
        
        
        ggplot(imp_fac, aes_string(var_relleno)) +
            geom_bar(fill="blue") +
            theme(axis.text.x=element_text(angle=90,hjust=1))
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)
