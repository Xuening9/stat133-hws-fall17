##===========================================================

#title: gradevis
#description: create a shiny app that allows you to visualize
#             the grades from different perspectives
# Author: Xuening Hu
# Date: 11-26-2017
#===========================================================

# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(readr)
library(ggvis)
library(dplyr)

setwd("/Users/Xuening/stat133/stat133-hws-fall17/hw04/app")
source("../code/functions.R")
# input data.score
data.score <- read_csv("../data/cleandata/cleanscores.csv")
assignments <- colnames(data.score) 

# generate the table for tab1
Grade <- c("A+", "A", "A-", "B+", "B", "B-", "C+", "C", "C-", "D", "F")
Freq <- rep(0, length(Grade))
for (i in 1:length(Grade)) {
  Freq[i] <- length(which(data.score[,"Grade"] == Grade[i]))
}
Prop <- rep(0, length(Grade))
for (i in 1:length(Grade)) {
  Prop[i] <- round(Freq[i]/sum(Freq), digits = 2)
}
tab1_data <- data.frame(Grade, Freq, Prop)



# Define UI for application
ui <- fluidPage(
  
  # Application title
  titlePanel("Grade Visualizer"),
  
  # siderbar
  sidebarLayout(
    sidebarPanel(
      # tab1
      conditionalPanel(condition = "input.tabselected==1",
                       tableOutput('table')),
      # tab2
      conditionalPanel(condition = "input.tabselected==2",
                       selectInput("var2", label = "X-axis variable", 
                                   assignments,
                                   selected = "HW1"),
                       sliderInput("width", label = "Bin Width", 
                                   min = 1, max = 10, value = 10)
      ),
      # tab3
      conditionalPanel(condition = "input.tabselected==3",
                       selectInput("var3.1", label = "X-axis variable", 
                                   assignments,
                                   selected = "Test1"),
                       selectInput("var3.2", label = "Y-axis variable", 
                                   assignments,
                                   selected = "Overall"),
                       sliderInput("opacity", label = "Opacity",
                                   min = 0, max = 1, value = 0.5),
                       radioButtons("radio", label = "Show line",
                                    choices = list("none", "lm", "loess"), 
                                    selected = "lm")
      )
    ),
    # mainPanel  
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Barchart", value = 1,
                           ggvisOutput("barchart")),
                  tabPanel("Histogram", value = 2,
                           ggvisOutput("histogram"),
                           htmlOutput("summary")),
                  tabPanel("Scatterplot", value = 3,
                           ggvisOutput("scatterplot")
                  ),
                  id = "tabselected")
    )
  )
)



# Define server logic 
server <- function(input, output) {
  
  # Barchart for tab1
  
  tab1_barchart <- tab1_data %>%
    ggvis(~Grade, ~Freq) %>% 
    layer_bars() %>%
    add_axis("y", title = "frequency")
  
  output$table <- renderTable(tab1_data)
  tab1_barchart %>% bind_shiny("barchart")
  
  # Histogram for tab2
  tab2_histogram <- reactive({
    var2 <- prop("x", as.symbol(input$var2))
    data.score %>%
      ggvis(x = var2) %>%
      layer_histograms(width = input$width)
  })
  
  tab2_histogram %>% bind_shiny("histogram")
  
  output$summary <- renderPrint({
    var2 <- prop("x", as.symbol(input$var2))
    print_stats(unlist(data.score[,input$var2]))})
  
  # Scatterplot for tab3
  tab3_scatterplot <- reactive({
    if (input$radio != 'none') {
      var3.1 <- prop("x", as.symbol(input$var3.1))
      var3.2 <- prop("y", as.symbol(input$var3.2))
      data.score %>%
        ggvis(x = var3.1, y = var3.2) %>%
        layer_model_predictions(model = input$radio) %>%
        layer_points(fillOpacity := input$opacity) }
    else {
      var3.1 <- prop("x", as.symbol(input$var3.1))
      var3.2 <- prop("y", as.symbol(input$var3.2))
      data.score %>%
        ggvis(x = var3.1, y = var3.2) %>%
        layer_points(fillOpacity := input$opacity) 
    }
  })
  
  tab3_scatterplot %>% bind_shiny("scatterplot")
}

# Run the application 
shinyApp(ui = ui, server = server)

