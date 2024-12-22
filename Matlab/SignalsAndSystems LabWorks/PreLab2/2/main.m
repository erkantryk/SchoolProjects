% Define range for n
n = 0:49;

% Generate the impulse response H
H = zeros(1, length(n)); % Preallocate the array
for i = 1:length(n)
    if n(i) < 20 && n(i) > 0
        H(i) = (1/2)^n(i); % Define H as (1/2)^n for 0 < n < 20
    else
        H(i) = 0; % H(n) = 0 otherwise
    end
end

% Define a simple input signal X (e.g., constant 3 for all n)
X = 3 * ones(1, length(n)); % Simple input signal: X(n) = 3 for all n

% Manual convolution of X and H
len_X = length(X);
len_H = length(H);
Y = zeros(1, len_X + len_H - 1); % Preallocate for the result of the convolution

for i = 1:len_X
    for j = 1:len_H
        Y(i + j - 1) = Y(i + j - 1) + X(i) * H(j); % Convolution sum
    end
end

% Truncate the result to length of n (since we are only interested in 0 < n < 50)
Y = Y(1:length(n)); % Adjust length to match the time range

% Plot the results using subplot
figure;

% Plot impulse response H
subplot(3, 1, 1);
stem(n, H(1:length(n))); % Ensure H is plotted up to length(n)
title('Impulse Response H(n)');
xlabel('n');
ylabel('H(n)');

% Plot input signal X
subplot(3, 1, 2);
stem(n, X); % X already has the correct length
title('Input Signal X(n) = 3');
xlabel('n');
ylabel('X(n)');

% Plot output signal Y
subplot(3, 1, 3);
stem(n, Y); % Ensure Y is plotted up to length(n)
title('Output Signal Y(n)');
xlabel('n');
ylabel('Y(n)');

% Display the figure
grid on;
