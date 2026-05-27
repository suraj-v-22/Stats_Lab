# =========================================================
# Experiment 7 - Fish Prices Dataset
# =========================================================

# Load library
library(ggplot2)

# Read CSV file
data <- read.csv("fishstory.csv")

# Display column names
print(colnames(data))

# Display first rows
head(data)

# Paired t-test
t_test_result <- t.test(
  data$Price1980,
  data$Price1970,
  paired = TRUE
)

# Print t-test result
print(t_test_result)

# Mean Difference
mean_difference <- mean(
  data$Price1980 - data$Price1970
)

cat("\nMean Difference (1980 - 1970):",
    round(mean_difference, 2), "\n")

# Confidence Interval
cat("\n95% Confidence Interval:\n")
print(t_test_result$conf.int)

# =========================================================
# Boxplot
# =========================================================

price_data <- data.frame(
  
  Price = c(data$Price1970,
            data$Price1980),
  
  Year = c(
    rep("1970", length(data$Price1970)),
    rep("1980", length(data$Price1980))
  )
)

ggplot(price_data,
       aes(x = Year,
           y = Price,
           fill = Year)) +
  
  geom_boxplot() +
  
  labs(
    title = "Fish Price Comparison (1970 vs 1980)",
    x = "Year",
    y = "Fish Price"
  ) +
  
  theme_minimal()
