# Workout Module


# UI================================================================================================
workoutUI <- function(id) {
  ns <- NS(id)
  
  f7Tab(title="Start new workout",
        tabName="tab2",
        icon=f7Icon("arrowtriangle_right_fill"),
        active=TRUE,
        hidden=TRUE,
    h3("Start New Workout"),
    uiOutput(outputId=ns("ui_rad_meso")),
    uiOutput(outputId=ns("ui_rad_wkt")),
    uiOutput(outputId=ns("ui_date_wkt")),
    
    #confirmation button
    uiOutput(outputId=ns("ui_btn_wkt")),
    
    #sheet
    f7Sheet(id=ns("sheet_wkt_start"),
                label="Enter workout information",
                orientation="top",
                swipeToClose=TRUE,
                swipeToStep=TRUE,
                backdrop=FALSE,
                swipeHandler=FALSE,
                hiddenItems=tagList(
                  p("Enter workout information"),
                  strong("testing"),
                  DTOutput(ns("dt_start_wkt")),
                  f7Button(inputId=ns("btn_submit_wkt"),
                           label="Submit workout information")
                )
    ),
    
    verbatimTextOutput(ns("result"))
  )
}





# Server============================================================================================
workoutServer <- function(id) {
  moduleServer(id, function(input, output, session) {
  
     #pull in dummy data...but when app is connected to Google sheets, it will pull in data another way
    # source(here("obj_fn", "obj.R"), local=TRUE)
  
    ns <- session$ns
    
    ## Create inputs
    ### Mesocycle
    observe({
      # print("Updating mesocycle choices")
      output$ui_rad_meso <- renderUI({
        f7Radio(inputId=ns("rad_meso"),
                label="Choose your mesocycle",
                choices=extract_mesos(df_keith22))
      })
    })
    
    
    ### Workout
    #### Choose one
    observeEvent(input$rad_meso, {
      
      output$ui_rad_wkt <- renderUI({
      
        # print(paste("Rendering workout choices for mesocycle:", input$rad_meso))
       
        f7Radio(inputId=ns("rad_wkt"),
                label="Select your workout",
                choices=extract_wkts(df_keith22, input$rad_meso))
      })
    })
    
    
    #### Enter date
    observeEvent(input$rad_wkt, {
      
      output$ui_date_wkt <- renderUI({
        
        f7DatePicker(inputId=ns("date_wkt"),
                     label="Select workout date")
      })
      
      
    })
    
    
    #### Confirmation button
    observeEvent(input$date_wkt, {
      
      output$ui_btn_wkt <- renderUI({
        f7Button(inputId=ns("btn_wkt"),
                 label="Confirm selection")
        })
        
      })
      
    
    
    ## Start workout
    ### Create reactive of workout info
    df_new_wkt <- reactive({
      df_keith22 %>%
        filter(meso==input$rad_meso, 
              workout==input$rad_wkt) %>%
        select(!c(meso, workout)) %>%
        mutate(rep_range=paste(min_rep, max_rep, sep="-"), .keep="unused") %>%
        mutate(`lb (separate by '-')`=NA,
               `accomplish (y/n)`=NA)
    })
    
    
    ### Create empty RV then populate it with above reactive
    df_new_wkt_data <- reactiveVal()
    
    observe({
      df_new_wkt_data(df_new_wkt())
    })
    
    
    ### Render DT
    output$dt_start_wkt <- renderDT(
      datatable(
        df_new_wkt_data(),
        rownames=FALSE,
        editable=TRUE,
        options=list(dom="t")
        ) %>%
          formatStyle(columns=1: ncol(df_start_wkt()),
                      backgroundColor="white")
    )
    
    
    ### Open sheet
    observeEvent(input$btn_wkt, {
      print("Clicked confirmation button")
      updateF7Sheet(id="sheet_wkt_start")
    })
    
    
    ### Capture changes in DT
    observeEvent(input$dt_start_wkt_cell_edit, {
      info <- input$dt_start_wkt_cell_edit
      str(info)
    })
    
    
    ### Update the reactive data with the edited value
    df_data <- df_new_wkt() 
    data_df[info$row, info$col] <- info$value
    df_new_wkt(df_data)
    
    ### Submit information
    observeEvent(input$btn_submit_wkt, {
      print("Clicked submit workout info button")
      output$result <- renderPrint({
        df_new_wkt()
      })
    })
    
    
  })
}





