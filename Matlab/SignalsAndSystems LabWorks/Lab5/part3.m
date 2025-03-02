fs = 200;
f_signal = 50;
t = 0:1/1000:0.1;
x = sin(2*pi*f_signal*t);

n = 0:1/fs:0.1;
x_sampled = sin(2*pi*f_signal*n);

t_recon = 0:1/1000:0.1;
x_recon = interp1(n, x_sampled, t_recon, 'spline');

figure;
plot(t, x, 'b', t_recon, x_recon, 'r--');
title('Reconstruction Using Interpolation');
xlabel('Time (s)'); ylabel('Amplitude');
legend('Original Signal', 'Reconstructed Signal');
