################################################################################
# Monte_carlo-Simulation.R
################################################################################

# ------------------------------------------------------------------------------
# SIMULATION POPULATION 
# ------------------------------------------------------------------------------
loan_population_gen <- function(n = 10000) {
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



# ------------------------------------------------------------------------------
# APPROVAL SIMULATOR 
# ------------------------------------------------------------------------------
simulate_loan_approval <- function(sim_data) {
  # Try fitting the model
  model <- tryCatch({
    bayesglm(
      CanAffordLoan ~ Age + Income + CreditScore + HealthStatus,
      data = sim_data,
      family = binomial(link = "logit")
    )
  }, error = function(e) {
    message("Model fitting failed: ", conditionMessage(e))
    return(NULL)
  })
  
  # Exit early if model failed
  if (is.null(model)) {
    message("Model is NULL. Skipping summary and confint.")
    return(NULL)
  }
  
  # Try summary
  tryCatch({
    print(summary(model))
  }, error = function(e) {
    message("summary() failed: ", conditionMessage(e))
  })
  
  # Try confidence interval
  tryCatch({
    conf_int <- confint(model)
    print(conf_int)
  }, error = function(e) {
    message("confint() failed: ", conditionMessage(e))
  })
  
  return(model)
}