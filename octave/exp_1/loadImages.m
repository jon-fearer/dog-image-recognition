function X = loadImages()
  files = glob('processed/*.jpg');
  m = numel(files);
  X = [];
  for i=1:numel(files)
    I = double(imread(files{i}));
    X = [X; I'(:)'];
  endfor
  X = [ones(m, 1) X];
end
