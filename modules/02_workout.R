# Workout Module


# UI================================================================================================
workoutUI <- function(id) {
  ns <- NS(id)
  
  f7Tab(title="Start new workout",
        tabName="tab2",
        icon=f7Icon("arrowtriangle_right_fill"),
        active=TRUE,
        hidden=TRUE,
    h3("Start New Workout"),
    uiOutput(outputId=ns("ui_rad_meso")),
    uiOutput(outputId=ns("ui_rad_wkt"))
  )
}





# Server============================================================================================
workoutServer <- function(id) {
  moduleServer(id, function(input, output, session) {
  
     #pull in dummy data...but when app is connected to Google sheets, it will pull in data another way
    # source(here("obj_fn", "obj.R"), local=TRUE)
  
    ns <- session$ns
    
    ## Update inputs
    ### Mesocycle
    observe({
      print("Updating mesocycle choices")
      output$ui_rad_meso <- renderUI({
        f7Radio(inputId=ns("rad_meso"),
                label="Choose your mesocycle",
                choices=extract_mesos(df_keith22))
      })
    })
    
    
    ### Workouts
    observeEvent(input$rad_meso, {
      
      output$ui_rad_wkt <- renderUI({
      
        print(paste("Rendering workout choices for mesocycle:", input$rad_meso))
       
        f7Radio(inputId=ns("rad_wkt"),
                label="Select your workout",
                choices=extract_wkts(df_keith22, input$rad_meso))
      })
    })
 })
    
}





