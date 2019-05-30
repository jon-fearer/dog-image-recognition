from keras.models import load_model
from keras.preprocessing.image import ImageDataGenerator

# dimensions of our images.
img_width, img_height = 150, 150

validation_data_dir = 'data/validation'
batch_size = 16
nb_validation_samples = 800

test_datagen = ImageDataGenerator(rescale=1. / 255)

validation_generator = test_datagen.flow_from_directory(
    validation_data_dir,
    target_size=(img_width, img_height),
    batch_size=batch_size,
    class_mode='binary')

model = load_model('./archive/model_2.h5')
result = model.evaluate_generator(validation_generator,
                                  steps=nb_validation_samples // batch_size)

print(result)
