# Lifting Mobile Shiny App

# Packages, Conflicts, and Sourcing=================================================================
## Load packages
pacman::p_load(shiny, shinyMobile, here, tidyverse)


## Resolve conflicts


## Source files
source(here("modules", "00_login.R"))
source(here("modules", "01_main.R"))
source(here("modules", "02_workout.R"))


# App===============================================================================================
liftingApp <- function() {
  ## UI
  ui <- f7Page(
    title="Lifting Mobile App",
    f7TabLayout(
      navbar=f7Navbar(
        title="Tab layout title"
      ),
      f7Tabs(id="tabs",
      #login
      loginUI("tab0"),
      
      # #main menu
      mainUI("tab1"),
      # 
      # #new workout
      workoutUI("tab2")
      # 
      # #new meso
      # mesoUI("prog")
      )
    )
  )
  
  ## Server
  server <- function(input, output, session) {

    #login
    tab0val <-loginServer("tab0")
    
    #main menu
    mainServer("tab1")
    
    
    observeEvent(tab0val(), {
      updateF7Tabs(id='tabs', selected='tab1')
    },ignoreInit=TRUE)
    
    # #new workout
    workoutServer("lift")
    # 
    # #new meso
    # mesoServer("prog")
    
  }
  
  shinyApp(ui, server)
}


liftingApp()





