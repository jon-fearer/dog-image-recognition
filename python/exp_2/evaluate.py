from keras.models import load_model
from keras.preprocessing.image import ImageDataGenerator

# dimensions of our images.
img_width, img_height = 150, 150

validation_data_dir = 'data/validation'
batch_size = 100
nb_validation_samples = 100

test_datagen = ImageDataGenerator(rescale=1. / 255)

validation_generator = test_datagen.flow_from_directory(
    validation_data_dir,
    target_size=(img_width, img_height),
    batch_size=batch_size,
    class_mode='binary',
    shuffle=False)

model = load_model('./archive/7/model.h5')
result = model.predict_generator(validation_generator,
                                 steps=1)

right, wrong = 0, 0
for loc, item in enumerate(validation_generator.filenames[:100]):
    print(validation_generator.filenames[loc], result[loc][0])
    if ((validation_generator.filenames[loc].split('/')[0] == 'melvin' and
        result[loc][0] < 0.5) or
        (validation_generator.filenames[loc].split('/')[0] == 'not_melvin' and
            result[loc][0] >= 0.5)):
        right += 1
    else:
        wrong += 1
print('right: ', right)
print('wrong: ', wrong)
