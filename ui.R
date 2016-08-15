# Coursera - Developing Data Products- Course Project

# ui.R file for the shiny app

# This app was developed to help people choose the best car for their trip, using mtcars dataset, from [R] 

library(markdown)

shinyUI(navbarPage("Select the best car for your trip",
                   tabPanel("Table",
                            
                            # Sidebar
                            sidebarLayout(
                              sidebarPanel(
                                helpText("Please enter information about your trip and the parameters of your car"),
                                numericInput('dis', 'Distance (in miles):', 25, min = 1, max = 500),
                                numericInput('cost', 'Gasoline Price (per gallon):',2.0 , min = 1.5, max = 3.5, step=0.01),
                                numericInput('gas', 'Maximum expenditure on gasoline:', 100, min=1, max=2500),
                                checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6), selected = c(4,6)),
                                sliderInput('hp', 'Gross horsepower', min=10, max=400, value=c(10,400), step=10),
                                checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0,1))
                              ),
                              
                              
                              mainPanel(
                                dataTableOutput('table')
                              )
                            )
                   )
)
)   