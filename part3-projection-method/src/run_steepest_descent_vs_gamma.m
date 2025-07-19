clearvars;
clc;
close all;

f = @(x) (1/3)*x(1)^2 + 3*x(2)^2; 
grad_f = @(x) [(2/3)*x(1);
               6*x(2)];

% Starting Point
x0 = [4, 5];
max_iter = 150;  
tol = 10^(-3);  
gamma1 = 0.1;
gamma2 = 0.3;
gamma3 = 3;
gamma4 = 5;

% Run steepest descent with different steps
[x_history_1, f_history_1] = steepest_descent(f, grad_f, x0, gamma1, max_iter, tol);  
[x_history_2, f_history_2] = steepest_descent(f, grad_f, x0, gamma2, max_iter, tol); 
[x_history_3, f_history_3] = steepest_descent(f, grad_f, x0, gamma3, max_iter, tol);  
[x_history_4, f_history_4] = steepest_descent(f, grad_f, x0, gamma4, max_iter, tol);

% Prepare data for table
gamma_values = {'gamma = 0.1'; 'gamma = 0.3'; 'gamma = 3'; 'gamma = 5'};
final_points = [x_history_1(:, end)'; x_history_2(:, end)'; x_history_3(:, end)'; x_history_4(:, end)'];
final_values = [f(x_history_1(:, end)); f(x_history_2(:, end)); f(x_history_3(:, end)); f(x_history_4(:, end))];

% Create table
results_table = table(gamma_values, final_points(:, 1), final_points(:, 2), final_values, ...
    'VariableNames', {'Gamma', 'Final_x', 'Final_y', 'Final_f_value'});

% Display table
figure;
uitable('Data', table2cell(results_table), ...
        'ColumnName', results_table.Properties.VariableNames, ...
        'Units', 'Normalized', 'Position', [0, 0, 1, 1]);

% Plots
figure;
subplot(4, 1, 1);
plot(1:length(f_history_1), f_history_1, '-o', 'Color', 'r', 'MarkerFaceColor', 'r', 'MarkerSize', 4);
title('Fixed Step gamma = 0.1');
xlabel('Number of Iterations');
ylabel('Function Value');

subplot(4, 1, 2);
plot(1:length(f_history_2), f_history_2, '-x', 'Color', 'g', 'MarkerFaceColor', 'g', 'MarkerSize', 4);
title('Fixed Step gamma = 0.3');
xlabel('Number of Iterations');
ylabel('Function Value');

subplot(4, 1, 3);
plot(1:length(f_history_3), f_history_3, '-s', 'Color', 'b', 'MarkerFaceColor', 'b', 'MarkerSize', 4);
title('Fixed Step gamma = 3');
xlabel('Number of Iterations');
ylabel('Function Value');

subplot(4, 1, 4);
plot(1:length(f_history_4), f_history_4, '-d', 'Color', 'm', 'MarkerFaceColor', 'm', 'MarkerSize', 4);
title('Fixed Step gamma = 5');
xlabel('Number of Iterations');
ylabel('Function Value');

sgtitle('Convergence of Function Value Across Different Fixed gamma values');

  
