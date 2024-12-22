% Define range for n (0 < n < 20)
n = 0:19;

% Generate the impulse response H
H = zeros(1, length(n)); % Preallocate the array
for i = 1:length(n)
    if n(i) > 0
        H(i) = (1/3)^n(i); % Define H as (1/3)^n for 0 < n < 20
    else
        H(i) = 0; % H(n) = 0 at n = 0 (or outside range)
    end
end

% Define the input signal X
X = cos(2*pi/5*n); % X(n) = cos(2*pi/5*n) for 0 < n < 20

% Manual convolution of X and H
len_X = length(X);
len_H = length(H);
Y = zeros(1, len_X + len_H - 1); % Preallocate for the result of the convolution

for i = 1:len_X
    for j = 1:len_H
        Y(i + j - 1) = Y(i + j - 1) + X(i) * H(j); % Convolution sum
    end
end

% Truncate the result to 0 < n < 20
Y = Y(1:length(n)); % Adjust length to match n range

% Plot the results using subplot
figure;

% Plot impulse response H
subplot(3, 1, 1);
stem(n, H(1:length(n)));
title('Impulse Response H(n) = (1/3)^n');
xlabel('n');
ylabel('H(n)');

% Plot input signal X
subplot(3, 1, 2);
stem(n, X);
title('Input Signal X(n) = cos(2\pi/5*n)');
xlabel('n');
ylabel('X(n)');

% Plot output signal Y
subplot(3, 1, 3);
stem(n, Y);
title('Output Signal Y(n)');
xlabel('n');
ylabel('Y(n)');

% Display the figure
grid on;
