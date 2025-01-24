fs = 10000;               
T = 7;                    
t = linspace(0, T, T*fs); 

c1 = sin(2 * pi * (10 * t + (2 / pi) * sin(0.9 * pi * t))); % First component
c2 = cos(2 * pi * (t.^2 + t + cos(t)));                     % Second component
x = c1 + c2;              % Total signal