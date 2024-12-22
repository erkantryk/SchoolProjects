% Part C(b): Transfer Function to Find Output of RC Circuit

frequencies = 1:10:100; % Frekans aralığı [1, 10, ..., 100] Hz
output_amplitude = zeros(size(frequencies));

for idx = 1:length(frequencies)
    f = frequencies(idx);
    omega = 2 * pi * f;
    
    % Transfer fonksiyonu H(jω)
    H_jw = 1 / (1 + 1i * omega * R * C);
    
    % Giriş sinyali genliği 1 olduğu için çıkış genliği H(jω)'nın genliğidir
    output_amplitude(idx) = abs(H_jw);
end

% Çıkış genlik tepkisini çizme
figure;
stem(frequencies, output_amplitude, 'r');
title('Amplitude Response of RC Circuit');
xlabel('Frequency (Hz)');
ylabel('|H(jω)|');
grid on;
