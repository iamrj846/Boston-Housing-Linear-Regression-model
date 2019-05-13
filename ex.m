clear ; close all; clc

%% =================== Cost and Gradient descent ===================

data = load('train.csv');
X_withoutones = data(:, 1:size(data, 2) - 1);
y = data(:, size(data, 2));
m = length(y);

X = [ones(m, 1) X_withoutones];
theta = zeros(size(X, 2), 1);

iterations = 1400;
alpha = 0.01;

theta_norm = normalEqn(X, y);
J_norm = computeCost(X, y, theta_norm);

fprintf('Theta found by Normal Equation -> ');
theta_norm
fprintf('Cost computed -> ');
J_norm

X_normalized = normalize(X_withoutones);
[theta_gradient, J_history] = gradientDescent(X_normalized, y, theta, alpha, iterations);
J_gradient = computeCost(X_normalized, y, theta_gradient);

fprintf('Theta found by gradient descent -> ');
theta_gradient
fprintf('Cost computed -> ');
J_gradient

figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

%% =================== Prediction ===================

test_data = csvread('test.csv');
X_predictwithoutones = test_data(:,:);
X_predict = [ones(size(X_predictwithoutones, 1), 1) X_predictwithoutones];
y_predictGradient = X_predict * theta_norm;

fprintf("Predicted values of houses from test data set are: ");
y_predictGradient
