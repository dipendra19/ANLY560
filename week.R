


setwd("/Users/dipendrabasnet/Dipendra/ANYL560/Data/")

hotel <- read.csv(file = 'hotel_bookings.csv')
# head(hotel)
# View(hotel)
# tail(hotel)
# dim(hotel)
# summary(hotel)
# str(hotel)

library(shiny)
library(shinydashboard)


ui <- fluidPage( "Histogram of hotel booking by Week",
                 
               
                 radioButtons(inputId = "month",
                              label = "Choose any Month",
                              choices = c(January = "1", February = "2",
                                          March = "3", April = "4",
                                          May = "5", June = "6",
                                          July = "7", August = "8",
                                          September = "9", October = "10",
                                          November = "11", December = "12")),
                 
                 plotOutput("hist")
                 
)


server <- function(input, output) {
  hotel <- read.csv(file = 'hotel_bookings.csv') 
  
  output$hist <- renderPlot({
    hist(hotel$arrival_date_week_number, main = "Histogram of hotel booking by week")
  }
  )
  
} 

shinyApp(ui = ui, server = server)

