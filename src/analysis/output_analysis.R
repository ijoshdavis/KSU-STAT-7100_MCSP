################################################################################
# plot_loan_results.R
################################################################################

#USEFULLLLLLLLL

# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# USEFUL
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------


# ------------------------------------------------------------------------------
# GENERAL
# ------------------------------------------------------------------------------
plot_roc_curve <- function(model, sim_data) {
  prob <- predict(model, type = "response")
  roc_obj <- roc(sim_data$CanAffordLoan, prob)
  
  plot(roc_obj, main = "ROC Curve for Loan Approval Model", col = "blue")
  print(paste("AUC:", round(auc(roc_obj), 3)))
}



# ------------------------------------------------------------------------------
# PREDICTIVE APPROVAL PROBABILITY BY ATTRIBUTE
# ------------------------------------------------------------------------------
predict_approval_vs_income <- function(model, sim_data) {
  sim_data$pred_prob <- predict(model, type = "response")
  
  ggplot(sim_data, aes(x = Income, y = pred_prob)) +
    geom_point(alpha = 0.3) +
    geom_smooth(method = "loess") +
    labs(title = "Predicted Approval Probability by Income",
         x = "Income", y = "Predicted Probability") +
    coord_cartesian(ylim = c(0, 1)) +  # This line sets y-axis range to 0–1
    theme_minimal() +
    theme(
      panel.background = element_rect(fill = "white", color = NA),
      plot.background = element_rect(fill = "white", color = NA)
    )
}

predict_approval_vs_health <- function(model, sim_data) {
  sim_data$pred_prob <- predict(model, type = "response")
  
  ggplot(sim_data, aes(x = HEALTH_PROBS[HealthStatus], y = pred_prob)) +
    geom_point(alpha = 0.3) +
    geom_smooth(method = "loess") +
    labs(title = "Predicted Approval Probability by Health",
         x = "Health Status", y = "Predicted Probability") +
    coord_cartesian(ylim = c(0, 1)) +  # This line sets y-axis range to 0–1
    theme_minimal() +
    theme(
      panel.background = element_rect(fill = "white", color = NA),
      plot.background = element_rect(fill = "white", color = NA)
    )
}

predict_approval_vs_credit <- function(model, sim_data) {
  sim_data$pred_prob <- predict(model, type = "response")
  
  ggplot(sim_data, aes(x = CreditScore, y = pred_prob)) +
    geom_point(alpha = 0.3) +
    geom_smooth(method = "loess") +
    labs(title = "Predicted Approval Probability by Credit Score",
         x = "Credit Score", y = "Predicted Probability") +
    coord_cartesian(ylim = c(0, 1)) +  # This line sets y-axis range to 0–1
    theme_minimal() +
    theme(
      panel.background = element_rect(fill = "white", color = NA),
      plot.background = element_rect(fill = "white", color = NA)
    )
}

predict_approval_vs_age <- function(model, sim_data) {
  sim_data$pred_prob <- predict(model, type = "response")
  
  ggplot(sim_data, aes(x = Age, y = pred_prob)) +
    geom_point(alpha = 0.3) +
    geom_smooth(method = "loess") +
    labs(title = "Predicted Approval Probability by Age",
         x = "Age", y = "Predicted Probability") +
    coord_cartesian(ylim = c(0, 1)) +  # This line sets y-axis range to 0–1
    theme_minimal() +
    theme(
      panel.background = element_rect(fill = "white", color = NA),
      plot.background = element_rect(fill = "white", color = NA)
    )
}



# ------------------------------------------------------------------------------
# PROBABILITY OF APPROVAL BY ATTRIBUTE
# ------------------------------------------------------------------------------
prob_approval_income_curve <- function(sim_data) {
  ggplot(sim_data, aes(x = Income, y = as.numeric(CanAffordLoan))) +
    geom_smooth(method = "glm", method.args = list(family = "binomial"), se = TRUE) +
    labs(title = "Probability of Approval by Income",
         x = "Income", y = "Estimated Approval Probability") +
    theme_minimal() +
    theme(
      panel.background = element_rect(fill = "white", color = NA),
      plot.background = element_rect(fill = "white", color = NA)
    )
}

