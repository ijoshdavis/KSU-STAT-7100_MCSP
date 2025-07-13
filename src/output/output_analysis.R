################################################################################
# plot_loan_results.R
################################################################################

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
plot_Income_vs_approval <- function(simdata) {
  p <- ggplot(simdata, aes(x = Income, fill = as.factor(CanAffordLoan))) +
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
plot_HealthStatus_vs_approval <- function(simdata) {
  p <- ggplot(simdata, aes(x = HealthStatus, fill = CanAffordLoan)) +
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

