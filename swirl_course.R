# Set path
# setwd("D:/Documents/Work/DegreesNYC/Degrees_data")
setwd("D:/Documents/DegreesNYC")

# Load packages
pkgs <- c("swirlify")
lapply(pkgs, library, character.only = T)

# Lesson 1
new_lesson("Lesson 3", "Exercises")

set_lesson(paste0(getwd(), "/Exercises/Lesson_3/lesson.yaml"))
