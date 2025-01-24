figure;
[emd_imfs, emd_residual, emd_info] = emd(x);
hht(emd_imfs(:, 4:10), fs, FrequencyLimits=[0 20]); 
title('EMD');

figure;
[vmd_imfs, vmd_residual, vmd_info] = vmd(x, ...
    AbsoluteTolerance=5e-06, ...
    RelativeTolerance=0.005, ...
    MaxIterations=500, ...
    NumIMF=5, ...
    InitialIMFs=zeros(70000,5), ...
    PenaltyFactor=5000000, ...
    InitialLM=complex(zeros(70001,1)), ...
    LMUpdateRate=0.01, ...
    InitializeMethod='peaks');
hht(vmd_imfs, fs, FrequencyLimits=[0 20]);
title('VMD');

figure
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