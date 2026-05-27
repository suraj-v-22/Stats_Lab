# =========================================================
# Experiment 3
# Price Quotes Dataset Analysis
# =========================================================

# Load library
library(ggplot2)

# Load dataset
# Change file path according to your system

data <- read.csv("pricequotes.csv")

# Display first few records
cat("First Six Records:\n")
print(head(data))

# Summary Statistics
cat("\nSummary Statistics:\n")
print(summary(data))

# Number of observations
n_barry <- length(data$Barry_Price)
n_mary  <- length(data$Mary_Price)

# Mean values
mean_barry <- mean(data$Barry_Price)
mean_mary  <- mean(data$Mary_Price)

# Standard Deviation
sd_barry <- sd(data$Barry_Price)
sd_mary  <- sd(data$Mary_Price)

# Standard Error
se_barry <- sd_barry / sqrt(n_barry)
se_mary  <- sd_mary / sqrt(n_mary)

# Display results
cat("\nStatistical Measures:\n")

cat("\nBarry Price:\n")
cat("Mean =", round(mean_barry, 2), "\n")
cat("Standard Deviation =", round(sd_barry, 2), "\n")
cat("Standard Error =", round(se_barry, 2), "\n")

cat("\nMary Price:\n")
cat("Mean =", round(mean_mary, 2), "\n")
cat("Standard Deviation =", round(sd_mary, 2), "\n")
cat("Standard Error =", round(se_mary, 2), "\n")

# Boxplot Comparison
ggplot(data) +
  geom_boxplot(aes(x = "Barry", y = Barry_Price),fill = "purple") +
  geom_boxplot(aes(x = "Mary", y = Mary_Price),fill = "green") +
  labs(
    title = "Boxplot of Price Quotes",
    x = "Person",
    y = "Price"
  ) +
  
  theme_minimal()

# Interpretation
cat("\nInterpretation:\n")
cat("\nStandard Deviation measures the variation of individual values from the mean.\n")
cat("Standard Error measures the accuracy of the sample mean.\n")