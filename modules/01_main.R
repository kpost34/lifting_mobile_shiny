# Main Module


# UI================================================================================================
mainUI <- function(id) {
  ns <- NS(id)
  
  #main page
  f7Tab(title="Lifting Mobile App",
        tabName="tab1",
        hidden=TRUE,
        active=FALSE,
  #placeholder for returning a welcome message "Hello, [userID]"
  # verbatimTextOutput(ns("out_txt"))
  h4("What would you like to do today?"),
  #set of buttons
  f7Button(inputId=ns("btn_start_wkt"), 
           label="Start new workout"),
  br(),
  f7Button(inputId=ns("btn_update_meso"),
           label="Update mesocycle"),
  br(),
  f7Button(inputId=ns("btn_create_meso"),
           label="Create mesocycle")
  )
  
}


# Server============================================================================================
mainServer <- function(id) {
  moduleServer(id, function(input, output, session) {
  
    # ns <- session$ns 
    
    #create set of reactiveValues
    retVal <- reactiveValues(count_start_wkt=0,
                             count_update_meso=0,
                             count_create_meso=0)
    
    #create OEs associated with buttons
    observeEvent(input$btn_start_wkt, {
      retVal$count_start_wkt <- retVal$count_start_wkt + 1
    })
    
    observeEvent(input$btn_update_meso, {
      retVal$count_update_meso <- retVal$count_update_meso + 1
    })
    
    observeEvent(input$btn_create_meso, {
      retVal$count_create_meso <- retVal$count_create_meso + 1
    })
    

    return(
      list(
        start_wkt = reactive(retVal$count_start_wkt),
        update_meso = reactive(retVal$count_update_meso),
        create_meso = reactive(retVal$count_create_meso)
      )
    )
    
    
  
  })
  
}










