# Code placed in this file fill be executed every time the
      # lesson is started. Any variables created here will show up in
      # the user's working directory and thus be accessible to them
      # throughout the lesson.
pkgs <- c("dplyr")
invisible(lapply(pkgs, library, character.only = T))

.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

nyc_survey_total <- read.csv(file.path(.get_course_path(), "Exercises", "Lesson_3", "total.csv"))