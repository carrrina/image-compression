function [A_k S] = cerinta3(image, k)
  A = double(imread(image));
  [m n] = size(A);
  u = zeros(m, 1);
  for i = 1 : m
    u(i, 1) = sum(A(i, :)) / n;
    A(i, :) = A(i, :) - u(i, 1);
  endfor
  Z = A' / sqrt(n - 1);
  [U S V] = svd(Z);
  W = V(:, 1 : k);
  Y = W' * A;
  A_k = W * Y + u;
endfunction