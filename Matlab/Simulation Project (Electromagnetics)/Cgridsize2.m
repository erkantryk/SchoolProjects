% Grid ve geometri tanımlamaları
Nx = 45; % X yönünde grid sayısı
Ny = 40; % Y yönünde grid sayısı
V = zeros(Ny, Nx); % Potansiyel matrisini tanımla

% Sabit Potansiyel Değerleri
V_outer = 10; % Dış sınır potansiyeli
V_C = -1; % C şeklinin potansiyeli
R = 10; % C'nin yarıçapı
width_C = 6; % Kolların genişliği
gap_C = 5; % C'nin kolları arasındaki boşluk
xC = 5; % C'nin x başlangıç noktası
yC = Ny / 2; % C'nin orta noktası (y ekseni ortası)

% Sınır koşulları: Dış sınırlar -> 10V
V(1, :) = V_outer;      % Üst sınır
V(Ny, :) = V_outer;     % Alt sınır
V(:, 1) = V_outer;      % Sol sınır
V(:, Nx) = V_outer;     % Sağ sınır

% C şeklinin sınırlarını -1V yapalım
for j = 1:Ny
    for i = 1:Nx
        % C'nin yuvarlak kısmı (sol yarım daire)
        if (i - xC)^2 + (j - yC)^2 <= R^2 && i < xC + R
            V(j, i) = V_C;
        end
        % C'nin üst kolu
        if (i >= xC + R) && (i <= xC + R + width_C) && ...
           (j >= yC - gap_C / 2 - width_C) && (j <= yC - gap_C / 2)
            V(j, i) = V_C;
        end
        % C'nin alt kolu
        if (i >= xC + R) && (i <= xC + R + width_C) && ...
           (j >= yC + gap_C / 2) && (j <= yC + gap_C / 2 + width_C)
            V(j, i) = V_C;
        end
    end
end

% Laplace denkleminin çözümü
max_iter = 5000; % Maksimum iterasyon
tolerance = 1e-6; % Hata toleransı
for iter = 1:max_iter
    V_old = V;
    for j = 2:Ny-1
        for i = 2:Nx-1
            % Sınır koşullarındaki sabit bölgeleri atla
            if V(j, i) == V_outer || V(j, i) == V_C
                continue;
            end
            % Laplace denkleminin iteratif çözümü
            V(j, i) = 0.25 * (V(j+1, i) + V(j-1, i) + V(j, i+1) + V(j, i-1));
        end
    end
    
    % Hata hesaplama
    error = max(max(abs(V - V_old)));
    if error < tolerance
        fprintf('Solution converged in %d iterations (Tolerance: %.1e).\n', iter, tolerance);
        break;
    end
end

if iter == max_iter
    fprintf('Solution did not converge in the maximum number of iterations (%d). Tolerance: %.1e\n', max_iter, tolerance);
end

% Grafikler
figure;

% Eşpotansiyel çizgileri
subplot(1, 2, 1);
[X, Y] = meshgrid(1:Nx, 1:Ny);
contourf(X, Y, V, 20, 'LineColor', 'none');
colorbar;
title('Equipotential Lines');
set(gca, 'XTick', [], 'YTick', []); % Eksen üzerindeki sayılar kaldırıldı

% Sol tarafta boşluk bırakmak için subplot'un pozisyonunu ayarla
pos = get(gca, 'Position');
pos(1) = pos(1) + 0.1; % X eksenini sağa kaydır
set(gca, 'Position', pos);

% Elektrik alanı hesaplama ve çizimi
[Ex, Ey] = gradient(-V);
subplot(1, 2, 2);
quiver(X, Y, Ex, Ey, 'AutoScale', 'on', 'AutoScaleFactor', 1.5);
title('Electric Field Vectors');
set(gca, 'XTick', [], 'YTick', []); % Eksen üzerindeki sayılar kaldırıldı

% Genel ayarlar (isteğe bağlı)
set(gcf, 'Position', [100, 100, 1200, 500]); % Figür boyutunu ayarla
