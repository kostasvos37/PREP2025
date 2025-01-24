
figure;

% Plot c1
subplot(3, 1, 1);
plot(t, c1);
xlabel('Time [s]');
ylabel('Amplitude');
title('Signal c1');
grid on;

% Plot c2
subplot(3, 1, 2);
plot(t, c2);
xlabel('Time [s]');
ylabel('Amplitude');
title('Signal c2');
grid on;

% Plot x
subplot(3, 1, 3);
plot(t, x);
xlabel('Time [s]');
ylabel('Amplitude');
title('Total Signal x');
grid on;

sgtitle('Signals Overview'); 