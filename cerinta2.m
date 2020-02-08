function cerinta2()
  A = double(imread('image3.gif'));
  [m n] = size(A);
  k = [1:19 20:20:99 100:30:min(m, n)];
  [U S V] = svd(A);
  
  % initializez vectorul ce va contine toate valorile singulare, ordonate descrescator
  e = zeros(min(m, n), 1);
  for i = 1 : min(m, n)
    % le extrag de pe diagonala matricii S
    e(i) = S(i, i); 
  endfor
  figure;
  grid on;
  plot(e, 'LineWidth', 2);
  
  % apelez pentru fiecare k
  for q = 1 : length(k) 
    
    % calculez informatia data de primele k valori singulare
    info(q) = sum(e(1:k(q))) / sum(e); 
    
    A_k = cerinta1('image3.gif', k(q));
    % initializez eroarea aproximarii pentru A
    err(q) = 0;
    for i = 1 : m
      for j = 1 : n
        err(q) = err(q) + (A(i, j) - A_k(i, j)) ^ 2;
      endfor
    endfor
    err(q) = err(q) / m / n;
    
    % calculez rata de compresie a datelor
    r(q) = (m * k(q) + n * k(q) + k(q)) / m / n;
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