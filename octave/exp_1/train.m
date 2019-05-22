clear ; close all; clc

input_layer_size  = 62500;
hidden_layer_size = 200;
num_labels = 2;

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

options = optimset('MaxIter', 250);

lambda = 1;

[X, y] = loadImages();

% checkNNGradients;

costFunction = @(p) cost(p, ...
                         input_layer_size, ...
                         hidden_layer_size, ...
                         num_labels, X, y, lambda);

[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

pred = predict(Theta1, Theta2, X);
save results/theta1.mat Theta1;
save results/theta2.mat Theta2;
pred
save results/pred.mat pred;
