import sys
import numpy as np
import sklearn
from sklearn.linear_model import LinearRegression

print("sys.executable :", sys.executable)
print("sklearn.__file__ :", sklearn.__file__)

X = np.array([[1, 1], [1, 2], [2, 2], [2, 3]])
# y = 1 * x_0 + 2 * x_1 + 3
y = np.dot(X, np.array([1, 2])) + 3
reg = LinearRegression().fit(X, y)
print(reg.predict(np.array([[3, 5]])))
