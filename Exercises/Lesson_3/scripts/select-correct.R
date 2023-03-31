
#' Remove the columns in `columns` from the data frame and save the new 
#' data frame as survey_truncated
columns <- c("Collaborative.Teachers.Score", "Effective.School.Leadership.Score",  "Rigorous.Instruction.Score", 
             "Supportive.Environment.Score", "Strong.Family.Community.Ties.Score", "Trust.Score")

survey_truncated <-
  nyc_survey_total %>%
  select(-c(columns))
