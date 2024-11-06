% Part C(c): Amplitude and Phase Response of Transfer Function

omega = 2 * pi * frequencies;
H_jw = 1 ./ (1 + 1i * omega * R * C);

% Genlik ve faz hesaplama
amplitude_response = abs(H_jw);
phase_response = angle(H_jw);

% Genlik tepkisini çizme
figure;
subplot(2,1,1);
plot(frequencies, amplitude_response, 'b');
title('Amplitude Response of RC Circuit');
xlabel('Frequency (Hz)');
ylabel('|H(jω)|');
grid on;

% Faz tepkisini çizme
subplot(2,1,2);
plot(frequencies, phase_response, 'r');
title('Phase Response of RC Circuit');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
grid on;
