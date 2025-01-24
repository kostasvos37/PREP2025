u = load('/Users/kostasvos/MATLAB/Projects/Assignment 3/New_Results_K_10/u_subject_1.mat').u;

K = 10; 
channels = 1:5; 
time = 1:size(u, 2);

modes_to_plot = [10, 9, 5, 2 ,1];


base_color = [0, 0, 1];

linwidths = [0.2, 0.2, 0.3, 0.8, 1];
colormap_winter = turbo(length(modes_to_plot)) 
alphas = [0.3, 0.3, 0.5, 0.8, 1];

figure;
for ch = 1:length(channels)
    channel_idx = channels(ch);
    
    subplot(length(channels), 1, ch);
    hold on;
    
    for idx = 1:length(modes_to_plot)
        mode = modes_to_plot(idx);
        signal = squeeze(u(mode, :, channel_idx));
        
        normalized_signal = 2 * ((signal - min(signal)) / (max(signal) - min(signal))) - 1;
        
        plot(time, normalized_signal,'DisplayName', ['Mode ' num2str(mode)],'Color', [colormap_winter(idx,:), alphas(idx)], 'LineWidth', linwidths(idx));
        hold on;
    end
    
    xlabel('Time (s)');
    ylabel('Norm. Amplitude');
    title(['Channel ' num2str(channel_idx)]);
    legend('show', 'Location', 'east');
    hold off;
end
