################################################################################
# main.R
################################################################################

# ------------------------------------------------------------------------------
# PROJECT LIBRARY & FUNCTIONS TEST
# ------------------------------------------------------------------------------
source("setup.R")
source("data/analyze_loan_approval_factors.R")
source("R/monte_carlo-simulation.R")
source("output/output_analysis.R")

# ------------------------------------------------------------------------------
# RUN SIMULATION
# ------------------------------------------------------------------------------
debug_print("Running Simulation...")
sim_data <- run_loan_simulation(n = 10000)

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

debug_print("Exporting Plot Results...")
ggsave(paste0("figures/health_approval_plot-", SIM_SEED, ".png"), plot_HealthStatus_vs_approval(sim_data), width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("figures/approval_plot-", SIM_SEED, ".png"), plot_approval_probability(sim_data), width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("figures/credit_approval_plot-", SIM_SEED, ".png"), plot_credit_vs_approval(sim_data), width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("figures/income_approval_plot-", SIM_SEED, ".png"), plot_Income_vs_approval(sim_data), width = 1920, height = 1080, units = "px", dpi = 300)




debug_print("Running Simulation...")
SIM_SEED <- 777
sim_data <- run_loan_simulation(n = 10000)
debug_print("Exporting Plot Results...")
ggsave(paste0("figures/health_approval_plot-", SIM_SEED, ".png"), plot_HealthStatus_vs_approval(sim_data), width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("figures/approval_plot-", SIM_SEED, ".png"), plot_approval_probability(sim_data), width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("figures/credit_approval_plot-", SIM_SEED, ".png"), plot_credit_vs_approval(sim_data), width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("figures/income_approval_plot-", SIM_SEED, ".png"), plot_Income_vs_approval(sim_data), width = 1920, height = 1080, units = "px", dpi = 300)



debug_print("Running Simulation...")
SIM_SEED <- 947
sim_data <- run_loan_simulation(n = 10000)
debug_print("Exporting Plot Results...")
ggsave(paste0("figures/health_approval_plot-", SIM_SEED, ".png"), plot_HealthStatus_vs_approval(sim_data), width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("figures/approval_plot-", SIM_SEED, ".png"), plot_approval_probability(sim_data), width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("figures/credit_approval_plot-", SIM_SEED, ".png"), plot_credit_vs_approval(sim_data), width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("figures/income_approval_plot-", SIM_SEED, ".png"), plot_Income_vs_approval(sim_data), width = 1920, height = 1080, units = "px", dpi = 300)
