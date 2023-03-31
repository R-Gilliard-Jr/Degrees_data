#' Create a column called ratio which is Total.Student.Response.Rate/Total.Parent.Response.Rate
#' Select only the DBN and this new ratio column.
#' Get the mean of this new ratio column
#' Save the result in stu_par_ratio

stu_par_ratio <-
  nyc_survey_total %>%
  # Mutate statement here
  mutate(ratio = Total.Student.Response.Rate/Total.Parent.Response.Rate) %>%
  # Select statement here
  select(DBN, ratio) %>%
  # Summarize statement here
  summarize(mean = mean(ratio, na.rm = T))
  