prob_approval_credit_curve <- function(sim_data) {
  ggplot(sim_data, aes(x = CreditScore, y = as.numeric(CanAffordLoan))) +
    geom_smooth(method = "glm", method.args = list(family = "binomial"), se = TRUE) +
    labs(title = "Probability of Approval by Credit Score",
         x = "Credit Score", y = "Estimated Approval Probability") +
    theme_minimal() +
    theme(
      panel.background = element_rect(fill = "white", color = NA),
      plot.background = element_rect(fill = "white", color = NA)
    )
}

prob_approval_age_curve <- function(sim_data) {
  ggplot(sim_data, aes(x = Age, y = as.numeric(CanAffordLoan))) +
    geom_smooth(method = "glm", method.args = list(family = "binomial"), se = TRUE) +
    labs(title = "Probability of Approval by Age",
         x = "Age", y = "Estimated Approval Probability") +
    theme_minimal() +
    theme(
      panel.background = element_rect(fill = "white", color = NA),
      plot.background = element_rect(fill = "white", color = NA)
    )
}

prob_approval_health_curve <- function(sim_data) {
  ggplot(sim_data, aes(x = HEALTH_PROBS[HealthStatus], y = as.numeric(CanAffordLoan))) +
    geom_smooth(method = "glm", method.args = list(family = "binomial"), se = TRUE) +
    labs(title = "Probability of Approval by Health Status",
         x = "Health Status", y = "Estimated Approval Probability") +
    theme_minimal() +
    theme(
      panel.background = element_rect(fill = "white", color = NA),
      plot.background = element_rect(fill = "white", color = NA)
    )
}



# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# NOT USEFUL
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------




# ------------------------------------------------------------------------------
# PLOT - APPROVAL PROBABILITY
# ------------------------------------------------------------------------------
plot_approval_probability <- function(sim_data) {
  # Basic histogram of approval
  ggplot(sim_data, aes(x = CanAffordLoan)) +
    geom_bar(fill = "steelblue") +
    labs(title = "Loan Approval Counts",
         x = "Loan Approved (TRUE/FALSE)",
         y = "Count") +
    theme_minimal() +
    theme(
      panel.background = element_rect(fill = "white", color = NA),
      plot.background = element_rect(fill = "white", color = NA)
    )
}



# ------------------------------------------------------------------------------
# PLOT - CREDIT VS. APPROVAL
# ------------------------------------------------------------------------------
plot_credit_vs_approval <- function(sim_data) {
  p <- ggplot(sim_data, aes(x = CreditScore, fill = CanAffordLoan)) +
    geom_histogram(position = "identity", alpha = 0.6, bins = 30) +
    labs(title = "Credit Score Distribution by Loan Approval",
         x = "Credit Score",
         y = "Count") +
    theme_minimal() +
    theme(
      panel.background = element_rect(fill = "white", color = NA),
      plot.background = element_rect(fill = "white", color = NA)
    )
}



# ------------------------------------------------------------------------------
# PLOT - INCOME VS. APPROVAL
# ------------------------------------------------------------------------------
plot_Income_vs_approval <- function(sim_data) {
  p <- ggplot(sim_data, aes(x = Income, fill = as.factor(CanAffordLoan))) +
    geom_histogram(position = "identity", bins = 30, alpha = 0.6) +
    labs(title = "Income vs Loan Approval",
         x = "Income",
         y = "Count",
         fill = "Approved (1 = Yes)") +
    theme_minimal() +
    theme(
      panel.background = element_rect(fill = "white", color = NA),
      plot.background = element_rect(fill = "white", color = NA)
    )
}



# ------------------------------------------------------------------------------
# PLOT - HEALTH STATUS VS. APPROVAL
# ------------------------------------------------------------------------------
plot_HealthStatus_vs_approval <- function(sim_data) {
  p <- ggplot(sim_data, aes(x = HealthStatus, fill = CanAffordLoan)) +
    geom_bar(position = "fill") +
    labs(title = "Loan Approval Rate by Health Status",
         x = "Health Status",
         y = "Proportion Approved",
         fill = "Approved") +
    scale_fill_manual(values = c("TRUE" = "steelblue", "FALSE" = "tomato")) +
    theme_minimal() +
    theme(
      panel.background = element_rect(fill = "white", color = NA),
      plot.background = element_rect(fill = "white", color = NA)
    )
}






















plot_confusion_matrix <- function(model, sim_data, threshold = 0.5) {
  sim_data$pred <- ifelse(predict(model, type = "response") > threshold, 1, 0)
  table_actual_pred <- table(Actual = sim_data$CanAffordLoan, Predicted = sim_data$pred)
  print(table_actual_pred)
}