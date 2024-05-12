# Main Module


# UI================================================================================================
mainUI <- function(id) {
  ns <- NS(id)
  
  #main page
  f7Tab(title="Lifting Mobile App",
        tabName="tab1",
        hidden=TRUE,
        active=FALSE,
    h4("We are now on the main page.")
  )
  
}


# Server============================================================================================
mainServer <- function(id) {
  moduleServer(id, function(input, output, session) {
  
    # ns <- session$ns 
  
  })
  
}










