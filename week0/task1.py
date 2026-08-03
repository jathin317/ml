import pandas as pd

df = pd.read_csv("airq402.csv")

print(df.head())

encoded = pd.get_dummies(df, columns=["City1", "City2"], dtype=int)

print(encoded.head())