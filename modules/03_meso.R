# Mesocycle Module


# UI================================================================================================
mesoUI <- function(id) {
  ns <- NS(id)
  
  f7Tab(title="Start new mesocycle",
        tabName="meso_tab",
        icon=f7Icon("arrow_right_square_fill"),
        active=TRUE,
        
    h4("We are on the start new mesocycle page."),
    
    #workout information
    f7Slider(inputId=ns("slid_n_wkouts"),
             label="Number of workouts",
             min=2,
             max=5,
             value=3),
    uiOutput(ns("ui_txt_nm_wkouts")),
    
    #specific workout info
    
  )

}





# Server============================================================================================
mesoServer <- function(id) {
  moduleServer(id, function(input, output, session) {
  
    ns <- session$ns
    
    #dynamically create boxes for workout names
    output$ui_txt_nm_wkouts <- renderUI({
      
      boxes <- input$slid_n_wkouts
      
      purrr::map(1:boxes, function(i) {
        f7Text(inputId=ns(paste0("txt_wkout_", i)), 
               label=paste("Workout", i))
      })
      
    })
      
    })

}




