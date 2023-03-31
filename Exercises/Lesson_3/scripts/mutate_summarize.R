#' Create a column called ratio which is Total.Student.Response.Rate/Total.Parent.Response.Rate
#' Select only the DBN and this new ratio column.
#' Get the mean of this new ratio column
#' Save the result in stu_par_ratio

stu_par_ratio <-
  nyc_survey_total %>%
  # Mutate statement here
  [function name]([new variable name] = [expression to create new variable])
  # Select statement here
  [your code here]
  # Summarize statement here
  [function name](mean = mean([column name], na.rm = T))