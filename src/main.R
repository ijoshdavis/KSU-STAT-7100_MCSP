################################################################################
# main.R
################################################################################

# ------------------------------------------------------------------------------
# PROJECT LIBRARY & FUNCTIONS TEST
# ------------------------------------------------------------------------------
source("setup.R")
source("R/monte_carlo_simulation.R")
source("analysis/analyze_loan_approval_factors.R")
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

print(plot_roc_curve(model, sim_data))
print(plot_approval_vs_income(model, sim_data))
print(plot_model_coefficients(model))

print(plot_HealthStatus_vs_approval(sim_data))
print(plot_approval_probability(sim_data))
print(plot_credit_vs_approval(sim_data))
print(plot_Income_vs_approval(sim_data))
print(plot_approval_probability_curve(sim_data))


# -----------------------------
# EXPERIMENT #0 - DEFAULT VARIABLES
# -----------------------------
debug_print("Running Simulation - Experiment 0...")
sim_data <- run_loan_simulation(n = 10000)
debug_print("Exporting Plot Results...")
ggsave(paste0("figures/health_approval_plot-", SIM_SEED, ".png"),
       plot_HealthStatus_vs_approval(sim_data),
       width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("figures/approval_plot-", SIM_SEED, ".png"),
       plot_approval_probability(sim_data),
       width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("figures/credit_approval_plot-", SIM_SEED, ".png"),
       plot_credit_vs_approval(sim_data),
       width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("figures/income_approval_plot-", SIM_SEED, ".png"),
       plot_Income_vs_approval(sim_data),
       width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("figures/approval_prob_curve-", SIM_SEED, ".png"),
       plot_approval_probability_curve(sim_data),
       width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("figures/approval_prob_health_curve-", SIM_SEED, ".png"),
       plot_approval_probability_by_health(sim_data),
       width = 1920, height = 1080, units = "px", dpi = 300)

# -----------------------------
# EXPERIMENT #1
# -----------------------------
debug_print("Running Simulation - Experiment 1...")
SIM_SEED <- 777
SIM_N <- 100000
AGE_MIN <- 50
AGE_MAX <- 80
INCOME_MEAN <- 50000
INCOME_SD <- 15000
CREDIT_MEAN <- 650
CREDIT_SD <- 70
LOAN_INCOME_THRESHOLD <- 30000
LOAN_CREDIT_THRESHOLD <- 600
HEALTH_PROBS <- c(Good = 0.5, Fair = 0.3, Poor = 0.2)

sim_data <- run_loan_simulation(n = SIM_N)
debug_print("Exporting Plot Results...")
ggsave(paste0("figures/health_approval_plot-", SIM_SEED, ".png"),
         plot_HealthStatus_vs_approval(sim_data),
         width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("figures/approval_plot-", SIM_SEED, ".png"),
         plot_approval_probability(sim_data),
         width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("figures/credit_approval_plot-", SIM_SEED, ".png"),
         plot_credit_vs_approval(sim_data),
         width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("figures/income_approval_plot-", SIM_SEED, ".png"),
         plot_Income_vs_approval(sim_data),
         width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("figures/approval_prob_curve-", SIM_SEED, ".png"),
       plot_approval_probability_curve(sim_data),
       width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("figures/approval_prob_health_curve-", SIM_SEED, ".png"),
       plot_approval_probability_by_health(sim_data),
       width = 1920, height = 1080, units = "px", dpi = 300)


# -----------------------------
# EXPERIMENT #2 - LONG LIVES
# -----------------------------
debug_print("Running Simulation - Experiment 2...")
SIM_SEED <- 999
SIM_N <- 100000
AGE_MIN <- 50
AGE_MAX <- 120
INCOME_MEAN <- 50000
INCOME_SD <- 15000
CREDIT_MEAN <- 650
CREDIT_SD <- 70
LOAN_INCOME_THRESHOLD <- 30000
LOAN_CREDIT_THRESHOLD <- 600
HEALTH_PROBS <- c(Good = 0.5, Fair = 0.3, Poor = 0.2)

sim_data <- run_loan_simulation(n = SIM_N)
debug_print("Exporting Plot Results...")
ggsave(paste0("figures/health_approval_plot-", SIM_SEED, ".png"),
       plot_HealthStatus_vs_approval(sim_data),
       width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("figures/approval_plot-", SIM_SEED, ".png"),
       plot_approval_probability(sim_data),
       width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("figures/credit_approval_plot-", SIM_SEED, ".png"),
       plot_credit_vs_approval(sim_data),
       width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("figures/income_approval_plot-", SIM_SEED, ".png"),
       plot_Income_vs_approval(sim_data),
       width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("figures/approval_prob_curve-", SIM_SEED, ".png"),
       plot_approval_probability_curve(sim_data),
       width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("figures/approval_prob_health_curve-", SIM_SEED, ".png"),
       plot_approval_probability_by_health(sim_data),
       width = 1920, height = 1080, units = "px", dpi = 300)