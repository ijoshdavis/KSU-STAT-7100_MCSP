################################################################################
# analyze_loan_approval_factors.R
################################################################################

analyze_loan_approval_factors <- function(sim_data) {
  # Fit Bayesian logistic regression to predict loan approval
  model <- bayesglm(CanAffordLoan ~ Age + Income + CreditScore,
                    data = sim_data,
                    family = binomial(link = "logit"))
  
  # Summary of the model
  print(summary(model))
  
  # Confidence intervals
  conf_int <- confint(model)
  print(conf_int)
  
  return(model)
}
