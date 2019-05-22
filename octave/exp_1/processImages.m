files = glob('data/*/melvin/*.jpg');
for i=1:numel(files)
  I = imread(files{i});
  I = imresize(I, [250 250]);
  I = rgb2gray(I);
  out = strrep(files{i}, 'data/', 'processed/');
  imwrite(I, out);
endfor

files = glob('data/*/not_melvin/*.jpg');
for i=1:numel(files)
  I = imread(files{i});
  I = imresize(I, [250 250]);
  I = rgb2gray(I);
  out = strrep(files{i}, 'data/', 'processed/');
  imwrite(I, out);
endfor
