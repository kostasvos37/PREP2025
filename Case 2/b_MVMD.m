alpha = 100;    
tau = 0;        
K = 3;          
DC = 0;         
init = 1;       
tol = 1e-7;     
[u, u_hat, omega] = MVMD(signal, alpha, tau, K, DC, init, tol);

subplot(K + 1, 1, 1); 
plot(t,channel1, 'r--', 'LineWidth', 1.5); % Channel 1 (real part) 
hold on;
plot(t, channel2, 'b-', 'LineWidth', 1.5); % Channel 2 (imaginary part) 
%title('Original Complex Signal');
%xlabel('Time (s)');
%ylabel('Amplitude');
legend('Channel 1', 'Channel 2');
hold off;

for k = 1:K
    subplot(K + 1, 1, k + 1); 
    plot(t, u(k, :, 1), 'r--', 'LineWidth', 1.5); % Real part 
    hold on;
    plot(t, u(k, :, 2), 'b-', 'LineWidth', 1.5); % Imaginary
%    title(['Mode ', num2str(k)]);
 %   xlabel('Time (s)');
 %   ylabel('Amplitude');
    %legend('Channel 1', 'Channel 2');
    hold off;
end
