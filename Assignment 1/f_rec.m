
emd_reconstructed = sum(emd_imfs, 2) + emd_residual; % Sum of IMFs and residual from EMD

% VMD reconstruction
vmd_reconstructed = sum(vmd_imfs, 2) + vmd_residual; % Sum of VMD modes

sst_reconstructed = component1 + component2;
figure;
% Plot EMD reconstruction
subplot(4, 1, 1);
plot(t, x, 'k', 'LineWidth', 1.5); % Original signal
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;


subplot(4,1,2);
plot(t, emd_reconstructed, 'b', 'LineWidth', 1.5); % EMD reconstructed signal
title('Reconstruction using EMD');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Plot VMD reconstruction
subplot(4,1,3);
plot(t, vmd_reconstructed, 'b', 'LineWidth', 1.5); % EMD reconstructed signal
title('Reconstruction using VMD');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Plot SST reconstruction

subplot(4,1,4);
plot(t, sst_reconstructed, 'b', 'LineWidth', 1.5); % EMD reconstructed signal
title('Reconstruction using SST');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;


sgtitle('Comparison of Signal Reconstructions');