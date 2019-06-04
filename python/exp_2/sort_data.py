import os


source_melvin = '../../data/melvin/'
source_melvin_files = os.listdir(source_melvin)
print('Number melvin images: ', len(source_melvin_files))
print('Sorting melvin images...')
melvin_train_count, melvin_validate_count = 0, 0
for loc, file in enumerate(source_melvin_files):
    src = source_melvin + file
    file_ext = file.split('.')[-1]
    if loc % 10 == 0:
        dst = './data/validation/melvin/{}.{}'.format(loc, file_ext)
        melvin_validate_count += 1
    else:
        dst = './data/train/melvin/{}.{}'.format(loc, file_ext)
        melvin_train_count += 1
    with open(src, 'rb') as fin, open(dst, 'wb') as fout:
        fout.write(fin.read())
print('{} images added to melvin train folder'.format(melvin_train_count))
print('{} images added to melvin validation folder'
      .format(melvin_validate_count))

source_not_melvin = '../../data/personal/'
source_internet = '../../data/internet/'
source_not_melvin_files = os.listdir(source_not_melvin)
source_internet_files = os.listdir(source_internet)
print('Number not melvin images: ',
      len(source_not_melvin_files) + len(source_internet_files))
print('Sorting not melvin images...')
not_melvin_train_count, not_melvin_validate_count = 0, 0
all_not_melvin_files = [source_not_melvin + file for file in
                        source_not_melvin_files]
all_not_melvin_files += [source_internet + file for file in
                         source_internet_files]
for loc, file in enumerate(all_not_melvin_files):
    src = file
    file_ext = file.split('.')[-1]
    if loc % 10 == 0:
        dst = './data/validation/not_melvin/{}.{}'.format(loc, file_ext)
        not_melvin_validate_count += 1
    else:
        dst = './data/train/not_melvin/{}.{}'.format(loc, file_ext)
        not_melvin_train_count += 1
    with open(src, 'rb') as fin, open(dst, 'wb') as fout:
        fout.write(fin.read())
print('{} images added to not melvin train folder'
      .format(not_melvin_train_count))
print('{} images added to melvin validation folder'
      .format(not_melvin_validate_count))
