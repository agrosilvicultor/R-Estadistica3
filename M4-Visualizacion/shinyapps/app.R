#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/

library(shiny)
datos <- matrix(c(1950,1962,1974,1982,1990,2001,2010,
                  4564,4468,4591,5193,5898,11699,16403,
                  1584,1805,1842,2023,2125,3276,3986,
                  2135,2480,2978,2921,3004,3912,4624,
                  1944,1525,1710,1653,1459,1587,1985,
                  1841,2176,2315,2942,3232,5120,6174), 
                  nrow = 7, ncol = 6)
colnames(datos)<-c("  ","Tabacundo","La Esperanza","Malchingui","Tocachi","Tupigachi")


# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Poblacion cantonal"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         selectInput("parroquia","Parroquia:",
                     choices = colnames(datos)),
         hr(),
         helpText("Datos de Pedro Moncayo (INEC 2010)")
      ),
      
      # Create a spot for the barplot
      mainPanel(
         plotOutput("poblacionPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
  # Fill in the spot we created for a plot
   output$poblacionPlot <- renderPlot({
      barplot(datos[  ,input$parroquia],
              col= c('gray90','gray80','gray70','gray60','gray50','gray40','gray30'),
              main = input$parroquia,
              ylab = "Numero de personas",
              xlab = "Años",
              names.arg = c("1950","1962","1974","1982","1990","2001", "2010")
              )
         })
}

# Run the application 
shinyApp(ui = ui, server = server)

