################################################################################
# output_analysis.R
################################################################################

analyze_results <- function(sim_results) {
  # Summary
  cat("Estimated Loan Approval Rate:", mean(sim_results$CanAffordLoan), "\n")
  cat("Median Net Cash Flow:", median(sim_results$NetCashFlow), "\n")
  
  # Histogram
  hist(sim_results$NetCashFlow, breaks = 30, col = "lightblue",
       main = "Simulated Net Cash Flow", xlab = "Net Cash Flow")
  
  # Probability of loan denial
  denied_prob <- mean(!sim_results$CanAffordLoan)
  cat("Probability of Denial:", denied_prob, "\n")
}