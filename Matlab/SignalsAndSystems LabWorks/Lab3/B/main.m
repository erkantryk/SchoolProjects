% Part B: Gibbs Phenomenon

clear all; close all; clc;

N = 99; % Truncated Fourier serisi için harmonik sayısı
n_vec = -N:N; % Katsayı dizisi
T0 = 2; % Sinyalin periyodu
Omega0 = pi; % Temel açısal frekans

% Fourier katsayılarının tanımı
Cn = zeros(size(n_vec)); % Katsayı dizisi başlatılır
for idx = 1:length(n_vec)
    n = n_vec(idx);
    if mod(n, 2) ~= 0 % Sadece tek indeksli terimler (Gibbs için gerekli katsayılar)
        Cn(idx) = 2 / (1i * n * pi);
    end
end

% Zaman aralığı
dt = 0.01;
t = -3:dt:3; % Zaman dizisi tanımlanır
xt = zeros(size(t)); % Sinyal başlatılır

% Fourier serisi toplamı
for m = 1:length(n_vec)
    xt = xt + Cn(m) * exp(1i * n_vec(m) * Omega0 * t); % Fourier serisi toplamı
end

% Gibbs fenomeni ile x_N(t) sinyalini çiz
figure;
plot(t, real(xt), 'b'); % Gerçek kısımla çizim yapılır
title('Gibbs Phenomenon in Truncated Fourier Series');
xlabel('Time (s)');
ylabel('x_N(t)');
grid on;
