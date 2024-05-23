# Mesocycle Module


# UI================================================================================================
mesoUI <- function(id) {
  ns <- NS(id)
  
  f7Tab(title="Create new mesocycle",
        tabName="meso_tab",
        icon=f7Icon("arrow_right_square_fill"),
        active=TRUE,
        
    h4("We are on the start new mesocycle page."),
    f7Text(inputId=ns("txt_nm_meso"),
           label="Enter name of mesocycle"),
    
    #workout information
    f7Slider(inputId=ns("slid_n_wkouts"),
             label="Number of workouts",
             min=2,
             max=5,
             value=3),
    uiOutput(ns("ui_txt_btn_wkout_info")),
    # f7Radio(inputId=ns("rad_info_wkout"),
    #         label="Choose workout",
    #         choices=NULL,
    #         selected=NULL),
    # f7Button(inputId=ns("btn_info_wkout"),
    #          label="Enter exercise info",
    #          size="small"
    # )
    
    
    create_workout_sheet(id=id, wkt_num=1, ex_group=1)
    
    # f7Sheet(id=ns("sheet_wkt1_1"),
    #         label="Workout 1",
    #         orientation="top",
    #         swipeToClose=TRUE,
    #         swipeToStep=TRUE,
    #         swipeHandler=FALSE,
    #         hiddenItems=tagList(
    #           strong("Workout 1 Exercises 1-5"),
    #             purrr::map(1:5, function(x) {
    #               splitLayout(cellWidths=c("40%", "25%", "15%", "20%"),
    #                 f7Text(inputId=ns(paste0("txt_ex", x)),
    #                        label=paste("Ex", x),
    #                        placeholder="Enter name of exercise"),
    #                 f7Select(inputId=ns(paste0("sel_ex", x)),
    #                          label="Muscle group",
    #                          choices=ch_muscle,
    #                          selected=NULL),
    #                 f7Text(inputId=ns(paste0("txt_sets_ex", x)),
    #                        label="Sets"),
    #                 f7Text(inputId=ns(paste0("txt_reps_ex", x)),
    #                        label="Rep range")
    #                 )
    #             }),
    #           actionButton(inputId="btn_sheet_wkt1_1",
    #                        label="More exercises")
    #           )         
    #       )
    )
}

#there should be a table return (or a button that brings up a sheet with this info) that displays information about exercises/sets per muscle group,
  #workout, week, etc.



# Server============================================================================================
mesoServer <- function(id) {
  moduleServer(id, function(input, output, session) {
  
    ns <- session$ns
    
    #dynamically create boxes for workout names
    output$ui_txt_btn_wkout_info <- renderUI({
      
      boxes <- input$slid_n_wkouts
      
      purrr::map(1:boxes, function(i) {
        tagList(
          splitLayout(cellWidths=c("75%", "25%"),
            f7Text(inputId=ns(paste0("txt_wkout_nm_", i)), 
                   label=paste("Workout", i),
                   placeholder="Enter workout name (e.g., A, B, Upper, Pull)"),
            f7Text(inputId=ns(paste0("txt_wkout_n_ex_", i)),
                    label="Number of exercises")
          ),
          f7Button(ns(paste0("btn_wkout_info_", i)),
                   label="Enter exercise info",
                   size="small")
        )
      })
    })
    
    #enter workout information
    observeEvent(input$btn_wkout_info_1, {
      updateF7Sheet(
        id="sheet_wkt1_1"
      )
    })
      
    
    #grab workout choices
    # ch_wkout <- reactive({
    #   paste("Workout", seq_len(input$slid_n_wkouts))
    # })
    
    #update radio button using workout names
    # observeEvent(input$slid_n_wkouts, {
    #   updateF7Radio(inputId="rad_info_wkout",
    #                 choices=ch_wkout())
    # })
    
      
    #dynamically create buttons for exercise info
    # output$ui_btn_info_wkouts <- renderUI({
    #   
    #   buttons <- input$slid_n_wkouts
    #   
    #   purrr::map(1:buttons, function(i) {
    #     f7Button(inputId=ns(paste0("btn_info_wkout_", i)),
    #              label="Enter exercise info",
    #              size="small")
    #   })
    # })
    
  })
}




