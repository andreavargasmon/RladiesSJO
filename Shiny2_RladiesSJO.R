# PART 1 - Load Libraries
library(shiny)

# PART 2 - Define User Interface for application
ui <- fluidPage(
  
  # Application title
  titlePanel("Distribuciones"),
  
  # Sidebar with user input elements
  sidebarLayout(
    sidebarPanel(
      
      # Input Elements here, e.g.
      
      # - sliders, checkboxes
      # - Radio buttons, text input
      # - etc.
      
      radioButtons(inputId = "distribucion", label = "Seleccione la distribucion de la poblacion:",
                   choices = c("Normal Estandar", "Chi Cuadrado" , "Uniforme", "Poisson")),
      
      sliderInput(inputId = "n", label = "Seleccione n:", min=1, max= 1000, value=100, step=1),
      
      selectInput(inputId = "colores", label = "Seleccione el color:",
                  choices = c("blue", "yellow", "red", "green")),
      
      actionButton(inputId = "actualizar", label = "Actualizar")
    ),
    
    # Show a plot
    mainPanel(
      plotOutput("distPlot"),
      tableOutput("values")
    )
  )
)

# PART 3 - Define server logic required to run calculations and draw plots
server <- function(input, output) {
  
  datos = eventReactive(input$actualizar,
               if(input$distribucion == "Normal Estandar")rnorm(input$n, 0, 1)
               else if(input$distribucion == "Chi Cuadrado")rchisq(input$n,5)
               else if(input$distribucion == "Uniforme")runif(input$n,0,20)
               else if(input$distribucion == "Poisson")rpois(input$n,4)
  )
  
  
  sliderValues <- reactive({
    data.frame(
      Valores = c("Media",
                  "Mediana",
                  "Variancia"),
      Valor = c(mean(datos()),
                median(datos()),
                var(datos()))
    )
  }) 
  
  
  output$distPlot <- renderPlot({
    hist(datos(), col = input$colores)
    
  })
  
  output$values <- renderTable({
    sliderValues()
  })
}

# PART 4 - Run the application 
shinyApp(ui = ui, server = server)
