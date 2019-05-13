function J = computeCost(X, y, theta)
m = length(y);
J = 0;
predictions = X * theta;
sqrErrors = (predictions - y).^2;
J = (sum(sqrErrors))/(2*m);
end