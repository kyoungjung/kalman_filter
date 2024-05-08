clear all

Nsamples = 500;
% 각 요소가 0인 500행 1열 행렬을 생성한다.
Xsaved = zeros(Nsamples, 1);
% 각 요소가 0인 500행 1열 행렬을 생성한다.
Xmsaved = zeros(Nsamples, 1);


for k=1:Nsamples
  xm = GetSonar();
  x = MovAvgFilter(xm);

  Xsaved(k) = x;
  Xmsaved(k) = xm;
end


dt = 0.02;
t = 0:dt:Nsamples*dt-dt;

figure
hold on
plot(t, Xmsaved, 'r.');
plot(t, Xmsaved, 'b');
legend('measured', 'Moving average');
