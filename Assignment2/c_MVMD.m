alpha = 100;    
tau = 0;        
K = 3;          
DC = 0;         
init = 1;       
tol = 1e-7;     

[u, u_hat, omega] = MVMD(signal, alpha, tau, K, DC, init, tol);

n = length(channel1);
freqs = (0:n-1)*(fs/n);

for k = 1:K
    subplot(K + 1, 1, K- k + 1); 
    plot(freqs(n/2:n), abs(u_hat(k, n/2:n, 1)), 'r--', 'LineWidth', 1.5); 
    hold on;
    plot(freqs(n/2:n), abs(u_hat(k, n/2:n, 2)), 'b-', 'LineWidth', 1.5); 
%    title(['Mode ', num2str(k)]);
 %   xlabel('Time (s)');
 %   ylabel('Amplitude');
    %legend('Channel 1', 'Channel 2');
    hold off;
end
