################################################################################
# main.R
################################################################################

# Install Packages
if (!requireNamespace("rstudioapi", quietly = TRUE)) {
  install.packages("rstudioapi")
}
library(rstudioapi)

# Dynamically set working directory to the folder containing this script
this_file <- normalizePath(sys.frame(1)$ofile %||% rstudioapi::getSourceEditorContext()$path)
this_dir <- dirname(this_file)
setwd(this_dir)
cat("Working directory set to:", this_dir, "\n")

# Project Library & Functions
source("inputs.R")
source("monte_carlo_simulator.R")
source("output_analysis.R")

# Run simulation
results <- simulate_applicant(n_sim = n_simulations)

# Analyze results
analyze_results(results)