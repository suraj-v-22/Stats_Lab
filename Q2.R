# =========================================================
# Experiment 2
# Pearson Correlation Test and Q-Q Plot
# =========================================================

# Load library
library(ggplot2)

# Load built-in dataset
data(mtcars)

# Display first few rows
cat("First Six Records of mtcars Dataset:\n")
print(head(mtcars))

# Pearson Correlation Test
correlation_test <- cor.test(mtcars$mpg, mtcars$hp)

# Display correlation test result
cat("\nPearson Correlation Test Result:\n")
print(correlation_test)

# Q-Q Plot for MPG variable
ggplot(mtcars, aes(sample = mpg)) +
  stat_qq(color = "black", size = 2) +
  stat_qq_line(color = "red", linewidth = 1) +
  labs(
    title = "Q-Q Plot for MPG",
    x = "Theoretical Quantiles",
    y = "Sample Quantiles"
  ) +
  
  theme_minimal()