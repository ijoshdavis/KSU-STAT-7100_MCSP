# main.R

# Load libraries
library(arm)
library(ggplot2)

# Source all helper scripts
source("monte_carlo_simulation.R")
source("analyze_loan_approval_factors.R")
source("plot_loan_results.R")

# Run simulation
sim_data <- run_loan_simulation(n = 1000)

# Analyze data
model <- analyze_loan_approval_factors(sim_data)

# Plot results
print(plot_approval_probability(sim_data))
print(plot_credit_vs_approval(sim_data))

