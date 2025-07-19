clearvars;
clc;
close all;

f = @(x) x(1)^5 * exp(-(x(1)^2 + x(2)^2));
grad_f = @(x) [5*x(1)^4 * exp(-(x(1)^2 + x(2)^2)) - 2*x(1)^6 * exp(-(x(1)^2 + x(2)^2));
               -2*x(1)^5 * x(2) * exp(-(x(1)^2 + x(2)^2))];
hessian_f = @(x) [20*x(1)^3 * exp(-(x(1)^2 + x(2)^2)) - 12*x(1)^5 * exp(-(x(1)^2 + x(2)^2)) + 4*x(1)^7 * exp(-(x(1)^2 + x(2)^2)), ...
                  -2*x(1)^4 * x(2) * exp(-(x(1)^2 + x(2)^2));
                  -2*x(1)^4 * x(2) * exp(-(x(1)^2 + x(2)^2)), ...
                  -2*x(1)^5 * exp(-(x(1)^2 + x(2)^2)) - 2*x(1)^5 * x(2)^2 * exp(-(x(1)^2 + x(2)^2))];

% Each time I choose 1
x0 = [0, 0];   % First starting point
x0 = [-1, 1];  % Second starting point
x0 = [1, -1];   % Third starting point

max_iter = 150;
tol = 10^(-3); % Tolerance
sigma = 0.1; % Constant for the Armijo rule

% Run Levenberg-Marquardt with different step choices
[x_history_1, f_history_1] = levenberg_marquardt(f, grad_f, hessian_f, x0, 1, max_iter, tol, sigma);  % Fixed step
[x_history_2, f_history_2] = levenberg_marquardt(f, grad_f, hessian_f, x0, 2, max_iter, tol, sigma);  % Line search
[x_history_3, f_history_3] = levenberg_marquardt(f, grad_f, hessian_f, x0, 3, max_iter, tol, sigma);  % Armijo rule

% Prepare data for the table
method_names = {'Fixed Step'; 'Bisection Search'; 'Armijo Rule'};
final_points = [x_history_1(:, end)'; x_history_2(:, end)'; x_history_3(:, end)'];
final_values = [f(x_history_1(:, end)); f(x_history_2(:, end)); f(x_history_3(:, end))];

% Create a table
results_table = table(method_names, final_points(:, 1), final_points(:, 2), final_values, ...
    'VariableNames', {'Method', 'Final_x', 'Final_y', 'Final_f_value'});

% Display the table in a figure window
figure;
uitable('Data', table2cell(results_table), ...
        'ColumnName', results_table.Properties.VariableNames, ...
        'Units', 'Normalized', 'Position', [0, 0, 1, 1]);

% Plots
figure;
subplot(3, 1, 1);
plot(1:length(f_history_1), f_history_1, '-o');
title('Fixed Step');
xlabel('Number of Iterations');
ylabel('Function Value');

subplot(3, 1, 2);
plot(1:length(f_history_2), f_history_2, '-x');
title('Bisection Search');
xlabel('Number of Iterations');
ylabel('Function Value');

subplot(3, 1, 3);
plot(1:length(f_history_3), f_history_3, '-s');
title('Armijo Rule');
xlabel('Number of Iterations');
ylabel('Function Value');

sgtitle('Convergence of Function Value Across Methods (L - M)');