windowLength = 0.8*fs;  
window = hann(windowLength); 

L = 0.75*windowLength;


[stftMatrix, f, tSTFT] = stft(x, fs, Window = window, OverlapLength=L, FFTLength=2*windowLength);

% Convert STFT to magnitude
magnitudeSTFT = abs(stftMatrix);

figure;
imagesc(tSTFT, f, magnitudeSTFT);  % Convert to decibels
axis xy;
xlabel('Time (s)');
ylabel('Frequency (Hz)');
title('STFT (20 ms hanning window)');
colorbar;
ylim([0 30]); 