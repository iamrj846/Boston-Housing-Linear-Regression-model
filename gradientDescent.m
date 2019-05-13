function [theta_gradient, J_history] = gradientDescent(X, y, theta, alpha, iterations)
m = length(y);
J_history = zeros(iterations, 1);
for iter = 1:iterations,
	delta = (X' * (X * theta - y))/m;
	theta = theta - alpha * delta;
  theta_gradient = theta;
  J_history(iter) = computeCost(X, y, theta_gradient);
end
end
