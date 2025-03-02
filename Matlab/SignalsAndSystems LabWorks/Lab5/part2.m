fs = 100;
f_signal = 75;
t = 0:1/1000:0.1;
x = sin(2*pi*f_signal*t);

n = 0:1/fs:0.1;
x_sampled = sin(2*pi*f_signal*n);

figure;
plot(t, x, 'b', n, x_sampled, 'ro');
title('Aliasing Effect: Sampling Below Nyquist Rate');
xlabel('Time (s)'); ylabel('Amplitude');
legend('Original Signal', 'Sampled Signal');
