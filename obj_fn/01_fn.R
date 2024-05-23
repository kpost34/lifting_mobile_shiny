# Functions (1) for Lifting Mobile Shiny App

# Workout Sheet Functions===========================================================================
# create_workout_sheet_set


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
  
  ex_range <- paste(exs[1], exs[length(ex)], sep="-")
  
  f7Sheet(id=ns(sheet_id),
          label=lab,
          orientation="top",
          swipeToClose=TRUE,
          swipeToStep=TRUE,
          swipeHandler=FALSE,
          hiddenItems=tagList(
            strong(paste(lab, "Exercises", ex_range)),
              purrr::map(exs, function(x) {
                splitLayout(cellWidths=c("40%", "25%", "15%", "10%", "10%"),
                  f7Text(inputId=ns(paste0("txt_ex", x)),
                         label=paste("Ex", x),
                         placeholder="Enter name of exercise"),
                  f7Select(inputId=ns(paste0("sel_ex", x)),
                           label="Muscle group",
                           choices=ch_muscle,
                           selected=NULL),
                  f7Text(inputId=ns(paste0("txt_sets_ex", x)),
                         label="Sets"),
                  f7Text(inputId=ns(paste0("txt_reps_low_ex", x)),
                         label="Rep Range",
                         placeholder="Min"),
                  f7Text(inputId=ns(paste0("txt_resp_hi_ex", x)),
                         label="      ",
                         placeholder="Max")
                  )
              }),
            tagList(
            if(ex_group %in% 1:2) {
              actionButton(inputId=ns(paste("btn", sheet_id, "more", sep="_")),
                           label="More exercises")
            } 
            ),
            tagList(
            if(ex_group %in% 2:3) {
              actionButton(inputId=ns(paste("btn", sheet_id, "previous", sep="_")),
                           label="Previous page")
            }
            )
            )
          )
}







ex <- 1:5
paste(ex[1], ex[length(ex)], sep="-")
