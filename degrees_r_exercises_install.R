# Try to install the swirl package
try(install.packages("swirl"))

# Uninstall the DegreesNYC_RCourse
try(swirl::uninstall_course("DegreesNYC_RCourse"), silent = T)

# Install the DegreesNYC_RCourse
try(swirl::install_course_github("R-Gilliard-Jr", "DegreesNYC_RCourse", branch = "main"))
