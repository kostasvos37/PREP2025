fs = 10000;               
T = 7;                    
t = linspace(0, T, T*fs); 

c1 = sin(2 * pi * (10 * t + (2 / pi) * sin(0.9 * pi * t))); % First component
c2 = cos(2 * pi * (t.^2 + t + cos(t)));                     % Second component
x = c1 + c2;              % Total signal

noise_variance = 2;       
noise = randn(size(x)); 
x_noisy = x + noise;    


c1 = awgn(c1, 10);
c2 = awgn(c2, 10);

x = awgn(x, 10);

variance = 2;
noise = sqrt(variance) * randn(size(x));

x = x + noise;
