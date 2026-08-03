import pandas as pd

df = pd.read_csv("winequality-red.csv", sep=";")

filtered_df = df.dropna(axis="index")
flitered_df = df.drop_duplicates

features = filtered_df[["fixed acidity","volatile acidity", "citric acid", "residual sugar", "chlorides", "free sulfur dioxide", "total sulfur dioxide", "density", "pH", "sulphates", "alcohol"]]
target = filtered_df["quality"]

print(features)
print(target)