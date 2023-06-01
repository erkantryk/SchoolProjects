format short g

centimeters = 150:5:2000;
inches = centimeters/2.54;
feets = centimeters/30.48;

cm = centimeters.';
inc = inches.';
ft = feets.';

fprintf('\t Centimeters');fprintf('\t Inches');fprintf('\t\t Feets \n');...
disp([cm,inc,ft])

format default