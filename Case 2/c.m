med = load('1365m_interpolated.mat');
med = med(1).data;

channel1 = med(1,:) - mean(med(1,:));
channel2 = med(2,:) - mean(med(2,:));


fs = 4; % 4 Hz
start_time_minutes = 20; 
end_time_minutes = 40; 

start_time_seconds = start_time_minutes * 60;
end_time_seconds = end_time_minutes * 60;

start_index = start_time_seconds * fs + 1; 
end_index = end_time_seconds * fs;

channel1 = channel1(start_index:end_index);
channel2 = channel2(start_index:end_index);

t = (start_index-1:end_index-1) / fs; 
time_vector_minutes = t / 60; 
signal = [channel1; channel2];

plot(time_vector_minutes, channel1, 'r--', 'LineWidth', 1.5); 
hold on;
plot(time_vector_minutes, channel2, 'b-', 'LineWidth', 1.5);  
hold off;

% Add labels and legend
title('Two-Channel Signal');
xlabel('Time (s)');
ylabel('Amplitude');
legend('FHR', 'UC');
grid on;