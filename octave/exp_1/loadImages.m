function [X, y] = loadImages()
  files = glob('processed/train/melvin/*.jpg');
  m = numel(files);
  X = [];
  y = [];
  for i=1:m
    I = double(imread(files{i}));
    X = [X; I'(:)'];
    y = [y; 1];
  endfor
  files = glob('processed/train/not_melvin/*.jpg');
  m += numel(files);
  for i=1:numel(files)
    I = double(imread(files{i}));
    X = [X; I'(:)'];
    y = [y; 2];
  endfor
end
