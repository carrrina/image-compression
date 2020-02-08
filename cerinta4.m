function [A_k S] = cerinta4(image, k)
  A = double(imread(image));
  [m n] = size(A);
  u = zeros(m, 1);
  for i = 1 : m
    u(i, 1) = sum(A(i, :)) / n;
    A(i, :) = A(i, :) - u(i, 1);
  endfor
  Z =A * (A' / (n - 1));
  [V S] = eig(Z);
  W = V(:, 1 : k);
  Y = W' * A;
  A_k = W * Y + u;
endfunction
  