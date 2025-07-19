clearvars;
clc;
close all;

[x, y] = meshgrid(-3.5:0.15:3.5, -3.5:0.15:3.5);  

% Function
f = x.^5 .* exp(-(x.^2 + y.^2));

% 3D Surface Plot
figure;
surf(x, y, f); 
xlabel('x');
ylabel('y');
zlabel('f(x, y)');
title('3D Surface Plot of the Function f(x, y) = x^5 * exp(-(x^2 + y^2))');
colorbar;

% Isolines Plot
figure;
contour(x, y, f, 30); 
xlabel('x');
ylabel('y');
title('Isolines Plot of the Function f(x, y) = x^5 * exp(-(x^2 + y^2))');
colorbar;