filter_total <- function(data) {
  data <- data %>%
    filter(Total.Student.Response.Rate >= .95)
  return(data)
}
# Remember, once you're done coding, Save and submit() your code.