
# -----------------------------
# EXPERIMENT #0 - DEFAULT VARIABLES
# -----------------------------
debug_print("Running Simulation - Experiment 0...")
sim_data <- loan_population_gen(n = 10000)
model <- simulate_loan_approval(sim_data)

debug_print("Exporting Plot Results...")
ggsave(paste0("output/health_approval_plot-", SIM_SEED, ".png"),
       plot_HealthStatus_vs_approval(sim_data),
       width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("output/approval_plot-", SIM_SEED, ".png"),
       plot_approval_probability(sim_data),
       width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("output/credit_approval_plot-", SIM_SEED, ".png"),
       plot_credit_vs_approval(sim_data),
       width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("output/income_approval_plot-", SIM_SEED, ".png"),
       plot_Income_vs_approval(sim_data),
       width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("output/approval_prob_curve-", SIM_SEED, ".png"),
       plot_approval_probability_curve(sim_data),
       width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("output/approval_prob_health_curve-", SIM_SEED, ".png"),
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
INCOME_MEAN <- 30000
INCOME_SD <- 15000
CREDIT_MEAN <- 650
CREDIT_SD <- 70
LOAN_INCOME_THRESHOLD <- 30000
LOAN_CREDIT_THRESHOLD <- 600
HEALTH_PROBS <- c(Good = 0.5,
                  Fair = 0.3,
                  Poor = 0.2)

sim_data <- loan_population_gen(n = SIM_N)
model <- simulate_loan_approval(sim_data)

debug_print("Exporting Plot Results...")
ggsave(paste0("output/health_approval_plot-", SIM_SEED, ".png"),
       plot_HealthStatus_vs_approval(sim_data),
       width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("output/approval_plot-", SIM_SEED, ".png"),
       plot_approval_probability(sim_data),
       width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("output/credit_approval_plot-", SIM_SEED, ".png"),
       plot_credit_vs_approval(sim_data),
       width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("output/income_approval_plot-", SIM_SEED, ".png"),
       plot_Income_vs_approval(sim_data),
       width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("output/approval_prob_curve-", SIM_SEED, ".png"),
       plot_approval_probability_curve(sim_data),
       width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("output/approval_prob_health_curve-", SIM_SEED, ".png"),
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
INCOME_MEAN <- 40000
INCOME_SD <- 15000
CREDIT_MEAN <- 650
CREDIT_SD <- 70
LOAN_INCOME_THRESHOLD <- 30000
LOAN_CREDIT_THRESHOLD <- 600
HEALTH_PROBS <- c(Good = 0.5,
                  Fair = 0.3,
                  Poor = 0.2)

sim_data <- run_loan_simulation(n = SIM_N)
model <- simulate_loan_approval(sim_data)

debug_print("Exporting Plot Results...")
ggsave(paste0("output/health_approval_plot-", SIM_SEED, ".png"),
       plot_HealthStatus_vs_approval(sim_data),
       width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("output/approval_plot-", SIM_SEED, ".png"),
       plot_approval_probability(sim_data),
       width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("output/credit_approval_plot-", SIM_SEED, ".png"),
       plot_credit_vs_approval(sim_data),
       width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("output/income_approval_plot-", SIM_SEED, ".png"),
       plot_Income_vs_approval(sim_data),
       width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("output/approval_prob_curve-", SIM_SEED, ".png"),
       plot_approval_probability_curve(sim_data),
       width = 1920, height = 1080, units = "px", dpi = 300)
ggsave(paste0("output/approval_prob_health_curve-", SIM_SEED, ".png"),
       plot_approval_probability_by_health(sim_data),
       width = 1920, height = 1080, units = "px", dpi = 300)