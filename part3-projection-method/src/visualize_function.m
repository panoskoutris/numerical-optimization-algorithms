clearvars;
clc;
close all;

[x, y] = meshgrid(-10:0.3:10, -10:0.3:10);  

% Function
f = 1/3 .* x.^2 + 3.* y.^2; 

% 3D Surface Plot
figure;
surf(x, y, f); 
xlabel('x');
ylabel('y');
zlabel('f(x, y)');
title('3D Surface Plot of the Function f(x, y) = 1/3 * x^2 + 3 * y^2');
colorbar;

% Isolines Plot
figure;
contour(x, y, f, 30); 
xlabel('x');
ylabel('y');
title('Isolines Plot of the Function f(x, y) = 1/3 * x^2 + 3 * y^2');
colorbar;