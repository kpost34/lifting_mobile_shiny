#Objects for Lifting Mobile Shiny App

# 03_newMeso obj=======================================================================================
ch_bar <- c("db", "cb", "bb")

ch_muscle <- c("chest", "back", "shoulders", "triceps", "biceps", "quads", "hamstrings", "glutes", 
               "calves", "abs")

ch_sets <- 1:5






# Demo information==================================================================================
## 



## Details of mesocycle (from create mesocycle page)
df_mesoE_keith22 <- tribble(
  ~meso, ~workout, ~exercise, ~bar, ~muscle, ~sets, ~rep_goal,
  "Meso E", "A", "flat flyes", "db", "chest", 3, 12,
  "Meso E", "A", "lateral raises", "db", "shoulders", 3, 12,
  "Meso E", "A", "st triceps extensions", "db", "triceps", 3, 12,
  "Meso E", "A", "st single-leg calf raises", "db", "calves", 2, 30,
  "Meso E", "A", "floor press", "db", "chest", 3, 12,
  "Meso E", "A", "se calf raises", "db", "calves", 2, 30,
  "Meso E", "A", "front raises", "cb", "shoulders", 3, 12,
  "Meso E", "A", "skull crushers", "db", "triceps", 2, 12,
  
  "Meso E", "B", "sh shrugs", "db", "back", 3, 12,
  "Meso E", "B", "front squats", "db", "quads", 2, 10,
  "Meso E", "B", "st hammer curls", "db", "biceps", 3, 12,
  "Meso E", "B", "box squats", "db", "hamstrings", 2, 12,
  "Meso E", "B", "chest support rows", "bb", "back", 3, 12,
  "Meso E", "B", "forward lunges", "db", "quads", 2, 12,
  "Meso E", "B", "curls", "cb", "biceps", 2, 12,
  "Meso E", "B", "glute bridges", "db", "hamstrings", 2, 12,
)

df_mesoE_keith22


## Details of recent workouts
## What's entered for a new workout
### Meso-workout-date [for start workout--choose mesocycle and workout and enter date]
df_mesoE_wktA_keith22 <- tribble(
  ~meso, ~workout, ~date,
  "Meso E", "A", "6/11/24"
)

df_mesoE_wktA_keith22
#join this information with df_mesoE_keith22 by meso and workout (which pulls in date)


### Pull up the following information
#exercise, bar, muscle, sets, rep_goal
#text input for weights
#accomplish checkbox
#once completed, then a submit button

#submit button creates the db below from the two joins


### What's stored in database
df_mesoE_wkts_keith22 <- tribble(
  #meso  #workout  #exercise................................. #specific workout.............
  ~meso, ~workout, ~exercise, ~bar, ~muscle, ~sets, ~rep_goal, ~date,  ~weights,  ~accomplish,
  "Meso E", "A", "flat flyes", "db", "chest", 3,  12, "6/11/24", "50-50-50", TRUE,
  "Meso E", "A", "lateral raises", "db", "shoulders", 3, 12, "6/11/24", "10-10-5", TRUE,
  "Meso E", "A", "st triceps extensions", "db", "triceps", 3, 12, "6/11/24", "45-45-40", TRUE,
  "Meso E", "A", "st single-leg calf raises", "db", "calves", 2, 30, "6/11/24", "70-60", TRUE,
  "Meso E", "A", "floor press", "db", "chest", 3, 12, "6/11/24", "50-50-45", TRUE,
  "Meso E", "A", "se calf raises", "db", "calves", 2, 30, "6/11/24", "75(2)-70", TRUE,
  "Meso E", "A", "front raises", "cb", "shoulders", 3, 12, "6/11/24", "35-30-30", TRUE,
  "Meso E", "A", "skull crushers", "db", "triceps", 2, 12, "6/12/24", "60-55", TRUE,
  
  "Meso E", "B", "sh shrugs", "db", "back", 3, 12, "6/12/24", "50-50-50", TRUE,
  "Meso E", "B", "front squats", "db", "quads", 2, 10, "6/12/24", "60-60", TRUE,
  "Meso E", "B", "st hammer curls", "db", "biceps", 3, 12, "6/12/24", "15-15-10", TRUE,
  "Meso E", "B", "box squats", "db", "hamstrings", 2, 12, "6/12/24", "70-60", TRUE,
  "Meso E", "B", "chest support rows", "bb", "back", 3, 12, "6/12/24", "50-50-45", TRUE,
  "Meso E", "B", "forward lunges", "db", "quads", 2, 12, "6/12/24", "35-30", TRUE,
  "Meso E", "B", "curls", "cb", "biceps", 2, 12, "6/12/24", "75-70", TRUE,
  "Meso E", "B", "glute bridges", "db", "hamstrings", 2, 12, "6/12/24", "55-55", TRUE
)

df_mesoE_wkts_keith22














