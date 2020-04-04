
setwd("/Users/dipendrabasnet/Dipendra/ANYL560/Data/")

hotel1 <- read.csv(file = 'hotel_bookings2.csv')
# head(hotel1)
# View(hotel1)
# tail(hotel1)
# dim(hotel1)
# summary(hotel1)
# str(hotel1)

library(shiny)
library(shinydashboard)

ui <- fluidPage( "Peak Month of the Year",
                 
                 radioButtons(inputId = "Id",
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
  hotel1 <- read.csv(file = 'hotel_bookings2.csv') 
  
  output$hist <- renderPlot({
    hist(hotel1$arrival_date_month, main = "Histogram of hotel1 booking by Month")
  }
  )
  
} 

shinyApp(ui = ui, server = server)

