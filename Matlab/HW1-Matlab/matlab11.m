Temperature = 0:5:100;
Kelvin = Temperature + 273.15;
Viscosity = 2.414.*10.^(247.8./(Kelvin-140));
fprintf('Temperature');fprintf('\t Viscosity\n');...
disp([Temperature.',Viscosity.'])