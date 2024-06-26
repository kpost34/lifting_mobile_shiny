# Login Module


# UI================================================================================================
loginUI <- function(id) {
  ns <- NS(id)
  
  # f7Tabs(id=ns("main_pages"),
  # login page
  f7Tab(title="Login",
        tabName="tab0",
        active=TRUE,
        hidden=TRUE,
    #enter username
    f7Text(
      inputId=ns("txt_user"),
      label="Please enter username (min 5 characters)"
    ),
    #select whether returning user
    f7Radio(
      inputId=ns("rad_login"),
      label="Are you a returning user?",
      choices=c("no", "yes"),
      selected="no"
    ),
    #submit username
    f7Button(
      inputId=ns("btn_login"),
      label="Submit"
    )
  )
}





# Server============================================================================================
loginServer <- function(id) {
  moduleServer(id, function(input, output, session) {
  
    ns <- session$ns 
    
    #connect to google sheets and pull all user_ids
    user_ids <- c("keith22")
    retVal <- reactiveValues(count=0)
    
    observeEvent(input$btn_login, {
      # if(length(input$txt_user) < 5) {
      #   print("username must be at least 5 characters long")
      # }

      #requirements
      # req(any(input$txt_user %in% user_ids)) & req(input$rad_login == "Yes")
      # req(input$rad_login == "yes", any(input$txt_user %in% user_ids))
      req((input$rad_login == "yes" & any(input$txt_user %in% user_ids))|(input$rad_login== "No" & length(input$txt_user) >= 5))

      #move to landing page
      retVal$count <- retVal$count + 1
      # updateF7Tabs(id="main_pages", selected="landing_tab")

      #grab data if in database
      # if(input$rad_login=="Yes") {
      #   #pull data from db
      #   # df_user <-
      # }

    })
    return(reactive(retVal$count))
  
  })
  
}





