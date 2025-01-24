K = 3; % Number of modes
complex_signal = channel1 + 1i * channel2; % Complex signal
[IMF, ORT, NB_ITERATIONS] = emd(complex_signal, 'MAXMODES', K); % Empirical Mode Decomposition

figure;

subplot(K + 1, 1, 1); 
plot(t, real(complex_signal), 'r--', 'LineWidth', 1.5); % Channel 1 (real part) 
hold on;
plot(t, imag(complex_signal), 'b-', 'LineWidth', 1.5); % Channel 2 (imaginary part)
legend('Channel 1', 'Channel 2');
hold off;

for k = 1:K
    subplot(K + 1, 1, k + 1); 
    plot(t, real(IMF(K-k+1, :)), 'r--', 'LineWidth', 1.5); % Real part 
    hold on;
    plot(t, imag(IMF(K-k+1, :)), 'b-', 'LineWidth', 1.5); % Imaginary part
    hold off;
end

xlabel('Time (s)');
