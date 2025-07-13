################################################################################
# main.R
################################################################################

# ------------------------------------------------------------------------------
# PROJECT LIBRARY & FUNCTIONS TEST
# ------------------------------------------------------------------------------
source("setup.R")
source("data/analyze_loan_approval_factors.R")
source("R/Monte_carlo-Simulation.R")
source("output/output_analysis.R")

# ------------------------------------------------------------------------------
# RUN SIMULATION
# ------------------------------------------------------------------------------
debug_print("Running Simulation...")
sim_data <- run_loan_simulation(n = 100000)

# ------------------------------------------------------------------------------
# ANALYZE RESULTS
# ------------------------------------------------------------------------------
debug_print("Analyzing Results...")
model <- analyze_loan_approval_factors(sim_data)

# ------------------------------------------------------------------------------
# PLOT RESULTS
# ------------------------------------------------------------------------------
debug_print("Plot Results...")
print(plot_HealthStatus_vs_approval(sim_data))
print(plot_approval_probability(sim_data))
print(plot_credit_vs_approval(sim_data))
print(plot_Income_vs_approval(sim_data))