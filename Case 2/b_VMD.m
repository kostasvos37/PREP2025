alpha = 100;    
tau = 0;        
K = 3;          
DC = 0;         
init = 1;       
tol = 1e-7;     

[u1, ~, ~] = VMD(channel1, alpha, tau, K, DC, init, tol);
[u2, ~, ~] = VMD(channel2, alpha, tau, K, DC, init, tol);

figure;

subplot(K + 1, 1, 1);
plot(t,channel1, 'r--', 'LineWidth', 1.5); 
hold on;
plot(t, channel2, 'b-', 'LineWidth', 1.5); 
%title('Original Complex Signal');
%xlabel('Time (s)');
%ylabel('Amplitude');
legend('Channel 1', 'Channel 2');
    ylabel('input');
hold off;

for k = 1:K
    subplot(K + 1, 1, k + 1); 
    plot(t, u1(k, :), 'r--', 'LineWidth', 1.5); % Real part 
    hold on;
    plot(t, u2(k, :), 'b-', 'LineWidth', 1.5); % Imaginary part 
%    title(['Mode ', num2str(k)]);
 %   xlabel('Time (s)');
    ylabel(['IMF', num2str(k)]);
    %legend('Channel 1', 'Channel 2');
    hold off;
end
