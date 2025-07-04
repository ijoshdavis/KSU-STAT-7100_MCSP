Project Title: Loan Approval Risk Simulation for an Aging Population 
1.	Project Overview 
Our project explores how loan approval outcomes and financial risk evolve as the population ages, especially focusing on individuals aged 50 to 70. Over a 50-year simulation horizon, we target to understand how borrower characteristics, approval policies, and economic conditions interrelate to influence loan profitability and default rates.  The primary question we ask is: How will lending outcomes change for older borrowers as their population share increases over time?
We plan to use a Monte Carlo simulation to model individual borrowers and their outcomes under varying credit policies. In addition, we are exploring the integration of a risk scoring model to support more realistic decision-making.
2.	Simulation Objectives and Design 
We are building a simulation that reflects both borrower-level uncertainty (income, health, credit score) and macro-level changes (aging trend, market interest rates). The simulation is designed to model:
-	Individual loan applicants with randomized demographics
-	Loan approval decision based on default risk and policy thresholds
-	Loan outcomes like default or repayment, and the resulting profit or loss.
-	Annual cycles to simulate population shift over 50 years
Input Model
-	Applicant variables: age, income, credit score, health status
-	Market/Economic factors: interest rate
-	Policy thresholds: default risk limits used to accept or deny applicants 
Output
-	Loan approval status 
-	Whether the loan defaulted 
-	Profit or loss from each loan 
-	Summary statistics over time 
