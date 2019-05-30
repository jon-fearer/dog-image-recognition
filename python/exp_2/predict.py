import cv2
import numpy as np
from keras.models import load_model

model = load_model('./model_2.h5')
img = cv2.imread('new_photo/not_melvin.jpg')
img = cv2.resize(img, dsize=(150, 150), interpolation=cv2.INTER_CUBIC)
img = np.expand_dims(img, axis=0)/255
# print(img.shape)
print(model.predict(img))
