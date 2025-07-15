################################################################################
# setup.R
################################################################################

# -----------------------------
# GLOBAL SIMULATION SETTINGS
# -----------------------------
SIM_SEED <- 123
SIM_N <- 10000

AGE_MIN <- 50
AGE_MAX <- 80

INCOME_MEAN <- 50000
INCOME_SD <- 15000

CREDIT_MEAN <- 650
CREDIT_SD <- 70

LOAN_INCOME_THRESHOLD <- 30000
LOAN_CREDIT_THRESHOLD <- 600

HEALTH_PROBS <- c(Good = 0.5, Fair = 0.3, Poor = 0.2)

# ------------------------------------------------------------------------------
# INSTALL PACKAGES
# ------------------------------------------------------------------------------

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

# ---- broom - used to convert model outputs into tidy data frames
if (!requireNamespace("broom", quietly = TRUE)) {
  install.packages("broom")
}
library(broom)   # for tidy() output of models

# ---- pROC - ?????
if (!requireNamespace("pROC", quietly = TRUE)) {
  install.packages("pROC")
}
library(pROC)  # 


# ------------------------------------------------------------------------------
# GLOBAL FUNCTIONS
# ------------------------------------------------------------------------------
# Default DEBUG blue color
blue_color <- make_style("#0000FF")

# Define a styled debug_print function
debug_print <- function(msg) {
  cat(blue_color$italic(paste0("[DEBUG] ", msg, "\n\n")))
}