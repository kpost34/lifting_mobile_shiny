# Create New Mesocycle Module


# UI================================================================================================
newMesoUI <- function(id) {
  ns <- NS(id)
  
  f7Tab(title="Create new mesocycle",
        tabName="tab3",
        icon=f7Icon("arrow_right_square_fill"),
        active=TRUE,
        hidden=TRUE,
        
    h4("We are on the start new mesocycle page."),
    f7Text(inputId=ns("txt_nm_meso"),
           label="Enter name of mesocycle"),
    
    #workout information
    f7Slider(inputId=ns("slid_n_wkouts"),
             label="Number of workouts",
             min=2,
             max=5,
             value=3),
    uiOutput(ns("ui_txt_btn_wkt_info")),

    #create sets of workout sheets
    create_workout_sheet_set(id=id)

    )
}

#there should be a table return (or a button that brings up a sheet with this info) that displays information about exercises/sets per muscle group,
  #workout, week, etc.



# Server============================================================================================
newMesoServer <- function(id) {
  moduleServer(id, function(input, output, session) {
  
    ns <- session$ns
    
    ## Dynamically create boxes for workout names
    output$ui_txt_btn_wkt_info <- renderUI({
      
      boxes <- input$slid_n_wkouts
      
      purrr::map(1:boxes, function(i) {
        tagList(
          splitLayout(cellWidths=c("75%", "25%"),
            f7Text(inputId=ns(paste0("txt_wkt", i, "_nm")), 
                   label=paste("Workout", i),
                   placeholder="Enter workout name (e.g., A, B, Upper, Pull)"),
            f7Text(inputId=ns(paste0("txt_wkt", i, "_n_ex")),
                    label="Number of exercises")
          ),
          f7Button(ns(paste0("btn_wkt", i, "_info")),
                   label="Enter exercise info",
                   size="small")
        )
      })
    })
    
    
    ## Enter workout information
    purrr::map(1:3,
      function(x) {
        observeEvent(input[[paste0("btn_wkt", x, "_info")]], {
          updateF7Sheet(
            id=paste0("sheet_wkt", x, "_1")
          )
        })
      }
    )
    
    
    ## Navigate pages
    ### Advance to more exercises
    wkt_num_vec <- rep(1:5, each=2)
    ex_group_vec <- rep(1:2, 5)

    #advance sheets
    purrr::map2(.x=wkt_num_vec, .y=ex_group_vec,
      function(x, y) {
        sheet_id <- paste0("sheet_wkt", x, "_", y)
        sheet_id_new <- paste0("sheet_wkt", x, "_", y+1)

        observeEvent(input[[paste("btn", sheet_id, "more", sep="_")]], {
          updateF7Sheet(id=sheet_id_new)
        })
      }
    )
    
    
    ### Return to previous page
    wkt_num_vec <- rep(1:5, each=2)
    ex_group_vec <- rep(2:3, 5)

    #return to previous sheet
    purrr::map2(.x=wkt_num_vec, .y=ex_group_vec,
      function(x, y) {
        sheet_id <- paste0("sheet_wkt", x, "_", y)
        sheet_id_new <- paste0("sheet_wkt", x, "_", y-1)

        observeEvent(input[[paste("btn", sheet_id, "previous", sep="_")]], {
          updateF7Sheet(id=sheet_id_new)
          updateF7Sheet(id=sheet_id)
        })
      }
    )
    
    
    
  })
}




