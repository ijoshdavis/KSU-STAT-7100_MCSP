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
# EXPERIMENT 0 - DEFAULT
# ------------------------------------------------------------------------------
SIM_SEED <- 123
SIM_N <- 10000
AGE_MIN <- 50
AGE_MAX <- 80
INCOME_MEAN <- 50000
INCOME_SD <- 15000
CREDIT_MEAN <- 650
CREDIT_SD <- 70
LOAN_INCOME_THRESHOLD <- 30000
LOAN_CREDIT_THRESHOLD <- 600
HEALTH_PROBS <- c(Good = 0.5, Fair = 0.3, Poor = 0.2)

debug_print("Running Simulation...")
sim_data <- loan_population_gen(n = 10000)
model <- simulate_loan_approval(sim_data)

debug_print("Analyzing Results...")

## ROC
#export_plot("EXP0 - plot_roc_curve", plot_roc_curve(model, sim_data)) #USEFUL

## PREDICTABILITY
export_plot("EXP0 - predict_approval_vs_income", predict_approval_vs_income(model, sim_data)) #USEFUL
export_plot("EXP0 - predict_approval_vs_credit", predict_approval_vs_credit(model, sim_data)) #USEFUL
export_plot("EXP0 - predict_approval_vs_age", predict_approval_vs_age(model, sim_data)) #USEFUL

## PROBABILITIES
export_plot("EXP0 - prob_approval_income_curve", prob_approval_income_curve(sim_data))
export_plot("EXP0 - prob_approval_credit_curve", prob_approval_credit_curve(sim_data))
export_plot("EXP0 - prob_approval_age_curve", prob_approval_age_curve(sim_data))
export_plot("EXP0 - prob_approval_health_curve", prob_approval_health_curve(sim_data))

## COUNTS
export_plot("EXP0 - counts_approval", counts_approval(sim_data))
export_plot("EXP0 - counts_age", counts_age(sim_data))
export_plot("EXP0 - counts_health", counts_health(sim_data))
export_plot("EXP0 - counts_credit", counts_credit(sim_data))

## HISTOGRAMS
export_plot("EXP0 - histo_approval_credit", histo_approval_credit(sim_data))
export_plot("EXP0 - histo_approval_age", histo_approval_age(sim_data))
export_plot("EXP0 - histo_approval_income", histo_approval_income(sim_data))

## BAYES
export_plot("EXP0 - plot_bayesglm_coefficients", plot_bayesglm_coefficients(model))


# -----------------------------
# EXPERIMENT #0 - DEFAULT VARIABLES (commented)
# -----------------------------





