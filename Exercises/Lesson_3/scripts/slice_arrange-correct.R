# Note that this script can be completed using a single pipeline. 
# For a challenge, try rewriting the script so that it does not save any intermediate
# results.
slice_arrange <-
  nyc_survey_total %>%
  slice_head(n = 5) %>%
  arrange(Total.Parent.Response.Rate)