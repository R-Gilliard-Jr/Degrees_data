# Note that this script can be completed using a single pipeline. 
# For a challenge, try rewriting the script so that it does not save any intermediate
# results.

#' Save an intermediate version of the data that includes only the first 5 
#' columns to the data frame slice
slice <- nyc_survey_total %>%
  [your code here]

#' Arrange the data on the column Total.Parent.Response.Rate and
#' save the result to the data frame slice_arrange
slice_arrange <- slice %>%
  [your code here]

#' Make sure to save and run your script before clicking submit! 
#' To do both at the same time you can click `source` in the upper right
#' hand corner (if you're using R Studio)