X = loadImages();
Theta1 = ones(10000, 62501);
Theta2 = ones(1, 10001);

a2 = sigmoid(X*Theta1');
a2 = [ones(m, 1) a2];
a3 = sigmoid(a2*Theta2');
