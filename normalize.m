function [X_norm, mu, sigma] = normalize(X_withoutones)
X_norm = X_withoutones;
mu = zeros(1, size(X_withoutones, 2));
sigma = zeros(1, size(X_withoutones, 2));

for i=1:size(X_withoutones, 2),
  mu(i) = mean(X_withoutones(:, i));
  sigma(i) = std(X_withoutones(:, i));
endfor

for j=1:size(X_withoutones, 2),
  X_norm(:, j) = (X_withoutones(:, j) - mu(j))/sigma(j);
endfor

X_norm = [ones(size(X_withoutones, 1), 1) X_norm];

endfunction
