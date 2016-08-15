# Coursera - Developing Data Products- Course Project

# server.R file for the shiny app

# This app was developed to help people choose the best car for their trip, 
# using mtcars dataset, from [R]

library(shiny)
library(datasets)
library(dplyr)

shinyServer(function(input, output) {
  
  # Show the cars that correspond to the filters
  output$table <- renderDataTable({
    hp_seq <- seq(from = input$hp[1], to = input$hp[2], by = 1)
    data <- transmute(mtcars, Car = rownames(mtcars), MilesPerGallon = mpg, 
                      GasolineExpenditure = input$dis/mpg*input$cost,
                      Cylinders = cyl,  Horsepower = hp, 
                      Transmission = am)
    data <- filter(data, GasolineExpenditure <= input$gas, Cylinders %in% input$cyl, 
                   Horsepower %in% hp_seq, Transmission %in% input$am)
    data <- mutate(data, Transmission = ifelse(Transmission==0, "Automatic", "Manual"))
    data <- arrange(data, GasolineExpenditure)
  }, options = list(lengthMenu = c(5, 15, 30), pageLength = 30))
})