K = 8; % Number of modes
complex_signal = channel1 + 1i * channel2; % Complex signal
[IMF, ORT, NB_ITERATIONS] = emd(complex_signal, 'MAXMODES', K); % Empirical Mode Decomposition

n = length(channel1);
freqs = (0:n-1)*(fs/n);

figure;
for k = 1:K
    subplot(K , 1, K- k + 1); 
    FFT1 = abs(fft(real(IMF(K-k+1, :))));
    plot(freqs(1:n/2), FFT1(1:n/2), 'r--', 'LineWidth', 1.5); 
    hold on;
    FFT2 = abs(fft(imag(IMF(K-k+1, :))));

    plot(freqs(1:n/2), FFT2(1:n/2) , 'b-', 'LineWidth', 1.5);
 %   xlabel('Time (s)');
 %   ylabel('Amplitude');
    %legend('Channel 1', 'Channel 2');
    hold off;
end

xlabel('Time (s)');
