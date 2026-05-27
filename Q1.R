# =========================================================
# Experiment 1
# Correlation Between Two Variables using Scatter Plot
# =========================================================

# Load required library
library(ggplot2)

# Load built-in dataset
data(mtcars)

# Display first few rows of dataset
cat("First Six Records of mtcars Dataset:\n")
print(head(mtcars))

# Select variables
x <- mtcars$hp      # Horsepower
y <- mtcars$mpg     # Miles per Gallon

# Compute correlation
correlation <- cor(x, y)

# Display correlation value
cat("\nCorrelation between Horsepower and MPG:",round(correlation, 4), "\n")

# Interpretation
if(correlation > 0)
{
  cat("\nInterpretation: Positive Correlation\n")
} else {
  cat("\nInterpretation: Negative Correlation\n")
}

# Create scatter plot with regression line
ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point(shape = 4,size = 3,color = "blue") +
  geom_smooth(method = "lm",se = FALSE,color = "red") +
  labs(title = "Scatter Plot of MPG vs Horsepower",
    x = "Horsepower (hp)",
    y = "Miles Per Gallon (mpg)"
  ) +
  
  theme_minimal()