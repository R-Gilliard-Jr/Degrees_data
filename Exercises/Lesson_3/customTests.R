# Put custom tests in this file.
      
      # Uncommenting the following line of code will disable
      # auto-detection of new variables and thus prevent swirl from
      # executing every command twice, which can slow things down.
      
      # AUTO_DETECT_NEWVAR <- FALSE
      
      # However, this means that you should detect user-created
      # variables when appropriate. The answer test, creates_new_var()
      # can be used for for the purpose, but it also re-evaluates the
      # expression which the user entered, so care must be taken.

test_sum_x_y <- function() {
   try(rm(z), silent = T)
   try({
      func <- get("sum_x_y", globalenv())
      func()
   }, silent = T)
   z == 7
}

test_filter_total <- function() {
   try({
      func <- get("filter_total", globalenv())
      totest <- func(nyc_survey_total)
      correct <- filter(nyc_survey_total, Total.Student.Response.Rate >= .95)
   })
   identical(correct, totest)
}

test_slice_arrange <- function() {
   correct <- 
      nyc_survey_total %>%
      slice_head(n = 5) %>%
      arrange(Total.Parent.Response.Rate)
   
   try(totest <- get("slice_arrange", envir = .GlobalEnv))
   identical(correct, totest)
}

test_select <- function() {
   correct <- 
      nyc_survey_total %>%
      select(-c("Collaborative.Teachers.Score", "Effective.School.Leadership.Score",  "Rigorous.Instruction.Score", 
                  "Supportive.Environment.Score", "Strong.Family.Community.Ties.Score", "Trust.Score"))
   
   try(totest <- get("survey_truncated", envir = .GlobalEnv))
   identical(correct, totest)
}

test_rename_relocate <- function() {
   correct <-
      nyc_survey_total %>%
      rename(stu_response_rate = Total.Student.Response.Rate) %>%
      relocate(stu_response_rate, .before = Total.Parent.Response.Rate)
   
   try(totest <- get("rename_relocate", envir = .GlobalEnv))
   identical(correct, totest)
}

test_mutate_summarize <- function() {
   correct <-
      nyc_survey_total %>%
      mutate(ratio = Total.Student.Response.Rate/Total.Parent.Response.Rate) %>%
      select(DBN, ratio) %>%
      summarize(mean = mean(ratio, na.rm = T))
   
   try(totest <- get("stu_par_ratio", envir = .GlobalEnv))
   identical(correct, totest)
}