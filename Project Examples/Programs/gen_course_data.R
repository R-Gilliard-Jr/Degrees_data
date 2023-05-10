## ---------------------------
##
## Script name: 
##
## Purpose of script: Split survey data
##
## Author: Reggie Gilliard
##
## Date Created: 2023-03-29
##
## Copyright (c) Reggie Gilliard, 2023
## ---------------------------

# Setup
pkgs <- c("tidyverse", "openxlsx", "readxl", "glue")
invisible(lapply(pkgs, library, character.only = T))

# Paths
root <- "D:/Documents/DegreesNYC/Degrees_data/Project Examples"
indir <- file.path(root, "Data")
intdir <- file.path(root, "Intermediate")
outdir <- file.path(root, "Output")

# Load Each survey sheet
file_path <- file.path(indir, "2022-nyc-school-survey---students.xlsx")

sheets <- excel_sheets(file_path)

save_data <- function(path, sheet, env = .GlobalEnv) {
  data <- read_excel(path, sheet)
  assign(glue::glue("{sheet}"), data, envir = env)
}

walk(sheets, function(x) save_data(file_path, x))

# Truncate data
dbns <- unique(Total$DBN)
# randomdbns <- sample(dbns, 100)

filter_data <- function(data) {
  name <- data
  data <- get(data)
  data %>%
    # filter(DBN %in% randomdbns) %>%
    {assign(glue("{name}"), ., envir = .GlobalEnv)}
}

walk(sheets[1:6], filter_data)
# Write out new workbook
wb <- createWorkbook()

write_data <- function(wb, sheet) {
  addWorksheet(wb, sheet)
  data <- get(sheet)
  writeData(wb, sheet, data)
}

walk(sheets[1:6], function(x) write_data(wb, x))
saveWorkbook(wb, file.path(intdir, "nyc_student_survey_2022.xlsx"), overwrite = T)
