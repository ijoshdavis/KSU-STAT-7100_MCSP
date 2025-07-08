################################################################################
# inputs.R
################################################################################

cat("[DEBUG] Loading inputs.R\n")

# Set global parameters
loan_amount <- 50000
interest_rate <- 0.06
loan_term <- 10  # years
n_simulations <- 10000

# Assumptions about applicant
income_mean <- 40000
income_sd <- 5000
expense_mean <- 25000
expense_sd <- 4000

# Life expectancy range (Uniform)
life_min <- 70
life_max <- 95

# Seed for reproducibility
set.seed(344)