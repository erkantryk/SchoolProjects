% Main program

% Create the vectors
x = ones(1, 10); % Vector with 10 consecutive ones
h = ones(1, 5);  % Vector with 5 consecutive ones

% Use the custom convolution function
y = my_convolution(x, h); 

% Define the range for n
n = 0:length(y)-1; % Length of the convolution result

% Create the plots
figure;

% Plot vector x
subplot(3, 1, 1);
stem(0:length(x)-1, x, 'filled');
title('Vector x (10 Consecutive Ones)');
xlabel('n');
ylabel('Amplitude');
xlim([-1 10]);
grid on;

% Plot vector h
subplot(3, 1, 2);
stem(0:length(h)-1, h, 'filled');
title('Vector h (5 Consecutive Ones)');
xlabel('n');
ylabel('Amplitude');
xlim([-1 5]);
grid on;

% Plot the convolution result
subplot(3, 1, 3);
stem(n, y, 'filled');
title('Convolution Result y = my_convolution(x, h)');
xlabel('n');
ylabel('Amplitude');
xlim([-1 30]);
grid on;

% Display all plots
sgtitle('Convolution of Discrete-Time Signals');
