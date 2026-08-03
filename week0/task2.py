import pandas as pd

df = pd.read_csv("airq402.csv")

print(len(df))

df.dropna(axis="index", inplace=True)

print(len(df))