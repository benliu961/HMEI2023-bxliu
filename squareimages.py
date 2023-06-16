import cv2
import numpy as np
from matplotlib import pyplot as plt
x = cv2.cvtColor(cv2.imread('trainingdataimages/gentrain_104.png'), cv2.COLOR_BGR2GRAY)
print(x.shape)
print(x)
y = np.expand_dims(x, axis=2)
print(y.shape)
print(y)

data = cv2.resize(y, (128,128), interpolation=cv2.INTER_LINEAR)
print(data)
plt.imshow(x)