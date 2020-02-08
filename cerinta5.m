function cerinta5()
  A = double(imread('image3.gif'));
  [m n] = size(A);
  k = [1:19 20:20:99 100:30:min(m,n)];
  
  [A_k S] = cerinta3('image1.gif', min(m, n));
  figure;
  grid on;
  plot(diag(S), 'LineWidth', 2);
  
  % apelez pentru fiecare k
  for q = 1 : length(k)
    
    % calculez informatia data de primele k valori singulare
    [A_k S] = cerinta3('image3.gif', k(q));
    sum1 = 0;
    for i = 1 : k(q)
      sum1 = sum1 + S(i, i);
    endfor
    sum2 = 0;
    for i = 1 : min(m, n)
      sum2 = sum2 + S(i, i);
    endfor
    info(q) = sum1 / sum2;
    
    % initializez eroarea aproximarii pentru A
    err(q) = 0;
    for i = 1 : m
      for j = 1 : n
        err(q) = err(q) + (A(i, j) - A_k(i, j)) ^ 2;
      endfor
    endfor
    err(q) = err(q) / m / n;
    
    % calculez rata de compresie a datelor
    r(q) = (2 * k(q) + 1) / n;
  endfor
  figure;
  grid on;
  plot(k, info, 'LineWidth', 2);
  figure;
  grid on;
  plot(k, err, 'LineWidth', 2);
  figure;
  grid on;
  plot(k, r, 'LineWidth', 2);
endfunction