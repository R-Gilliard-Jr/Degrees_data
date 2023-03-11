########################################;
# Author: Reggie Gilliard
# Client: DegreesNYC
# Purpose: Generate mock data for Tableau
########################################;


# Setup
rm(list = ls())
root <- "D:/Documents/DegreesNYC/Degrees_data"
pkgs <- c("tidyverse", "openxlsx", "glue", "assertr")
invisible(sapply(pkgs, library, character.only = T))

# Functions
shell_expand <- function(data, var1, var2) {
  v1_child <- filter(data, parent_var == var1)$child_var
  v2_child <- filter(data, parent_var == var2)$child_var
  expand.grid(v1_child, v2_child, stringsAsFactors = F) %>%
    setNames(c("parent_var", "child_var")) %>%
    return()
}

# Load specs
specfile <- "Specifications for RA data.xlsx"
specs <- read.xlsx(glue("{root}/{specfile}"), sheet = "codebooks", rows = c(3:14))
intersections <- expand.grid(
                              c("ethcat", "gencat", "anyell0812", "anyspd0812", "economic_disadvantage", "borough", "spec_hs"),
                              c("ethcat", "gencat", "anyell0812", "anyspd0812", "economic_disadvantage", "borough", "spec_hs"),
                              stringsAsFactors = F
                             ) %>%
  rowwise() %>%
  mutate(key = paste0(sort(c(Var1, Var2)), collapse = "")) %>%
  distinct(key, .keep_all = T) %>%
  select(-c(key)) %>%
  filter(Var1 != Var2) %>%
  ungroup()

# Create shell group variables
shell <- 
  # Expand levels so that each is a variable
  map_dfr(seq(nrow(specs)), ~ expand.grid(specs$variable_name[.x], trimws(str_split(specs$levels[.x], ",")[[1]]))) %>%
  setNames(c("parent_var", "child_var")) %>%
  assert(not_na, parent_var) %>%
  mutate(
    parent_var = as.character(parent_var),
    child_var = as.character(child_var),
    child_var = ifelse(is.na(child_var), parent_var, child_var)
  ) %>%
  assert(not_na, parent_var, child_var) %>%
  {map_dfr(.,
          function(y) apply(intersections, 1, function(x) shell_expand(., x[1], x[2]))
  )}

map_dfr(shell,
  ~ apply(intersections, 1, function(x) shell_expand(shell, x[1], x[2]))
)

# Merge in outcomes
outcomes <- read.xlsx(glue("{root}/{specfile}"), sheet = "codebooks", rows = c(15:39)) %>%
  filter(!grepl("_cat", X2)) %>%
  select(X2) %>%
  pivot_wider(names_from = X2, values_from = X2) %>%
  mutate(across(everything(), ~ ifelse(!is.na(.), NA, .)))

shell <- cbind(shell, outcomes)

# Fill shell with random data
shell %>%
  rowwise() %>%
  mutate(across(everything(), ~ ifelse(is.na(.), runif(1, min = .5, max = 1), .)))
