clearvars;
clc;
close all;

f1 = @(x) (x - 2)^2 + x * log(x + 3);
f2 = @(x) exp(-2 * x) + (x - 2)^2;
f3 = @(x) exp(x) * (x^3 - 1) + (x - 1) * sin(x);

a_0 = -1; 
b_0 = 3;
l_values = [0.01, 0.05, 0.1]; 

for i = 1:length(l_values)
    l = l_values(i);

    % Derivative Searches
    [f1_a, f1_b] = derivativeSearch(f1, a_0, b_0, l);
    [f2_a, f2_b] = derivativeSearch(f2, a_0, b_0, l);
    [f3_a, f3_b] = derivativeSearch(f3, a_0, b_0, l);

    % Plot for f1
    figure;
    plot(1:length(f1_a), f1_a, 'r', 'LineWidth', 1.5); hold on;
    plot(1:length(f1_b), f1_b, 'b', 'LineWidth', 1.5);
    xlabel('Iteration (k)');
    ylabel('Interval Bounds');
    title(['Interval Bounds for f1(x) with l = ', num2str(l)]);
    legend('a_k', 'b_k');
    grid on;

    % Plot for f2
    figure;
    plot(1:length(f2_a), f2_a, 'g', 'LineWidth', 1.5); hold on;
    plot(1:length(f2_b), f2_b, 'm', 'LineWidth', 1.5);
    xlabel('Iteration (k)');
    ylabel('Interval Bounds');
    title(['Interval Bounds for f2(x) with l = ', num2str(l)]);
    legend('a_k', 'b_k');
    grid on;

    % Plot for f3
    figure;
    plot(1:length(f3_a), f3_a, 'b', 'LineWidth', 1.5); hold on;
    plot(1:length(f3_b), f3_b, 'c', 'LineWidth', 1.5);
    xlabel('Iteration (k)');
    ylabel('Interval Bounds');
    title(['Interval Bounds for f3(x) with l = ', num2str(l)]);
    legend('a_k', 'b_k');
    grid on;
end

function [a_vals, b_vals] = derivativeSearch(f, a, b, l)
    syms x;
    f_sym = f(x); 
    f_prime = diff(f_sym, x);

    a_vals = a; 
    b_vals = b; 

    while (b - a) > l
        xk = (a + b) / 2;
        fk = double(subs(f_prime, x, xk)); 
        
        if fk < 0
            a = xk;
        elseif fk > 0
            b = xk;
        else
            break; 
        end

        
        a_vals = [a_vals; a];
        b_vals = [b_vals; b];
    end
end
