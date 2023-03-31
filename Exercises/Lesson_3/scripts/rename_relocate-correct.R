#' In a single pipeline, rename Total.Student.Response.Rate to
#' stu_response_rate and move the column before the Total.Parent.Response.Rate
#' column. Save the result in rename_relocate.

rename_relocate <-
  nyc_survey_total %>%
  rename(stu_response_rate = Total.Student.Response.Rate) %>%
  relocate(stu_response_rate, .before = Total.Parent.Response.Rate)