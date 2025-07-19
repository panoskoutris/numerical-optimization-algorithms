clearvars;
clc;
close all;

f1 = @(x) (x - 2)^2 + x * log(x + 3);
f2 = @(x) exp(-2 * x) + (x - 2)^2;
f3 = @(x) exp(x) * (x^3 - 1) + (x - 1) * sin(x);

a_0 = -1;
b_0 = 3; 
l_values = [0.01, 0.05, 0.1]; % Final interval widths
n = 15; % Fn > (b - a) / l

for i = 1:length(l_values)
    l = l_values(i);

    % Fibonacci Searches
    [f1_a, f1_b] = fibonacciSearch(f1, a_0, b_0, l, n);
    [f2_a, f2_b] = fibonacciSearch(f2, a_0, b_0, l, n);
    [f3_a, f3_b] = fibonacciSearch(f3, a_0, b_0, l, n);

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

function [a_vals, b_vals] = fibonacciSearch(f, a, b, l, n)
    % Initialize Fibonacci ratios
    fibo1 = fibonacci(n - 2) / fibonacci(n);
    fibo2 = fibonacci(n - 1) / fibonacci(n);

    % Initialize interval points
    x1 = a + fibo1 * (b - a);
    x2 = a + fibo2 * (b - a);
    f1 = f(x1);
    f2 = f(x2);

    a_vals = a;
    b_vals = b;
    k = 1;

    while k < n - 2 && (b - a) > l
        if f1 < f2
            b = x2;
            x2 = x1;
            f2 = f1;
            x1 = a + fibonacci(n - k - 2) / fibonacci(n - k) * (b - a);
            f1 = f(x1);
        else
            a = x1;
            x1 = x2;
            f1 = f2;
            x2 = a + fibonacci(n - k - 2) / fibonacci(n - k) * (b - a);
            f2 = f(x2);
        end

        % Store the current values of a and b in the arrays
        a_vals = [a_vals; a];
        b_vals = [b_vals; b];
        k = k + 1;
    end

    % Final adjustment
    epsilon = l / 4;
    x2 = x1 + epsilon;
    if f(x1) > f(x2)
        a = x1;
    else
        b = x2;
    end

    a_vals = [a_vals; a];
    b_vals = [b_vals; b];
end

function fib_num = fibonacci(n)
    if n <= 0
        fib_num = 0;
    elseif n == 1
        fib_num = 1;
    else
        a = 0;
        b = 1;
        count = 2;

        while count <= n
            fib_num = a + b;
            a = b;
            b = fib_num;
            count = count + 1;
        end
    end
end
