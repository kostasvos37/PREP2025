alpha = 100;    
tau = 0;        
K = 3;          
DC = 0;         
init = 1;       
tol = 1e-7;     

% Apply VMD to each channel
[u1, ~, ~] = VMD(channel1, alpha, tau, K, DC, init, tol);
[u2, ~, ~] = VMD(channel2, alpha, tau, K, DC, init, tol);

figure;

subplot(4, 3, 1); 
plot(t, channel1, 'r--', 'LineWidth', 1.5); % Channel 1 (real part)
hold on;
plot(t, channel2, 'b-', 'LineWidth', 1.5); % Channel 2 (imaginary part)
legend('Channel 1', 'Channel 2');
ylabel('Input');
hold off;

for k = 1:K
    subplot(4, 3, 1 + k * 3);
    plot(t, u1(k, :), 'r--', 'LineWidth', 1.5); % Real part of mode k
    hold on;
    plot(t, u2(k, :), 'b-', 'LineWidth', 1.5); % Imaginary part of mode k
    ylabel(['IMF', num2str(k)]);
    hold off;
end

%MVMD
alpha = 100;    
tau = 0;        
K = 3;          
DC = 0;         
init = 1;       
tol = 1e-7;     

[u, u_hat, omega] = MVMD(signal, alpha, tau, K, DC, init, tol);

subplot(4, 3, 2); 
plot(t,channel1, 'r--', 'LineWidth', 1.5); % Channel 1 (real part)
hold on;
plot(t, channel2, 'b-', 'LineWidth', 1.5); % Channel 2 
%title('Original Complex Signal');
%xlabel('Time (s)');
%ylabel('Amplitude');
legend('Channel 1', 'Channel 2');
hold off;

for k = 1:K
    subplot(4, 3, 2 + k * 3); 
    plot(t, u(k, :, 1), 'r--', 'LineWidth', 1.5); % Real part
    hold on;
    plot(t, u(k, :, 2), 'b-', 'LineWidth', 1.5); % Imaginary part
%    title(['Mode ', num2str(k)]);
 %   xlabel('Time (s)');
 %   ylabel('Amplitude');
    %legend('Channel 1', 'Channel 2');
    hold off;
end

%MEMD

K = 3; 
complex_signal = channel1 + 1i * channel2; % Complex signal

[IMF, ORT, NB_ITERATIONS] = emd(complex_signal, 'MAXMODES', K); 


subplot(K + 1, 3, 3); % One row for the original signal
plot(t, real(complex_signal), 'r--', 'LineWidth', 1.5); % Channel 1 (real part) 
hold on;
plot(t, imag(complex_signal), 'b-', 'LineWidth', 1.5); % Channel 2 (imaginary part)
legend('Channel 1', 'Channel 2');
hold off;

for k = 1:K
    subplot(K + 1, 3, 3 + k *3); 
    plot(t, real(IMF(K-k+1, :)), 'r--', 'LineWidth', 1.5); % Real part
    hold on;
    plot(t, imag(IMF(K-k+1, :)), 'b-', 'LineWidth', 1.5); % Imaginary part
    hold off;
end

xlabel('Time (s)');
