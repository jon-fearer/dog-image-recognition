import os
from shutil import copyfile


source_melvin = '../../data/melvin/'
source_melvin_files = os.listdir(source_melvin)
print('Number melvin images: ', len(source_melvin_files))
print('Sorting melvin images...')
melvin_train_count, melvin_validate_count = 0, 0
for loc, file in enumerate(source_melvin_files):
    src = source_melvin + file
    if loc % 10 == 0:
        dst = './data/validation/melvin/{}.jpg'.format(loc)
        melvin_validate_count += 1
    elif loc % 10 != 0:
        dst = './data/train/melvin/{}.jpg'.format(loc)
        melvin_train_count += 1
    copyfile(src, dst)
print('{} images added to melvin train folder'.format(melvin_train_count))
print('{} images added to melvin validation folder'
      .format(melvin_validate_count))

source_not_melvin = '../../data/not_melvin/'
source_not_melvin_files = os.listdir(source_not_melvin)
print('Number not melvin images: ', len(source_not_melvin_files))
print('Sorting not melvin images...')
not_melvin_train_count, not_melvin_validate_count = 0, 0
for loc, file in enumerate(source_not_melvin_files):
    src = source_not_melvin + file
    if loc % 10 == 0:
        dst = './data/validation/not_melvin/{}.jpg'.format(loc)
        not_melvin_validate_count += 1
    elif loc % 10 != 0:
        dst = './data/train/not_melvin/{}.jpg'.format(loc)
        not_melvin_train_count += 1
    copyfile(src, dst)
print('{} images added to not melvin train folder'
      .format(not_melvin_train_count))
print('{} images added to melvin validation folder'
      .format(not_melvin_validate_count))
