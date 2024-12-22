% Part A: Numeric Fourier Series Calculation without Any Toolboxes

clear all; close all; clc;

T0 = 2; % Sinyalin periyodu
k_vec = -10:10; % Hesaplanacak harmonik sayısı

% Fourier katsayıları için boş bir dizi oluştur
X = zeros(size(k_vec));
w = 2 * pi * k_vec / T0; % Açısal frekanslar

% Katsayı hesaplama: dikdörtgen dalga için manuel sinc fonksiyonu kullanımı
tau = 1; % Darbe süresi
for kk = 1:length(k_vec)
    k = k_vec(kk);
    if k == 0
        X(kk) = tau / T0; % DC bileşeni
    else
        X(kk) = (tau / T0) * (sin(pi * k * tau / T0) / (pi * k * tau / T0)); % Diğer harmonikler
    end
end

% Genlik ve faz spektrumlarını hesapla
amplitude = abs(X);
phase = angle(X);

% Genlik spektrumu çizimi
figure;
stem(w, amplitude, 'o-');
title('Amplitude Spectrum');
xlabel('\omega (rad/s)');
ylabel('|c_k|');
grid on;

% Faz spektrumu çizimi
figure;
stem(w, phase, 'o-');
title('Phase Spectrum');
xlabel('\omega (rad/s)');
ylabel('Phase (radians)');
grid on;
