#' In a single pipeline, rename Total.Student.Response.Rate to
#' stu_response_rate and move the column before the Total.Parent.Response.Rate
#' column. Save the result in rename_relocate.

[your code here] <-
  nyc_survey_total %>%
  [function name here]([new name] = [old name]) %>%
  [function name here](.before = Total.Parent.Response.Rate)