# Workout Module


# UI================================================================================================
workoutUI <- function(id) {
  ns <- NS(id)
  
  f7Tab(title="Start new workout",
        tabName="workout_tab",
        icon=f7Icon("arrowtriangle_right_fill"),
        active=TRUE,
    h4("We are on the start new workout page")
  )
}





# Server============================================================================================
workoutServer <- function(id) {
  moduleServer(id, function(input, output, session) {
  
    
    
  })
  
}





