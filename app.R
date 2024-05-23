# Lifting Mobile Shiny App

# Packages, Conflicts, and Sourcing=================================================================
## Load packages
pacman::p_load(shiny, shinyMobile, here, tidyverse)


## Resolve conflicts


## Source files
source(here("obj_fn", "obj.R"))
source(here("obj_fn", "01_fn.R"))

source(here("modules", "00_login.R"))
source(here("modules", "01_main.R"))
source(here("modules", "02_workout.R"))
source(here("modules", "03_meso.R"))


#Currently working on
#functionalizing creation of sheets (want to create a wrapper for 3 per workout)
#need to finish above then move to server fn and how it will work with buttons advancing sheets




# App===============================================================================================
liftingApp <- function() {
  ## UI
  ui <- f7Page(
    title="Lifting Mobile App",
    f7TabLayout(
      navbar=f7Navbar(
        title="Lifting Mobile Shiny App"
      ),
      f7Tabs(id="tabs",
      #login
      loginUI("tab0"),
      
      # #main menu
      mainUI("tab1"),
      # 
      # #new workout
      workoutUI("tab2"),
      # 
      # #new meso
      mesoUI("tab3")
      )
    )
  )
  
  ## Server
  server <- function(input, output, session) {

    #login
    tab0val <- loginServer("tab0")
    
    #main menu
    mainServer("tab1")
    
    
    observeEvent(tab0val(), {
      updateF7Tabs(id='tabs', selected='tab1')
    },ignoreInit=TRUE)
    
    # #new workout
    workoutServer("tab2")

    #new meso
    mesoServer("tab3")
    
  }
  
  shinyApp(ui, server)
}


liftingApp()





