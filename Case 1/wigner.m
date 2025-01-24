[d,f,t1] = wvd(x, fs, "smoothedPseudo");

figure;
imagesc(t1, f, d);  
axis xy;
xlabel('Time (s)');
ylabel('Frequency (Hz)');
title('Smoothed Wigner Ville Spectrum');
colorbar;
ylim([0 30]);  