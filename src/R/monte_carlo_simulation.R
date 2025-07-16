################################################################################
# Monte_carlo-Simulation.R
################################################################################

run_loan_simulation <- function(n = 10000) {
    set.seed(SIM_SEED)
    
    # Simulate input variables
    age <- round(runif(n, AGE_MIN, AGE_MAX))
    income <- round(rnorm(n, mean = INCOME_MEAN, sd = INCOME_SD))
    credit_score <- round(rnorm(n, mean = CREDIT_MEAN, sd = CREDIT_SD))
    health_status <- sample(c("Good", "Fair", "Poor"), 
                            size = n, replace = TRUE, prob = HEALTH_PROBS)
    
    # Loan affordability rule
    can_afford_loan <- (income > LOAN_INCOME_THRESHOLD) & 
      (credit_score > LOAN_CREDIT_THRESHOLD)
    
    # Final simulated data frame
    data.frame(
      Age = age,
      Income = income,
      CreditScore = credit_score,
      HealthStatus = health_status,
      CanAffordLoan = can_afford_loan
    )
}

analyze_loan_approval_factors <- function(sim_data) {
  # Fit Bayesian logistic regression to predict loan approval
  model <- bayesglm(CanAffordLoan ~ Age + Income + CreditScore + HEALTH_PROBS[HealthStatus],
                    data = sim_data,
                    family = binomial(link = "logit"))
  
  # Summary of the model
  print(summary(model))
  
  # Confidence intervals
  conf_int <- confint(model)
  print(conf_int)
  
  return(model)
}
