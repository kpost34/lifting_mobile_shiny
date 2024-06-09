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
    f7Select(inputId=ns("sel_wkt"),
             label="Choose your workout",
             choices=NULL)
  )
}





# Server============================================================================================
workoutServer <- function(id) {
  moduleServer(id, function(input, output, session) {
  
    auto_update <- reactiveVal(NULL)
    
    
    # observeEvent(tabName=="tab2", {
    #   updatef7Select(inputId="sel_wkt",
    #                  choices=c("A", "B", "C")
    #   )
    # })
  })
}





