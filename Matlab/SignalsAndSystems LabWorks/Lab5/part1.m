fs_orig = 1000;
f_signal = 50;
t = 0:1/fs_orig:0.1;
x = sin(2*pi*f_signal*t);

fs1 = 200;
fs2 = 100;
fs3 = 50;

n1 = 0:1/fs1:0.1; x1 = sin(2*pi*f_signal*n1);
n2 = 0:1/fs2:0.1; x2 = sin(2*pi*f_signal*n2);
n3 = 0:1/fs3:0.1; x3 = sin(2*pi*f_signal*n3);

figure;
subplot(3,1,1); plot(t, x, 'b', n1, x1, 'ro'); title('Above Nyquist Rate');
subplot(3,1,2); plot(t, x, 'b', n2, x2, 'ro'); title('At Nyquist Rate');
subplot(3,1,3); plot(t, x, 'b', n3, x3, 'ro'); title('Below Nyquist Rate');
