# Update Mesocycle Module


# UI================================================================================================
updateMesoUI <- function(id) {
  ns <- NS(id)
  
  f7Tab(title="Update mesocycle",
        tabName="tab4",
        icon=f7Icon("arrow_right_square_fill"),
        active=TRUE,
        hidden=TRUE,
  
  h4("Please select a mesocycle"),
  
  uiOutput(outputId="ui_btn_mesos")
  
  )
  
}


# Server============================================================================================
updateMesoServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    ns <- session$ns
    
    
    
    
  })
}
