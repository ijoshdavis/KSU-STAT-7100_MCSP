################################################################################
# setup.R
################################################################################

# ------------------------------------------------------------------------------
# INSTALL PACKAGES
# ------------------------------------------------------------------------------

cat("[DEBUG] Loading setup.R\n")

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



# ------------------------------------------------------------------------------
# ENVIRONMENT SETUP
# ------------------------------------------------------------------------------

# ---- Dynamically set working directory to the folder containing this script
this_file <- normalizePath(sys.frame(1)$ofile %||% rstudioapi::getSourceEditorContext()$path)
this_dir <- dirname(this_file)
setwd(this_dir)
cat("[DEBUG] Working directory set to:", this_dir, "\n")