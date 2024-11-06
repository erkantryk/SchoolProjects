% Part C(a): Convolution to Find Output of RC Circuit

clear all; close all; clc;

% Devre parametreleri
R = 1e3; % Direnç (ohm)
C = 1e-6; % Kapasitans (farad)
f0 = 1; % Temel frekans (Hz)
t = -1:0.01:1; % Zaman aralığı

% Giriş sinyali
x_t = cos(2 * pi * f0 * t);

% RC devresi için sistemin impuls yanıtı
h_t = (1/(R*C)) * exp(-t/(R*C)) .* (t >= 0); % Causal response

% Çıkış sinyali (evrişim ile)
y_t_conv = conv(x_t, h_t, 'same') * 0.01; % dt = 0.01

% Çıkış sinyalinin çizimi
figure;
plot(t, y_t_conv, 'b');
title('Output using Convolution');
xlabel('Time (s)');
ylabel('y(t)');
grid on;
