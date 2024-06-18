# Workout Module


# UI================================================================================================
workoutUI <- function(id) {
  ns <- NS(id)
  
  f7Tab(title="Start new workout",
        tabName="tab2",
        icon=f7Icon("arrowtriangle_right_fill"),
        active=TRUE,
        hidden=TRUE,
    h4("We are on the start new workout page"),
    f7Radio(inputId=ns("rad_meso"),
            label="Choose your mesocycle",
            choices=NULL),
    f7Radio(inputId=ns("rad_wkt"),
            label="Choose your workout",
            choices=NULL)
  )
}





# Server============================================================================================
workoutServer <- function(id) {
  moduleServer(id, function(input, output, session) {
  
     #pull in dummy data...but when app is connected to Google sheets, it will pull in data another way
    # source(here("obj_fn", "obj.R"), local=TRUE)
  
    ns <- session$ns
    
    ## Update inputs
    #mesocycle
    observe({
      updateF7Radio(session=session,
                    inputId="rad_meso",
                    choices=c("A", "B", "C", "D", "E"),
                    selected=NULL)
    })
    
    #workout
    observeEvent(input$rad_meso, {
      #conditional extraction
      ch_wkt <- switch(input$rad_meso,
        "A" = 1,
        "B" = 1:2,
        "C" = 1:3,
        "D" = c("A", "B"),
        "E" = c("A", "B"))
      
      
      updateF7Radio(session=session,
                    inputId="rad_wkt",
                    choices=ch_wkt)
    }, ignoreInit=TRUE)
    
  })
}





