% Grid and geometry definitions
step_size = 0.25; % Grid step size in cm
Lx = 90; % Total length in X direction (cm)
Ly = 80; % Total length in Y direction (cm)
Nx = round(Lx / step_size) + 1; % Number of grid points in X direction
Ny = round(Ly / step_size) + 1; % Number of grid points in Y direction
V = zeros(Ny, Nx); % Define the potential matrix

% Constant Potential Values
V_outer = 10; % Outer boundary potential
V_C = -1; % Potential of the C-shaped conductor
R = 20 / step_size; % Radius of the C shape in grid units
width_C = round(12 / step_size); % Width of the arms in grid units
gap_C = round(10 / step_size); % Gap between the arms of the C in grid units
xC = round(10 / step_size); % X starting position of C (10 cm margin on the left in grid units)
yC = round(Ny / 2); % Center position of C on the Y-axis

% Boundary conditions: Outer boundaries -> 10V
V(1, :) = V_outer;      % Top boundary
V(Ny, :) = V_outer;     % Bottom boundary
V(:, 1) = V_outer;      % Left boundary
V(:, Nx) = V_outer;     % Right boundary

% Set the C shape boundary to -1V
for j = 1:Ny
    for i = 1:Nx
        % Round part of the C (left half-circle)
        if (i - xC)^2 + (j - yC)^2 <= R^2 && i < xC + R
            V(j, i) = V_C;
        end
        % Upper arm of the C
        if (i >= xC + R) && (i <= xC + R + width_C) && ...
           (j >= yC - gap_C/2 - width_C) && (j <= yC - gap_C/2)
            V(j, i) = V_C;
        end
        % Lower arm of the C
        if (i >= xC + R) && (i <= xC + R + width_C) && ...
           (j >= yC + gap_C/2) && (j <= yC + gap_C/2 + width_C)
            V(j, i) = V_C;
        end
    end
end

% Solve Laplace's equation
max_iter = 5000; % Maximum number of iterations
tolerance = 1e-6; % Error tolerance
for iter = 1:max_iter
    V_old = V;
    for j = 2:Ny-1
        for i = 2:Nx-1
            % Skip fixed boundary regions
            if V(j, i) == V_outer || V(j, i) == V_C
                continue;
            end
            % Iterative solution of Laplace's equation
            V(j, i) = 0.25 * (V(j+1, i) + V(j-1, i) + V(j, i+1) + V(j, i-1));
        end
    end

    % Compute the error
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

% Plot equipotential lines
figure;
subplot(1, 2, 1)
[X, Y] = meshgrid(0:step_size:Lx, 0:step_size:Ly);
contourf(X, Y, V, 20, 'LineColor', 'none');
colorbar;
title('Equipotential Lines');
xlabel('X');
ylabel('Y');

% Compute and plot electric field vectors
[Ex, Ey] = gradient(-V, step_size);
subplot(1, 2, 2);
quiver(X, Y, Ex, Ey, 'AutoScale', 'on', 'AutoScaleFactor', 1.5);
title('Electric Field Vectors');
xlabel('X');
ylabel('Y');
