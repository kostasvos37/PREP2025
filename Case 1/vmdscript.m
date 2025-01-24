alpha = 500;       
tau = 0;           
K = 5;             
DC = 0;            
init = 1;          
tol = 1e-6;        
[u, u_hat, omega] = VMD(x, alpha, tau, K, DC, init, tol);



residual = x - sum(u, 1);

figure;
subplot(K+2, 1, 1);
plot(t, x, 'k');
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');
for k = 1:K
    subplot(K+2, 1, k+1);
    plot(t, u(k, :));
    title(['Mode ', num2str(k)]);
    xlabel('Time (s)');
    ylabel('Amplitude');
end

subplot(K+2, 1, K+2);
plot(t, residual, 'r');
title('Residual');
xlabel('Time (s)');
ylabel('Amplitude');

figure;
hht(u, fs, FrequencyLimits=[0 20]);
