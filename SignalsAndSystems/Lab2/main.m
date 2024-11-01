% Read the audio input file
[inputSignal, Fs] = audioread('input.wav'); % Input file is input.wav

% Check if the audio input is mono
if size(inputSignal, 2) > 1
    inputSignal = inputSignal(:, 1); % Convert to mono by taking the first channel
end

% Generate a random integer N between 5 and 15
N = randi([5, 15]);

% Generate the impulse response h
h = zeros(1, N); % Preallocate h with length N
h(:) = 1/N; % h = 1/N for 0 ≤ n < N

% Manual convolution of inputSignal and h
len_X = length(inputSignal);
len_H = length(h);
outputSignal = zeros(1, len_X + len_H - 1); % Preallocate for the result of the convolution

for i = 1:len_X
    for j = 1:len_H
        outputSignal(i + j - 1) = outputSignal(i + j - 1) + inputSignal(i) * h(j); % Convolution sum
    end
end

% Truncate the output signal to match the length of the input signal
outputSignal = outputSignal(1:len_X);

% Plot the input and output signals
figure;

% Plot the input signal
subplot(2, 1, 1);
plot(inputSignal);
title('Input Signal');
xlabel('Sample Number');
ylabel('Amplitude');

% Plot the output signal
subplot(2, 1, 2);
plot(outputSignal);
title('Output Signal');
xlabel('Sample Number');
ylabel('Amplitude');

% Play the original sound
sound(inputSignal, Fs); % Play the input sound
pause(length(inputSignal)/Fs + 1); % Wait for the input sound to finish

% Play the output sound
sound(outputSignal, Fs); % Play the output sound
