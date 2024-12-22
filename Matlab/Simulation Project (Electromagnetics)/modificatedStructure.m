Nx = 61; 
Ny = 41; 
V = zeros(Ny, Nx); 
V_outer = 10; 
V_C = -1; 
R = 10; 
width_C = 8; 
gap_C = 4; 
xC = 20; 
yC = Ny / 2; 
V(1, :) = V_outer;      
V(Ny, :) = V_outer;     
V(:, 1) = V_outer;     
V(:, Nx) = V_outer;     
for j = 1:Ny
    for i = 1:Nx
        if (i - xC)^2 + (j - yC)^2 <= R^2 && i < xC + R
            V(j, i) = V_C;
        end
        if (i >= xC + R) && (i <= xC + R + width_C) && (j >= yC + gap_C / 2)
            V(j, i) = V_C;
        end
        if (i >= xC + R) && (i <= xC + R + width_C) && (j <= yC - gap_C / 2)
            V(j, i) = V_C;
        end
    end
end
max_iter = 5000; 
tolerance = 1e-6; 
for iter = 1:max_iter
    V_old = V;
    for j = 2:Ny-1
        for i = 2:Nx-1
            if V(j, i) == V_outer || V(j, i) == V_C
                continue;
            end
            V(j, i) = 0.25 * (V(j+1, i) + V(j-1, i) + V(j, i+1) + V(j, i-1));
        end
    end
    error = max(max(abs(V - V_old)));
    if error < tolerance
        fprintf('Solution converged in %d iterations.\n', iter);
        fprintf('Error tolerance achieved: %.6e\n', error);
        break;
    end
end
if iter == max_iter
    fprintf('Solution did not converge within the maximum number of iterations (%d).\n', max_iter);
    fprintf('Final error: %.6e\n', error);
end
figure;
subplot(1, 2, 1)
[X, Y] = meshgrid(0:Nx-1, 0:Ny-1);
contourf(X, Y, V, 20, 'LineColor', 'none');
colorbar;
title('Equipotential Lines');
xlabel('X');
ylabel('Y');
xlim([0 Nx-1]); 
ylim([0 Ny-1]); 
[Ex, Ey] = gradient(-V);
subplot(1, 2, 2)
quiver(X, Y, Ex, Ey);
title('Electric Field Vectors');
xlabel('X');
ylabel('Y');
xlim([0 Nx-1]); 
ylim([0 Ny-1]); 
