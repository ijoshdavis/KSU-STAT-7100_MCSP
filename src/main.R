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
#print(predict_approval_vs_health(model, sim_data)) #NOT USEFUL
print(predict_approval_vs_credit(model, sim_data)) #USEFUL
print(predict_approval_vs_age(model, sim_data)) #USEFUL

print(prob_approval_income_curve(sim_data))
print(prob_approval_credit_curve(sim_data))
print(prob_approval_age_curve(sim_data))
print(prob_approval_health_curve(sim_data))

print(counts_approval(sim_data))
print(counts_age(sim_data))
print(counts_health(sim_data))
print(counts_credit(sim_data))

print(histo_approval_credit(sim_data))
print(histo_approval_age(sim_data))
print(histo_approval_income(sim_data))

print(plot_bayesglm_coefficients(model))


export_plot( "predict_approval_vs_income", 
             predict_approval_vs_income(model, sim_data))



# -----------------------------
# EXPERIMENT #0 - DEFAULT VARIABLES (commented)
# -----------------------------
# debug_print("Running Simulation - Experiment 0...")
# sim_data <- loan_population_gen(n = 10000)
# model <- simulate_loan_approval(sim_data)

# debug_print("Exporting Plot Results...")
# ggsave(paste0("output/health_approval_plot-", SIM_SEED, ".png"),
#        plot_HealthStatus_vs_approval(sim_data),
#        width = 1920, height = 1080, units = "px", dpi = 300)
# ggsave(paste0("output/approval_plot-", SIM_SEED, ".png"),
#        plot_approval_probability(sim_data),
#        width = 1920, height = 1080, units = "px", dpi = 300)
# ggsave(paste0("output/credit_approval_plot-", SIM_SEED, ".png"),
#        plot_credit_vs_approval(sim_data),
#        width = 1920, height = 1080, units = "px", dpi = 300)
# ggsave(paste0("output/income_approval_plot-", SIM_SEED, ".png"),
#        plot_Income_vs_approval(sim_data),
#        width = 1920, height = 1080, units = "px", dpi = 300)
# ggsave(paste0("output/approval_prob_curve-", SIM_SEED, ".png"),
#        plot_approval_probability_curve(sim_data),
#        width = 1920, height = 1080, units = "px", dpi = 300)
# ggsave(paste0("output/approval_prob_health_curve-", SIM_SEED, ".png"),
#        plot_approval_probability_by_health(sim_data),
#        width = 1920, height = 1080, units = "px", dpi = 300)

# -----------------------------
# EXPERIMENT #1 (commented)
# -----------------------------
# debug_print("Running Simulation - Experiment 1...")
# SIM_SEED <- 777
# SIM_N <- 100000
# AGE_MIN <- 50
# AGE_MAX <- 80
# INCOME_MEAN <- 30000
# INCOME_SD <- 15000
# CREDIT_MEAN <- 650
# CREDIT_SD <- 70
# LOAN_INCOME_THRESHOLD <- 30000
# LOAN_CREDIT_THRESHOLD <- 600
# HEALTH_PROBS <- c(Good = 0.5,
#                   Fair = 0.3,
#                   Poor = 0.2)

# sim_data <- loan_population_gen(n = SIM_N)
# model <- simulate_loan_approval(sim_data)

# debug_print("Exporting Plot Results...")
# ggsave(paste0("output/health_approval_plot-", SIM_SEED, ".png"),
#        plot_HealthStatus_vs_approval(sim_data),
#        width = 1920, height = 1080, units = "px", dpi = 300)
# ggsave(paste0("output/approval_plot-", SIM_SEED, ".png"),
#        plot_approval_probability(sim_data),
#        width = 1920, height = 1080, units = "px", dpi = 300)
# ggsave(paste0("output/credit_approval_plot-", SIM_SEED, ".png"),
#        plot_credit_vs_approval(sim_data),
#        width = 1920, height = 1080, units = "px", dpi = 300)
# ggsave(paste0("output/income_approval_plot-", SIM_SEED, ".png"),
#        plot_Income_vs_approval(sim_data),
#        width = 1920, height = 1080, units = "px", dpi = 300)
# ggsave(paste0("output/approval_prob_curve-", SIM_SEED, ".png"),
#        plot_approval_probability_curve(sim_data),
#        width = 1920, height = 1080, units = "px", dpi = 300)
# ggsave(paste0("output/approval_prob_health_curve-", SIM_SEED, ".png"),
#        plot_approval_probability_by_health(sim_data),
#        width = 1920, height = 1080, units = "px", dpi = 300)

# -----------------------------
# EXPERIMENT #2 - LONG LIVES (commented)
# -----------------------------
# debug_print("Running Simulation - Experiment 2...")
# SIM_SEED <- 999
# SIM_N <- 100000
# AGE_MIN <- 50
# AGE_MAX <- 120
# INCOME_MEAN <- 40000
# INCOME_SD <- 15000
# CREDIT_MEAN <- 650
# CREDIT_SD <- 70
# LOAN_INCOME_THRESHOLD <- 30000
# LOAN_CREDIT_THRESHOLD <- 600
# HEALTH_PROBS <- c(Good = 0.5,
#                   Fair = 0.3,
#                   Poor = 0.2)

# sim_data <- run_loan_simulation(n = SIM_N)
# model <- simulate_loan_approval(sim_data)

# debug_print("Exporting Plot Results...")
# ggsave(paste0("output/health_approval_plot-", SIM_SEED, ".png"),
#        plot_HealthStatus_vs_approval(sim_data),
#        width = 1920, height = 1080, units = "px", dpi = 300)
# ggsave(paste0("output/approval_plot-", SIM_SEED, ".png"),
#        plot_approval_probability(sim_data),
#        width = 1920, height = 1080, units = "px", dpi = 300)
# ggsave(paste0("output/credit_approval_plot-", SIM_SEED, ".png"),
#        plot_credit_vs_approval(sim_data),
#        width = 1920, height = 1080, units = "px", dpi = 300)
# ggsave(paste0("output/income_approval_plot-", SIM_SEED, ".png"),
#        plot_Income_vs_approval(sim_data),
#        width = 1920, height = 1080, units = "px", dpi = 300)
# ggsave(paste0("output/approval_prob_curve-", SIM_SEED, ".png"),
#        plot_approval_probability_curve(sim_data),
#        width = 1920, height = 1080, units = "px", dpi = 300)
# ggsave(paste0("output/approval_prob_health_curve-", SIM_SEED, ".png"),
#        plot_approval_probability_by_health(sim_data),
#        width = 1920, height = 1080, units = "px", dpi = 300)






