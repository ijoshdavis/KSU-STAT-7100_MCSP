################################################################################
# monte_carlo_simulator_ORIG.R
################################################################################

cat("[DEBUG] Loading monte_carlo_simulator.R\n")

simulate_applicant <- function(n_sim = 10000) {
  # Income and expense simulation
  incomes <- rnorm(n_sim, mean = income_mean, sd = income_sd)
  expenses <- rnorm(n_sim, mean = expense_mean, sd = expense_sd)
  
  # Life expectancy simulation
  life_expectancy <- runif(n_sim, min = life_min, max = life_max)
  
  # Net cash flow and loan affordability
  net_cash_flow <- incomes - expenses
  can_afford_loan <- net_cash_flow > (loan_amount * interest_rate)
  
  # Output results
  data.frame(
    Income = incomes,
    Expenses = expenses,
    NetCashFlow = net_cash_flow,
    LifeExpectancy = life_expectancy,
    CanAffordLoan = can_afford_loan
  )
}