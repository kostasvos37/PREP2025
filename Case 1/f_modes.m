figure;
for i = 1:size(emd_imfs, 2)
    subplot(size(emd_imfs, 2) + 1, 1, i);
    plot(t, emd_imfs(:, i));
    title(['EMD IMF ', num2str(i)]);
end

subplot(size(emd_imfs, 2) + 1, 1, size(emd_imfs, 2)+1);
plot(t, emd_residual);
title('EMD Residual');



num_modes = size(vmd_imfs, 1);  % Number of modes
figure;
for i = 1:size(vmd_imfs, 2)
    subplot(size(vmd_imfs, 2) + 1, 1, i);
    plot(t, vmd_imfs(:, i));
    title(['VMD IMF ', num2str(i)]);
end


subplot(size(vmd_imfs, 2) + 1, 1, size(vmd_imfs, 2)+1);
plot(t, vmd_residual);
title('VMD Residual');

%SST reconstruction
[wt, f] = wsst(x, fs); % Compute SST

[~, ridge_freqs] = wsstridge(wt, f, 1, 'NumRidges', 2); % Extract ridges
component1 = iwsst(wt, ridge_freqs(:, 1));
component2 = iwsst(wt, ridge_freqs(:, 2));

figure;
subplot(2, 1, 1);
plot(t, component1, 'r'); title('Component 1');
subplot(2, 1, 2);
plot(t, component2, 'b'); title('Component 2');
