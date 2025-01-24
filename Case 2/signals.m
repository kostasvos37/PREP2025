fs = 100; 
t = 0:1/fs:1-1/fs; 


f1 = 2;  % 2 Hz
f2 = 20; % 20 Hz
f3 = 50; % 50 Hz

snr_target = 40;

channel1 = awgn(cos(2*pi*f1*t) + 0.2*cos(2*pi*f3*t), snr_target);

channel2 = awgn(cos(2*pi*f1*t) + 0.5*cos(2*pi*f2*t) + 0.2*cos(2*pi*f3*t), snr_target);

signal = [channel1; channel2];

plot(t, channel1, 'r--', 'LineWidth', 1.5); 
hold on;
plot(t, channel2, 'b-', 'LineWidth', 1.5);  
hold off;

title('Two-Channel Signal');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Channel 1: 2 Hz and 50 Hz', 'Channel 2: 2 Hz, 20 Hz, and 50 Hz');
grid on;