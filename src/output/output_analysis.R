################################################################################
# output_analysis.R
################################################################################
cat("[DEBUG] Loading output_analysis.R\n")

analyze_results <- function(sim_results) {
  
  # --- Summary ---
  cat("Estimated Loan Approval Rate:", mean(sim_results$CanAffordLoan), "\n")
  cat("Median Net Cash Flow:", median(sim_results$NetCashFlow), "\n")

  # ----------------------------------------------------------------------------
  # HISTOGRAM - PLOT ON SCREEN
  # ----------------------------------------------------------------------------
  hist(sim_results$NetCashFlow, breaks = 30, col = "lightblue",
       main = "Simulated Net Cash Flow", xlab = "Net Cash Flow")
  
  # ----------------------------------------------------------------------------
  # HISTOGRAM - EXPLORT TO FILE
  # ----------------------------------------------------------------------------
  
  # ---- Open a PNG device (create file) ---- 
  png("net_cash_flow_hist.png", width = 1280, height = 720) 
  #Hi 
  # ---- Histogram to memory ---- 
  hist(sim_results$NetCashFlow, breaks = 30, col = "lightblue",
       main = "Simulated Net Cash Flow", xlab = "Net Cash Flow")
  
  # ---- Close the device (saves the file) ----
  dev.off()
  
  
  # ----------------------------------------------------------------------------
  # PROBABILITY OF LOAN DENIAL
  # ----------------------------------------------------------------------------
  
  denied_prob <- mean(!sim_results$CanAffordLoan)
  cat("Probability of Denial:", denied_prob, "\n")
}
















### SOME PRETTY CHARTING FOR THE FUTURE
# Load required packages
# library(ggplot2)      # For data visualization
# library(scales)       # For axis formatting (e.g., comma separators)
# library(hrbrthemes)   # Optional: Clean, modern theme for ggplot2
# library(ggthemes)     # Optional: Additional themes and styles

# Calculate the mean of Net Cash Flow to use in the plot
# mean_val <- mean(sim_results$NetCashFlow, na.rm = TRUE)

# Create a histogram of Net Cash Flow with custom styling
# p <- ggplot(sim_results, aes(x = NetCashFlow)) +

# Add histogram bars with light green fill and white borders
#   geom_histogram(bins = 30, fill = "#69b3a2", color = "white", alpha = 0.8) +

# Add a dashed vertical line at the mean value
#   geom_vline(aes(xintercept = mean_val), linetype = "dashed", color = "red", size = 1) +

# Annotate the mean line with the label "Mean"
#   annotate("text", x = mean_val, y = Inf, label = "Mean", vjust = 2, hjust = 0.5,
#            color = "red", fontface = "italic") +

# Format the x-axis with commas for large numbers
#   scale_x_continuous(labels = comma) +

# Add title, subtitle, axis labels, and a caption
#   labs(
#     title = "Simulated Net Cash Flow Distribution",
#     subtitle = paste("Mean =", round(mean_val, 2)),
#     x = "Net Cash Flow",
#     y = "Frequency",
#     caption = "Source: Simulation Results"
#   ) +

# Apply a clean minimal theme with readable font size
#   theme_minimal(base_size = 14) +

# Customize plot appearance: bold titles and remove minor gridlines
#   theme(
#     plot.title = element_text(face = "bold", size = 18),
#     plot.subtitle = element_text(size = 13, color = "gray40"),
#     axis.title = element_text(face = "bold"),
#     panel.grid.minor = element_blank()
#   )

# Print the plot (necessary if running in a script)
# print(p)