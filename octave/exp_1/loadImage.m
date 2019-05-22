function [X, y] = loadImage(fp, tof)
  I = double(imread(fp));
  X = [I'(:)'];
  y = [tof];
end
