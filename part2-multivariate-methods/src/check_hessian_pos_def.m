clearvars;
clc;
close all;

% Define the Hessian function
hessian_f = @(x) [20*x(1)^3 * exp(-(x(1)^2 + x(2)^2)) - 12*x(1)^5 * exp(-(x(1)^2 + x(2)^2)) + 4*x(1)^7 * exp(-(x(1)^2 + x(2)^2)), ...
                  -2*x(1)^4 * x(2) * exp(-(x(1)^2 + x(2)^2));
                  -2*x(1)^4 * x(2) * exp(-(x(1)^2 + x(2)^2)), ...
                  -2*x(1)^5 * exp(-(x(1)^2 + x(2)^2)) - 2*x(1)^5 * x(2)^2 * exp(-(x(1)^2 + x(2)^2))];

% Points to evaluate
points = {[0, 0], [-1, 1], [1, -1]};

% Function to check if a matrix is positive definite
is_positive_definite = @(H) all(eig(H) > 0);

% Compute the Hessian for each point and check if it is positive definite
for i = 1:length(points)
    point = points{i};
    hessian = hessian_f(point);
    fprintf('Hessian at (%d, %d):\n', point(1), point(2));
    disp(hessian);
    
    % Check if the Hessian is positive definite
    if is_positive_definite(hessian)
        fprintf('The Hessian at (%d, %d) is positive definite.\n\n', point(1), point(2));
    else
        fprintf('The Hessian at (%d, %d) is NOT positive definite.\n\n', point(1), point(2));
    end
end
