function g = sigmoidGradient(z)
  g = zeros(size(z));
  sig = 1 ./ (1 .+ exp(-1.*z));
  g = sig .* (1 .- sig);
end
