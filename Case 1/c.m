
windowLengths = [20, 200, 800];  % Short, medium, long windows
overlapFactor = 0.75;  % Overlap percentage

figure;
for i = 1:length(windowLengths)
    windowLength = fs* windowLengths(i)/1000;
    window = hamming(windowLength); 
    overlap = round(windowLength * overlapFactor);
    
    [stftMatrix, f, tSTFT] = stft(x, fs, 'Window', window, 'OverlapLength', overlap);
    
    magnitudeSTFT = abs(stftMatrix);
    
    subplot(length(windowLengths), 1, i);
    imagesc(tSTFT, f, (magnitudeSTFT));  
    axis xy;
    xlabel('Time (s)');
    ylabel('Frequency (Hz)');
    title(['Window Length (ms) = ', num2str(windowLength)]);
    colorbar;
    
    ylim([0 50]);  
end

sgtitle('STFT with Different Window Lengths');
