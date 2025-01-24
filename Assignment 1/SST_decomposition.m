[wt, f] = wsst(x, fs); % Compute SST

[~, ridge_freqs] = wsstridge(wt, f, 1, 'NumRidges', 2); % Extract ridges

figure;
pcolor(t, f, abs(wt)); shading interp;
axis xy;
colormap(jet);
title('Synchrosqueezing Transform with Ridges');
xlabel('Time (s)');
ylabel('Frequency (Hz)');
colorbar;
ylim([0 30])

figure;

component1 = iwsst(wt, ridge_freqs(:, 1));
component2 = iwsst(wt, ridge_freqs(:, 2));

figure;
subplot(2, 1, 1);
plot(t, component1, 'r'); title('Component 1');
subplot(2, 1, 2);
plot(t, component2, 'b'); title('Component 2');