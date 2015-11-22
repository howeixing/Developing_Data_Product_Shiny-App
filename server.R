library(shiny)

shinyServer(function(input, output) {
  
  values <- reactiveValues()
  
  observe(
    {
      input$Calculate_Input_Value
      values$bmi <- isolate({
        input$weight_value/(input$height_value * input$height_value * 0.0001)
      })
    })
  
  #Output User Input Value
  output$text_height <- renderText({
    input$Calculate_Input_Value
    paste("Height [in CM] :", isolate(input$height_value))
  })
  
  output$text_weight <- renderText({
    input$Calculate_Input_Value
    paste("Weight [in KG] : ", isolate(input$weight_value))
  })
  
  #Output Calculated values
  
  output$text_BMI <- renderText({
    if(input$Calculate_Input_Value == 0) ""
    else
      
      paste("BMI is (Metric):", values$bmi)
  })
  
  
  output$text_status<-renderText({
    
    
    if (values$bmi <  15.0) info = "<span style='color: red'>Very severely underweight</span>"
    else if (values$bmi <= 16.0) info = "<span style='color: red'>Severely underweight</span>"
    else if (values$bmi <= 18.5) info = "<span style='color: orange'>Underweight</span>"
    else if (values$bmi <= 25.0) info = "<span style='color: green'>Normal (healthy weight)</span>"
    else if (values$bmi <= 30.0) info = "<span style='color: orange'>Overweight</span>"
    else if (values$bmi <= 35.0) info = "<span style='color: red'>Obese Class I (Moderately obese)</span>"
    else if (values$bmi <= 40.0) info = "<span style='color: red'>Obese Class II (Severely obese)</span>"
    else                  info = "<span style='color: red'>Obese Class III (Very severely obese)</span>"
    
  })
  
  output$bmi_reference <- renderTable({
    ref <- data.frame(
      c(
        'Underweight',
        'Normal Weight',
        'Overweight',
        'Obese'
      ),
      c(
        '< 18.50',
        '18.50 - 24.99',
        '>= 25',
        '>= 30'
      )
    )
    colnames(ref) <- c('BMI Description', 'Measurement Range')
    
    ref
    
  })
  
  
  
})




