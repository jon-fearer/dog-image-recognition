from keras.models import load_model
from keras.preprocessing.image import ImageDataGenerator

# dimensions of our images.
img_width, img_height = 150, 150

validation_data_dir = 'data/validation'
batch_size = 10
nb_validation_samples = 10

test_datagen = ImageDataGenerator(rescale=1. / 255)

validation_generator = test_datagen.flow_from_directory(
    validation_data_dir,
    target_size=(img_width, img_height),
    batch_size=batch_size,
    class_mode='binary',
    shuffle=False)

model = load_model('./archive/3/model.h5')
result = model.predict_generator(validation_generator,
                                 steps=1)

print(validation_generator.filenames)
print(result)
