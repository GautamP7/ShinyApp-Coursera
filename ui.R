library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Bio"),
  
    fluidRow(
      column(3,
        textInput("name", "Name:"),
        dateInput("dob", "Date of Birth:", format = "dd/mm/yyyy", max = Sys.Date(), min = as.Date("1900-01-01")),
        numericInput("height", "Height (cm):", value = 0, min = 0, max = 250),
        numericInput("weight", "Weight (kg):", value = 0, min = 0, max = 1000),
        actionButton("submit", "Submit")
      ),
      column(3, offset = 4,
        h3("BMI chart")
      ),
      column(3,
        imageOutput("bmiChart", height = "12px")
      )
    ),
  
  mainPanel(
    fluidRow(
        column(10, offset = 7,
               h3("Documentation: Fill in all the fields and click on submit. Check your BMI against the chart.")
        )    
    ),
    fluidRow(
      textOutput("dispName"),
      br(),
      textOutput("dispAge"),
      br(),
      textOutput("dispDay"),
      br(),
      textOutput("dispBMI")
    )
  )
))
