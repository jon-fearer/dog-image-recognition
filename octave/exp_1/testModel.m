clear ; close all; clc

load('results/2/theta1.mat');
load('results/2/theta2.mat');
[X y] = loadImage('processed/test/melvin/IMG_1164.jpg', 1);
fprintf('melvin photo 1\n')
pred = predict(Theta1, Theta2, X);
pred
[X y] = loadImage('processed/test/not_melvin/DSC_0043.jpg', 2);
fprintf('not melvin photo 1\n')
pred = predict(Theta1, Theta2, X);
pred
[X y] = loadImage('processed/test/not_melvin/DSC_0928.jpg', 2);
fprintf('not melvin photo 2\n')
pred = predict(Theta1, Theta2, X);
pred
