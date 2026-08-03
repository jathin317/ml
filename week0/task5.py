# Load a CSV file using Pandas, display its summary statistics, and drop columns that have more than 50% missing values.

import pandas as pd

df = pd.read_csv("winequality-white.csv")
print(df)

print(df.describe(include="all"))

df = df.dropna(thresh=len(df) * 0.5, axis="columns")

print(df)