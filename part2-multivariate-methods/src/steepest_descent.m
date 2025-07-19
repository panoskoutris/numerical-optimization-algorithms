function [x_history, f_history] = steepest_descent(f, grad_f, x0, gamma_type, max_iter, tol, sigma)
    x = x0(:);  
    x_history = x;
    f_history = f(x);

    for k = 1:max_iter
        grad = grad_f(x);
        d = -grad;

        if gamma_type == 1  % Fixed step size
            gamma = 0.4;
        elseif gamma_type == 2  % Bisector search
            gamma = bisection(f, x, d, 0, 1, 1e-5, 1e-5);
        elseif gamma_type == 3  % Armijo rule
            gamma = armijo_rule(f, grad_f, x, d, sigma);
        end

        x_new = x + gamma * d;
        f_new = f(x_new);

        x_history = [x_history, x_new(:)];
        f_history = [f_history, f_new];

        % Check for convergence
        if norm(grad) < tol
            break;
        end

        x = x_new;
    end
end