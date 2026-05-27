# =========================================================
# Experiment 10
# Linear Regression using TV Advertising Budget
# =========================================================

# Import libraries
import pandas as pd
import statsmodels.api as sm
import matplotlib.pyplot as plt

# =========================================================
# Create Dataset
# =========================================================

data = {

    'TV': [1, 2, 4, 7, 9, 11, 15],

    'Sales': [2, 4, 6, 9, 12, 34, 45]
}

# Create dataframe
df = pd.DataFrame(data)

# Display dataset
print("Dataset:\n")
print(df)

# =========================================================
# Define Variables
# =========================================================

X = df['TV']

Y = df['Sales']

# Add constant for regression equation
X = sm.add_constant(X)

# =========================================================
# Build Linear Regression Model
# =========================================================

model = sm.OLS(Y, X).fit()

# =========================================================
# Print Statistical Summary
# =========================================================

print("\nLinear Regression Model Summary:\n")

print(model.summary())

# =========================================================
# Plot Graph
# =========================================================

plt.scatter(
    df['TV'],
    df['Sales'],
    color='blue',
    label='Actual Data'
)

plt.plot(
    df['TV'],
    model.predict(X),
    color='red',
    label='Regression Line'
)

plt.title("Linear Regression: Sales vs TV Budget")

plt.xlabel("TV Advertising Budget")

plt.ylabel("Sales")

plt.legend()
plt.grid(True)
plt.show()