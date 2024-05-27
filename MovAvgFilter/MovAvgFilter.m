function avg = MovAvgFilter(x)
  %
  %
  persistent prevAvg n xbuf
  persistent firstRun

  if isempty(firstRun)
    n = 10;                   % 데이터 갯수 지정
    xbuf = x * ones(n+1, 1);  % 내부 버퍼 초기화
                              % n이 10이므로, 1로된 11행 1열 행렬을 만단다.
                              % 결과 : 1로된 11행 1열 행렬에 입력된 x를 곱한값

    k = 1;
    prevAvg = x;

    firstRun = 1;
  end

  for m=1:n
    xbuf(m) = xbuf(m+1)
  end
  xbuf(n+1) = x;

  avg = prevAvg + (x - xbuf(1)) / n;

  prevAvg = avg;

