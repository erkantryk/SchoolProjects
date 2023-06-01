format long g

temperature = 0:5:100;
kelvin = temperature+273.15;
c1 = (1.458)*(10^(-6));
c2 = 110.4;

T = kelvin.^(1/2);
a = c1*T;
b = (kelvin+c2)/kelvin;

viscosity = a/b;

fprintf('\t\t\t\t\t Temperature');fprintf('\t Viscosity\n');
disp([temperature.',viscosity.'])

format default