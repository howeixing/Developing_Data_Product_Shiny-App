library(shiny)
shinyUI(fluidPage(
  titlePanel("Health Care Application: Body Mass Index (BMI) Calculator"),
  
  sidebarLayout(
    sidebarPanel( 
      
      helpText("The purpose of this application is to calculate Body Mass Index (BMI) to monitor your health."),            
      br(),           
      numericInput("height_value",label = h5("Please enter your height (in cm)"),min = 5, max = 500,0), #,value = 150
      br(),
      numericInput("weight_value",label = h5("Please enter your weight (in KG)"),min = 5, max = 500,0), #, value = 50
      br(),
      
      br(),   
      actionButton("Calculate_Input_Value", label = "Start Calculation on BMI")    
      
      
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("BMI Calculator",
                 p(h4("Your Entered Values:")),
                 textOutput("text_height"),
                 textOutput("text_weight"),
                 br(),
                 wellPanel(
                   tags$style(
                     ".shiny-output-error { visibility: hidden; }",
                     ".shiny-output-error:before { visibility: hidden; }"),
                   
                   p(h4("BMI Result:")),
                   br(),
                   textOutput("text_BMI"),
                   p(h4("Your BMI status is:")),
                   uiOutput("text_status")),
                 
                 wellPanel(tableOutput('bmi_reference'))  
        ),
        tabPanel(
          "Reference Documentation",
          p(h4("BMI Calculator Functionality:")),
          helpText("This application is used to calculate BMI through the given height and weight in order to monitor health condition of the user based on BMI . The application users are required to fill up their latest height and weight. The application will calculate the user's BMI value and shows the user's BMI status."),
          br(),
          p(h4("Body Mass Index (BMI) Concept:")),
          helpText("Body mass index (BMI) is a measure of body fat based on your weight in relation to your height, and applies to most adult men and women aged 20 and over. For children aged 2 and over, BMI percentile is the best assessment of body fat."),
          br(),
          helpText("BMI does not measure body fat directly. However, research indicates that BMI correlates to direct measures of body fat such as underwater weighing and dual-energy X-ray absorptiometry (DXA), and is considered an inexpensive and easy-to-perform alternative for these."),
          br(),
          helpText("So, BMI is always used as a screening tool to indicate whether a person is underweight, overweight, obese or a healthy weight for their height."),
          HTML("<u><b>Equation For BMI Calculation: </b></u>
               <br> <br>
               <b> BMI = Weight /([Height] * [Height])</b>
               ") 
          
          )
        
        )
      
        )
    )
    ))
