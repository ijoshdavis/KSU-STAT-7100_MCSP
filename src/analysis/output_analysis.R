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
# COUNTS
# ------------------------------------------------------------------------------
counts_approval <- function(sim_data) {
  sim_data %>%
    count(CanAffordLoan) %>%
    arrange(desc(CanAffordLoan)) %>%
    mutate(
      prop = n / sum(n),
      ypos = cumsum(n) - 0.5 * n,        # Midpoint of each slice
      label = paste0(n, " (", round(prop * 100), "%)")
    ) %>%
    ggplot(aes(x = "", y = n, fill = as.factor(CanAffordLoan))) +
    geom_col(width = 1, color = "white") +
    geom_text(aes(y = ypos, label = label), color = "black") +
    coord_polar(theta = "y") +
    labs(
      title = "Loan Approvals",
      fill = "Loan Approved"
    ) +
    theme_void() +
    theme(
      plot.background = element_rect(fill = "white", color = NA),
      legend.position = "right"
    )
}

counts_health <- function(sim_data) {
  sim_data %>%
    count(HealthStatus) %>%
    arrange(desc(HealthStatus)) %>%
    mutate(
      prop = n / sum(n),
      ypos = cumsum(n) - 0.5 * n,        # Midpoint of each slice
      label = paste0(n, " (", round(prop * 100), "%)")
    ) %>%
    ggplot(aes(x = "", y = n, fill = as.factor(HealthStatus))) +
    geom_col(width = 1, color = "white") +
    geom_text(aes(y = ypos, label = label), color = "black") +
    coord_polar(theta = "y") +
    labs(
      title = "Health Status Distribution",
      fill = "Health Status"
    ) +
    theme_void() +
    theme(
      plot.background = element_rect(fill = "white", color = NA),
      legend.position = "right"
    )
}

counts_age <- function(sim_data) {
  sim_data %>%
    count(Age) %>%
    ggplot(aes(x = Age, y = n)) +
    geom_col(fill = "steelblue", color = "white") +
    geom_text(aes(label = n), vjust = -0.5, size = 3) +
    labs(
      title = "Ages Distribution",
      x = "Age",
      y = "Count"
    ) +
    theme_minimal() +
    theme(
      plot.background = element_rect(fill = "white", color = NA)
    )
}

counts_credit <- function(sim_data) {
  ggplot(sim_data, aes(x = CreditScore)) +
    geom_histogram(binwidth = 10, fill = "steelblue", color = "white") +
    labs(
      title = "Credit Score Distribution",
      x = "Credit Score",
      y = "Count"
    ) +
    theme_minimal() +
    theme(
      plot.background = element_rect(fill = "white", color = NA)
    )
}


# ------------------------------------------------------------------------------
# COUNTS & APPROVAL
# ------------------------------------------------------------------------------
histo_approval_credit <- function(sim_data) {
  p <- ggplot(sim_data, aes(x = CreditScore, fill = CanAffordLoan)) +
    geom_histogram(position = "identity", alpha = 0.6, bins = 30) +
    labs(title = "Credit Score Distribution vs. Approval",
         x = "Credit Score",
         y = "Count",
         fill = "Loan Approved") +
    theme_minimal() +
    theme(
      panel.background = element_rect(fill = "white", color = NA),
      plot.background = element_rect(fill = "white", color = NA)
    )
}

histo_approval_age <- function(sim_data) {
  p <- ggplot(sim_data, aes(x = Age, fill = CanAffordLoan)) +
    geom_histogram(position = "identity", alpha = 0.6, bins = 30) +
    labs(title = "Age Distribution vs. Approval",
         x = "Age",
         y = "Count",
         fill = "Loan Approved") +
    theme_minimal() +
    theme(
      panel.background = element_rect(fill = "white", color = NA),
      plot.background = element_rect(fill = "white", color = NA)
    )
}

histo_approval_income <- function(sim_data) {
  p <- ggplot(sim_data, aes(x = Income, fill = CanAffordLoan)) +
    geom_histogram(position = "identity", alpha = 0.6, bins = 30) +
    labs(
      title = "Income Distribution vs. Approval",
      x = "Income",
      y = "Count",
      fill = "Loan Approved") +
    theme_minimal() +
    theme(
      panel.background = element_rect(fill = "white", color = NA),
      plot.background = element_rect(fill = "white", color = NA)
    )
}



# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# MAYBE
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------


plot_bayesglm_coefficients <- function(model) {
  # Get summary and confidence intervals
  coefs <- summary(model)$coefficients
  conf_int <- confint(model)
  
  # Prepare data frame for plotting
  coef_df <- as.data.frame(coefs)
  coef_df$term <- rownames(coef_df)
  coef_df$lower <- conf_int[, 1]
  coef_df$upper <- conf_int[, 2]
  
  # Clean up for plotting: remove intercept and HealthStatus terms
  coef_df <- coef_df %>%
    filter(term != "(Intercept)",
           !grepl("HealthStatus", term)) %>%
    mutate(term = factor(term, levels = rev(term)))
  
  # Plot
  ggplot(coef_df, aes(x = Estimate, y = term)) +
    geom_point(color = "steelblue", size = 3) +
    geom_errorbarh(aes(xmin = lower, xmax = upper), height = 0.2, color = "gray40") +
    labs(
      title = "Bayesian Logistic Regression Coefficients",
      x = "Coefficient Estimate",
      y = "Predictor"
    ) +
    theme_minimal() +
    theme(
      plot.background = element_rect(fill = "white", color = NA),
      panel.grid.major.y = element_blank()
    )
}


plot_confusion_matrix <- function(model, sim_data, threshold = 0.5) {
  sim_data$pred <- ifelse(predict(model, type = "response") > threshold, 1, 0)
  table_actual_pred <- table(Actual = sim_data$CanAffordLoan, Predicted = sim_data$pred)
  print(table_actual_pred)
}