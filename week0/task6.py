#6. Create a 2x2 grid of plots showing the distribution of four different features in your dataset.
import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("winequality-white.csv",sep=';')

df.hist(column=["fixed acidity", "volatile acidity", "citric acid", "residual sugar"], layout=(2, 2))
plt.show()