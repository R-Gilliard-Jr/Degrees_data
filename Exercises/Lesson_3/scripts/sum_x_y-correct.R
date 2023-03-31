x <- 3
y <- 4

# Finish the code so that z has the value 7

sum_x_y <- function() {
  z <- x %>%
  sum(y)
  assign("z",z, envir = .GlobalEnv)
}