# Lifting Mobile Shiny App

# Packages, Conflicts, and Sourcing=================================================================
## Load packages
pacman::p_load(shiny, shinyMobile, here, tidyverse, DT)


## Source files
source(here("obj_fn", "0_obj.R"))
source(here("obj_fn", "0_fn.R"))

source(here("modules", "00_login.R"))
source(here("modules", "01_main.R"))
source(here("modules", "02_workout.R"))
source(here("modules", "03_newMeso.R"))
source(here("modules", "04_updateMeso.R"))

#Currently working on
#1) new workout page
  #build out sheet that match the dummy data sets
#2) develop the newMeso and updateMeso pages
  #for updateMeso, considere editable DT that can be saved
#3) develop the login page 
  #1. when "yes" is toggled for returning user then a password box should be created
  #2. min 5 chr message should be returned if insufficient
  #3. toast notification comes up if successfully created username or entered password
#4) need to add 'back'/'return' buttons to go back to main menu


# Working on....
#1) Grabbing data from editable workout table


 
# App===============================================================================================
liftingApp <- function() {
  ## UI
  ui <- f7Page(
    tags$style(HTML("
        /* Ensure the DataTables search bar has white text */
        .dataTables_wrapper .dataTables_filter input {
          color: #ffffff; /* White text color for the search box */
          background-color: #333333; /* Dark background for the search box */
          border: 1px solid #444444; /* Optional: Border color for the search box */
        }
    
        .dataTables_wrapper .dataTables_filter label {
          color: #ffffff; /* White text color for the 'Search:' label */
        }
    
        /* Ensure the DataTables headers have white text */
        table.dataTable thead th {
          color: #ffffff; /* White text color for headers */
          background-color: #333333; /* Dark background color for headers */
        }
    
        /* Optional: Ensure the DataTables pagination buttons also have white text */
        .dataTables_wrapper .dataTables_paginate .paginate_button {
          color: #ffffff; /* White text color for pagination buttons */
          background-color: #333333; /* Dark background color for pagination buttons */
          border: 1px solid #444444; /* Optional: Border color for pagination buttons */
        }
    
        .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
          background-color: #555555; /* Darker background on hover */
          color: #ffffff; /* White text color on hover */
        }
      ")),
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





