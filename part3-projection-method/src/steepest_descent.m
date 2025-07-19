function [x_history, f_history] = steepest_descent(f, grad_f, x0, gamma, max_iter, tol)
    x = x0(:);  
    x_history = x;
    f_history = f(x);

    for k = 1:max_iter
        grad = grad_f(x);
       
        x_new = x - gamma * grad;
        f_new = f(x_new);

        x_history = [x_history, x_new(:)];
        f_history = [f_history, f_new];

        % Check for convergence
        if norm(grad) < tol % !!! I noticed i forgot to change it back to this after some tests on the previous assignment!!!
            break;
        end

        x = x_new;
    end
end

