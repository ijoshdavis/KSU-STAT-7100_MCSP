################################################################################
# setup.R
################################################################################

# ------------------------------------------------------------------------------
# GLOBAL FUNCTIONS
# ------------------------------------------------------------------------------
# Default DEBUG blue color
blue_color <- make_style("#0000FF")

# Define a styled debug_print function
debug_print <- function(msg) {
  cat(blue_color$italic(paste0("[DEBUG] ", msg, "\n\n")))
}



# ------------------------------------------------------------------------------
# INSTALL PACKAGES
# ------------------------------------------------------------------------------
debug_print("Loading Install Packages...")

# ---- rstudioapi - enables ability to set local working dir programmatically
if (!requireNamespace("rstudioapi", quietly = TRUE)) {
  install.packages("rstudioapi")
}
library(rstudioapi)

# ---- ggplot2 - prettier charts :)
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}
library(ggplot2)

# ---- scales - prettier common formatting
if (!requireNamespace("scales", quietly = TRUE)) {
  install.packages("scales")
}
library(scales)       # For comma formatting

# ---- hrbrthemes - prettier fonts
if (!requireNamespace("hrbrthemes", quietly = TRUE)) {
  install.packages("hrbrthemes")
}
library(hrbrthemes)   # For modern font (optional)

# ---- ggthemes - prettier gg theme
if (!requireNamespace("ggthemes", quietly = TRUE)) {
  install.packages("ggthemes")
}
library(ggthemes)     # Optional for extra themes

# ---- arm - used for applied regression model
if (!requireNamespace("arm", quietly = TRUE)) {
  install.packages("arm")
}
library(arm)  # for bayesglm

# ---- crayon - used for making console data better
if (!requireNamespace("crayon", quietly = TRUE)) {
  install.packages("crayon")
}
library(crayon)  # for bayesglm