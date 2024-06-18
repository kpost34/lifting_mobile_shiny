# Functions (1) for Lifting Mobile Shiny App

# Workout Sheet Functions===========================================================================
## Function to create a sheet with inputs for exercise information
create_workout_sheet <- function(id, wkt_num, ex_group=1) {
  ns <- NS(id)
  
  lab <- paste("Workout", wkt_num)
  
  sheet_id <- paste0("sheet_wkt", wkt_num, "_", ex_group)
  
  exs <- if(ex_group==1) {
    1:5
  } else if(ex_group==2) {
    6:10
  } else if(ex_group==3) {
    11:15
  }
  
  ex_range <- paste(exs[1], exs[length(exs)], sep="-")
  
  f7Sheet(id=ns(sheet_id),
          label=lab,
          orientation="top",
          swipeToClose=TRUE,
          swipeToStep=TRUE,
          swipeHandler=FALSE,
          hiddenItems=tagList(
            #right-aligns text
            p("Click below sheet to return to create mesocycle page", style="text-align: right"),
            strong(paste(lab, "Exercises", ex_range)),
              purrr::map(exs, function(x) {
                splitLayout(cellWidths=c("40%", "15%", "15%", "10%", "10%", "10%"),
                  f7Text(inputId=ns(paste0("txt_ex", x)),
                         label=paste("Ex", x),
                         placeholder="Enter name of exercise"),
                  f7Select(inputId=ns(paste0("sel_bar_ex", x)),
                           label="Bar",
                           choices=ch_bar,
                           selected=NULL),
                  f7Select(inputId=ns(paste0("sel_muscle_ex", x)),
                           label="Muscle group",
                           choices=ch_muscle,
                           selected=NULL),
                  f7Select(inputId=ns(paste0("txt_sets_ex", x)),
                           label="Sets",
                           choices=ch_sets,
                           selected=NULL),
                  f7Text(inputId=ns(paste0("txt_reps_low_ex", x)),
                         label="Min rep",
                         placeholder="Min"),
                  f7Text(inputId=ns(paste0("txt_resp_hi_ex", x)),
                         label="Max rep",
                         placeholder="Max")
                  )
              }),
            # tagList(
              if(ex_group==1) {
                # splitLayout(cellWidths=c("50%", "50%"),
                f7Segment(
                  f7Button(inputId=ns(paste("btn", sheet_id, "submit", sep="_")),
                           label="Submit exercise info", color="green"),
                  f7Button(inputId=ns(paste("btn", sheet_id, "more", sep="_")),
                           label="More exercises")
                )
              } else if(ex_group==2){
                f7Segment(
                  f7Button(inputId=ns(paste("btn", sheet_id, "previous", sep="_")),
                           label="Previous page"),
                  f7Button(inputId=ns(paste("btn", sheet_id, "submit", sep="_")),
                           label="Submit exercise info", color="green"),
                  f7Button(inputId=ns(paste("btn", sheet_id, "more", sep="_")),
                           label="More exercises")
                )
              } else if(ex_group==3){
                f7Segment(
                  f7Button(inputId=ns(paste("btn", sheet_id, "previous", sep="_")),
                           label="Previous page"),
                  f7Button(inputId=ns(paste("btn", sheet_id, "submit", sep="_")),
                           label="Submit exercise info", color="green")
                )
              }
          )
  )
}


## Wrapper function to create multiple sheets at a time
create_workout_sheet_set <- function(id){
  wkt_num_vec <- rep(1:5, each=3)
  ex_group_vec <- rep(1:3, 5)
  
  purrr::map2(.x=wkt_num_vec, .y=ex_group_vec, 
    function(x, y) {
      create_workout_sheet(id=id, wkt_num=x, ex_group=y)
    })
}



                  
                  


              

