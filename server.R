library(shiny)
library(lubridate)

shinyServer(function(input, output) {
  
  dispName <- eventReactive(input$submit, {
      validate(
          need(input$name != "", "Please enter a name!")
      )
      paste("Hi ", input$name)
  })
  
  output$dispName <- renderText({
      dispName()
  })
  
  dispAge <- eventReactive(input$submit, {
      age <- as.period(interval(start = input$dob, end = Sys.Date()))$year
      paste("Your age is ", age)
  })
  
  output$dispAge <- renderText({
      dispAge()
  })
  
  dispDay <- eventReactive(input$submit, {
      day <- weekdays(input$dob)
      paste("You were born on ", day)
  })
  
  output$dispDay <- renderText({
      dispDay()
  })
  
  dispBMI <- eventReactive(input$submit, {
      bmi <- input$weight / ((input$height / 100) ^ 2)
      paste("Your BMI is ", round(bmi, digits = 2))
  })
  
  output$dispBMI <- renderText({
      dispBMI()
  })
  
  output$bmiChart <- renderImage({
      return(list(
          src = "bmi-chart.png",
          contentType = "image/png",
          alt = "BMI Chart"
      ))
  }, deleteFile = FALSE)
  
})
