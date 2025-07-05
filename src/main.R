################################################################################
# main.R
################################################################################

# Project Library & Functions
source("setup.R")
source("data/inputs.R")
source("R/monte_carlo_simulator.R")
source("output/output_analysis.R")

# Run simulation
results <- simulate_applicant(n_sim = n_simulations)

# Analyze results
analyze_results(results)