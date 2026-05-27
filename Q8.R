# =========================================================
# Experiment 8
# Patient Satisfaction Dataset Analysis
# =========================================================

# Load libraries
library(readr)
library(dplyr)
library(GGally)
library(ggplot2)

# =========================================================
# PART 1
# Patient Satisfaction Summary Statistics
# =========================================================

# Read dataset
data <- read.csv("patient-feedback.csv")

# Display first few rows
cat("First Six Records:\n")
print(head(data))

# Summary statistics
cat("\nSummary Statistics:\n")
print(summary(data))

# =========================================================
# PART 2
# Fitness Dataset Correlation Analysis
# =========================================================

# Read fitness dataset
fitness <- read.csv("CardioGoodFitness.csv")

# Display first rows
cat("\nFitness Dataset:\n")
print(head(fitness))

# Select only numeric columns
numeric_data <- fitness[sapply(fitness, is.numeric)]

# =========================================================
# Scatterplot Matrix
# =========================================================

ggpairs(numeric_data)

# =========================================================
# Correlation Matrix
# =========================================================

cor_matrix <- cor(numeric_data)

cat("\nCorrelation Matrix:\n")
print(cor_matrix)

# =========================================================
# Find Strongest Positive and Negative Correlation
# =========================================================

# Keep only upper triangle
cor_matrix[lower.tri(cor_matrix, diag = TRUE)] <- NA

# Convert to dataframe
cor_values <- as.data.frame(as.table(cor_matrix))

# Remove NA values
cor_values <- na.omit(cor_values)

# Strongest positive correlation
strongest_positive <- cor_values[
  which.max(cor_values$Freq), ]

# Strongest negative correlation
strongest_negative <- cor_values[
  which.min(cor_values$Freq), ]

# =========================================================
# Display Results
# =========================================================

cat("\nStrongest Positive Correlation:\n")
print(strongest_positive)

cat("\nStrongest Negative Correlation:\n")
print(strongest_negative)

# =========================================================
# Interpretation
# =========================================================

cat("\nInterpretation:\n")

cat("\n1. Strong positive correlation means both variables increase together.\n")

cat("2. Strong negative correlation means one variable decreases when the other increases.\n")

cat("3. Scatterplot matrix helps visualize relationships between variables.\n")