# output_analysis.R

analyze_loan_approval_factors <- function(sim_data) {
  library(ggplot2)
  library(randomForest)
  
  # Ensure factors have correct levels
  sim_data$HealthStatus <- factor(sim_data$HealthStatus, levels = c("Poor", "Fair", "Good"))
  sim_data$Approved <- factor(sim_data$Approved, levels = c(0, 1))
  
  # Logistic regression
  logit_model <- glm(Approved ~ Age + Income + CreditScore + HealthStatus,
                     data = sim_data,
                     family = binomial,
                     control = glm.control(maxit = 50))
  
  cat("\n--- Logistic Regression Summary ---\n")
  print(summary(logit_model))
  
  # Odds ratios and confidence intervals
  exp_coef <- exp(coef(logit_model))
  confint_logit <- exp(confint(logit_model))
  
  odds_ratios <- data.frame(
    Factor = names(exp_coef),
    OddsRatio = exp_coef,
    Lower95CI = confint_logit[, 1],
    Upper95CI = confint_logit[, 2]
  )
  
  cat("\n--- Odds Ratios with 95% Confidence Intervals ---\n")
  print(odds_ratios)
  
  # Plots
  print(
    ggplot(sim_data, aes(x = Approved, y = Income)) +
      geom_boxplot(fill = "skyblue") +
      labs(title = "Income by Loan Approval", x = "Approval (0=Denied,1=Approved)", y = "Income")
  )
  
  print(
    ggplot(sim_data, aes(x = Approved, y = CreditScore)) +
      geom_boxplot(fill = "lightgreen") +
      labs(title = "Credit Score by Loan Approval", x = "Approval", y = "Credit Score")
  )
  
  print(
    ggplot(sim_data, aes(x = HealthStatus, fill = Approved)) +
      geom_bar(position = "dodge") +
      labs(title = "Health Status by Approval", fill = "Approval")
  )
  
  # Random forest model
  rf_model <- randomForest(Approved ~ Age + Income + CreditScore + HealthStatus,
                           data = sim_data, importance = TRUE, ntree = 500)
  
  cat("\n--- Random Forest Model Summary ---\n")
  print(rf_model)
  
  cat("\n--- Variable Importance ---\n")
  print(importance(rf_model))
  
  varImpPlot(rf_model)
  
  return(list(logistic_model = logit_model, random_forest_model = rf_model))
}
