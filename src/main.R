################################################################################
# main.R
################################################################################

# ------------------------------------------------------------------------------
# PROJECT LIBRARY & FUNCTIONS TEST
# ------------------------------------------------------------------------------
source("setup.R")
source("R/monte_carlo_simulation.R")
source("analysis/output_analysis.R")

# ------------------------------------------------------------------------------
# RUN SIMULATION
# ------------------------------------------------------------------------------
debug_print("Running Simulation...")
sim_data <- loan_population_gen(n = 10000)
model <- simulate_loan_approval(sim_data)

# ------------------------------------------------------------------------------
# ANALYZE RESULTS
# ------------------------------------------------------------------------------
debug_print("Analyzing Results...")

print(plot_roc_curve(model, sim_data)) #USEFUL

print(predict_approval_vs_income(model, sim_data)) #USEFUL
print(predict_approval_vs_health(model, sim_data)) #NOT USEFUL
print(predict_approval_vs_credit(model, sim_data)) #USEFUL
print(predict_approval_vs_age(model, sim_data)) #USEFUL

print(prob_approval_income_curve(sim_data))
print(prob_approval_credit_curve(sim_data))
print(prob_approval_age_curve(sim_data))
print(prob_approval_health_curve(sim_data))

export_plot( "predict_approval_vs_income", 
             predict_approval_vs_income(model, sim_data))





print(plot_model_coefficients(model))

print(plot_HealthStatus_vs_approval(sim_data))

print(plot_credit_vs_approval(sim_data))
print(plot_Income_vs_approval(sim_data))


