# =========================================================
# Experiment 9
# Spearman Rank Correlation
# =========================================================

# Import library
from scipy.stats import spearmanr

# Scores of students
smip_scores = [70, 46, 94, 34, 20, 86, 18, 12, 56, 64]

dbms_scores = [60, 66, 90, 46, 16, 98, 24, 8, 32, 54]

# Compute Spearman Rank Correlation
correlation, p_value = spearmanr(
    smip_scores,
    dbms_scores
)

# Display results
print("Spearman Rank Correlation Coefficient:",
      round(correlation, 4))

print("P-value:",
      round(p_value, 4))

# =========================================================
# Interpretation
# =========================================================

if p_value < 0.05:
    print("\nThere is a statistically significant correlation "
          "between SMIP and DBMS scores.")
else:
    print("\nThere is no statistically significant correlation.")