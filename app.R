# Lifting Mobile Shiny App

# Packages, Conflicts, and Sourcing=================================================================
## Load packages
pacman::p_load(shiny, shinyMobile, here, tidyverse)


## Resolve conflicts


## Source files
source(here("modules", "01_main.R"))


# App===============================================================================================
liftingApp <- function() {
  ## UI
  ui <- f7Page(
    title="Lifting Mobile App",
    f7TabLayout(
      navbar=f7Navbar(
        title="Tab layout title"
      ),
      #login
      loginUI("user"),
      
      # #main menu
      # mainUI("main"),
      # 
      # #new workout
      workoutUI("lift")
      # 
      # #new meso
      # mesoUI("prog")
    )
  )
  
  ## Server
  server <- function(input, output, session) {

    #login
    loginServer("user")
    
    # #main menu
    # mainServer("main")
    # 
    # #new workout
    # workoutServer("lift")
    # 
    # #new meso
    # mesoServer("prog")
    
  }
  
  shinyApp(ui, server)
}


liftingApp()





