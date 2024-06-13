# Lifting Mobile Shiny App

# Packages, Conflicts, and Sourcing=================================================================
## Load packages
pacman::p_load(shiny, shinyMobile, here, tidyverse)


## Source files
source(here("obj_fn", "obj.R"))
source(here("obj_fn", "01_fn.R"))

source(here("modules", "00_login.R"))
source(here("modules", "01_main.R"))
source(here("modules", "02_workout.R"))
source(here("modules", "03_newMeso.R"))
source(here("modules", "04_updateMeso.R"))

#Completed:
#1) Created dummy data sets and plan for how they interact
#2) Updated create_workout_sheet() which includes bar type selector and updates sets to selector

#Currently working on
#1) build out pages that match the dummy data sets
#2) develop the newMeso and updateMeso pages
#3) develop the login page 
  #1. when "yes" is toggled for returning user then a password box should be created
  #2. min 5 chr message should be returned if insufficient
  #3. toast notification comes up if successfully created username or entered password




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
      
      #main menu
      mainUI("tab1"),
      
      #new workout
      workoutUI("tab2"),
      
      #new meso
      newMesoUI("tab3"),
      
      #update meso
      updateMesoUI("tab4")
      )
    )
  )
  
  ## Server
  server <- function(input, output, session) {
    ### Modules
    #login
    tab0val <- loginServer("tab0")
    
    #main menu
    main_out <- mainServer("tab1")
    
    #new workout
    workoutServer("tab2")

    #new meso
    newMesoServer("tab3")
    
    #update meso
    updateMesoServer("tab4")
    
    
    ### Transitions
    #login -> main
    observeEvent(tab0val(), {
      updateF7Tabs(id='tabs', selected='tab1')
    }, ignoreInit=TRUE)
    
    
    #main -> new workout
    observeEvent(main_out$start_wkt(), {
      updateF7Tabs(id='tabs', selected='tab2')
    }, ignoreInit=TRUE)
    
    #main -> new meso
    observeEvent(main_out$create_meso(), {
      updateF7Tabs(id='tabs', selected='tab3')
    }, ignoreInit=TRUE)
    
    
    #main -> update meso
    observeEvent(main_out$update_meso(), {
      updateF7Tabs(id='tabs', selected='tab4')
    }, ignoreInit=TRUE)
  }
  
  shinyApp(ui, server)
}


liftingApp()





