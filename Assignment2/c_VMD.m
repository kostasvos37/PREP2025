alpha = 100;    
tau = 0;        
K = 3;          
DC = 0;         
init = 1;       
tol = 1e-7;     

[u1, ~, ~] = VMD(channel1, alpha, tau, K, DC, init, tol);
[u2, ~, ~] = VMD(channel2, alpha, tau, K, DC, init, tol);

figure;

n = length(channel1);
freqs = (0:n-1)*(fs/n);

for k = 1:K
    subplot(K, 1, K- k + 1); 
    fft1 = fft(u1(k,:));
    plot(freqs(1:n/2), abs(fft1(1:n/2)),  'r--', 'LineWidth', 1.5); 
    hold on;
    fft2 = fft(u2(k,:));
    plot(freqs(1:n/2), abs(fft2(1:n/2)), 'b-', 'LineWidth', 1.5); 
%    title(['Mode ', num2str(k)]);
 %   xlabel('Time (s)');
    ylabel(['IMF', num2str(k)]);
    %legend('Channel 1', 'Channel 2');
    hold off;
end

