figure;
subplot(3, 1, 1);

[emd_imfs, emd_residual, emd_info] = emd(x);
hht(emd_imfs, fs, FrequencyLimits=[0 20]);  
title('Hilbert Spectrum - EMD');

subplot(3, 1, 2);
[vmd_imfs, vmd_residual, vmd_info] = vmd(x, ...
    AbsoluteTolerance=5e-06, ...
    RelativeTolerance=0.005, ...
    MaxIterations=500, ...
    NumIMF=5, ...
    InitialIMFs=zeros(70000,5), ...
    PenaltyFactor=50000, ...
    InitialLM=complex(zeros(70001,1)), ...
    LMUpdateRate=0.01, ...
    InitializeMethod='peaks');
hht(vmd_imfs, fs, FrequencyLimits=[0 20]);
title('Hilbert Spectrum - VMD');

[wt, f] = wsst(x, fs); 
subplot(3, 1, 3);
pcolor(t, f, abs(wt));  shading interp;
axis xy;
colormap(jet);
title('Synchrosqueezing Transform with Ridges');
xlabel('Time (s)');
ylabel('Frequency (Hz)');
colorbar;
ylim([0 30]);