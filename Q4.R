# =========================================================
# Experiment 4
# Treatment Facility Dataset Analysis
# =========================================================

# Load libraries
library(dplyr)
library(ggplot2)

# Load dataset
# Change path according to your system

df <- read.csv("treatmentfacility.csv")

# Convert Reengineer column into factor
df$Reengineer <- factor(df$Reengineer,
                        levels = c("Prior", "Post"))

# Display first few records
cat("First Six Records:\n")
print(head(df))

# Summary statistics
summary_stats <- df %>%
  group_by(Reengineer) %>%
  summarise(
    Count = n(),
    
    Mean_Turnover = mean(Employee_Turnover),
    SD_Turnover = sd(Employee_Turnover),
    
    Mean_TRFF = mean(TRFF),
    SD_TRFF = sd(TRFF),
    
    Mean_CI = mean(CI),
    SD_CI = sd(CI)
  )

# Print summary statistics
cat("\nSummary Statistics:\n")
print(summary_stats)

# =========================================================
# Boxplot for Employee Turnover
# =========================================================

ggplot(df,
       aes(x = Reengineer,
           y = Employee_Turnover,
           fill = Reengineer)) +
  
  geom_boxplot() +
  
  labs(
    title = "Employee Turnover Before and After Reengineering",
    x = "Reengineering Status",
    y = "Employee Turnover"
  ) +
  
  theme_minimal()

# =========================================================
# Boxplot for TRFF
# =========================================================

ggplot(df,
       aes(x = Reengineer,
           y = TRFF,
           fill = Reengineer)) +
  
  geom_boxplot() +
  
  labs(
    title = "TRFF Before and After Reengineering",
    x = "Reengineering Status",
    y = "TRFF"
  ) +
  
  theme_minimal()

# =========================================================
# Interpretation
# =========================================================

cat("\nInterpretation:\n")

cat("\n1. Employee turnover increased after reengineering.\n")

cat("2. TRFF values decreased after reengineering.\n")

cat("3. Behavioral incidents (CI) reduced after reengineering.\n")