import numpy as np
import tensorflow as tf

X1 = np.array([[1,1,1,1],[2,2,2,2],[3,3,3,3],[4,4,4,4],[5,5,5,5]])

BS = np.array([[1,1,1],[2,2,2],[3,3,3]])

numrow1 = np.size(X1,0)
BS1 = np.array([BS[0,:],]*numrow1)
print(BS1)



