function [J grad] = cost(nn_params, ...
                         input_layer_size, ...
                         hidden_layer_size, ...
                         num_labels, ...
                         X, y, lambda)
  Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                   hidden_layer_size, (input_layer_size + 1));

  Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                   num_labels, (hidden_layer_size + 1));

  m = size(X, 1);

  J = 0;
  Theta1_grad = zeros(size(Theta1));
  Theta2_grad = zeros(size(Theta2));

  a1 = [ones(m, 1) X]; %size 5000 by 401
  z2 = a1*Theta1'; %z2 is size 5000 by 25
  a2 = sigmoid(z2); %a2 is size 5000 by 25
  a2 = [ones(m, 1) a2]; %a2 is size 5000 by 26
  z3 = a2*Theta2'; %z3 is size 5000 by 10
  a3 = sigmoid(z3); %a3 is size 5000 by 10
  yt = zeros(size(y,1),num_labels);
  for a=1:size(y,1),
      yt(a,y(a)) = 1;
  end;
  reg = (lambda/(2*m)) * (sum(sumsq(Theta1(:,2:end)))+sum(sumsq(Theta2(:,2:end))));
  for b=1:m,
      J += (1/m) * ((-yt(b,:) * log(a3(b,:)')) - ((1-yt(b,:)) * log(1 - a3(b,:)')));
  end;
  J += reg;

  for t = 1:m,
      av1 = a1(t,:); % 1 by 401
      zv2 = Theta1*av1'; % 25 by 1
      av2 = sigmoid(zv2); % 25 by 1
      av2 = [1 ; av2]; % 26 by 1
      zv3 = Theta2*av2; % 10 by 1
      av3 = sigmoid(zv3); % 10 by 1
      yv = yt(t,:); % 1 by 10
      dv3 = av3 - yv'; % 10 by 1
      Theta2v = Theta2(:,2:end); % 10 by 25
      dv2 = (Theta2v'*dv3) .* sigmoidGradient(zv2); % 25 by 1
      Theta2_grad = Theta2_grad + dv3*av2'; % 10 by 26
      Theta1_grad = Theta1_grad + dv2*av1; % 25 by 401
  end;

  Theta2_grad = (1/m).*Theta2_grad;
  Theta2_grad(:,2:end) = Theta2_grad(:,2:end) + (lambda/m).*Theta2(:,2:end);
  Theta1_grad = (1/m).*Theta1_grad;
  Theta1_grad(:,2:end) = Theta1_grad(:,2:end) + (lambda/m).*Theta1(:,2:end);

  grad = [Theta1_grad(:) ; Theta2_grad(:)];

end
