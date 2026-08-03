import pandas as pd

df = pd.read_csv("airq402.csv")

train = df.sample(frac=0.8)
test = df.drop(train.index)

print(train.head(), len(train))
print(test.head(), len(test))