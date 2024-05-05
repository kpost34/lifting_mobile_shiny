# Login Module


# UI================================================================================================
workoutUI <- function(id) {
  ns <- NS(id)
  
  f7Tab(title="Login",
        tabName="login_tab",
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
  )
    
  
}





# Server============================================================================================
workoutServer <- function(id) {
  moduleServer(id, function(input, ouptut, session) {
  
    
    
  })
  
}





