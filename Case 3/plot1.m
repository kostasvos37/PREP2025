
m = squeeze(allData(1, :, :));
fs = 0.72;
% Create a time vector based on the number of time points
num_time_points = size(m, 2);
t = (0:num_time_points-1) * fs;

% Plot the first channel with the correct time axis
figure;
plot(t, m(2, :));
xlabel('Time (seconds)');
ylabel('Signal');
title('Channel 1 Time Series');
grid on;