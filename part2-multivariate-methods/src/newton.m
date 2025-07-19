function [x_history, f_history] = newton_method(f, grad_f, hessian_f, x0, gamma_type, max_iter, tol, sigma)
    x = x0(:);  % Ensure x0 is a column vector
    x_history = x;
    f_history = f(x);
    
    for k = 1:max_iter
        grad = grad_f(x);
        H = hessian_f(x);
        
        % Check for positive definiteness of Hessian
        if any(eig(H) <= 0)
            error('Hessian is not positive definite.');
        end

        % Check for convergence
        if norm(grad) < tol
            disp('Convergence achieved.');
            break;
        end
       
        % Compute search direction
        d = -H \ grad;  
       
        % Compute step size gamma
        if gamma_type == 1  % Fixed step size
            gamma = 0.5;  % Can dynamically adjust
        elseif gamma_type == 2  % Bisector search
            gamma = bisector_search(f, x, d, 0, 1, 1e-5, 1e-5);
        elseif gamma_type == 3  % Armijo rule
            gamma = armijo_rule(f, grad_f, x, d, sigma);
        else
            gamma = 1;  % Default gamma for Newton's method
        end

        % Update x
        x_new = x + gamma * d;
        f_new = f(x_new);
        
        % Store history
        x_history = [x_history, x_new(:)];
        f_history = [f_history, f_new];

        % Logging
        fprintf('Iteration %d: f(x) = %f, ||grad|| = %f\n', k, f_new, norm(grad));

        % Update x for the next iteration
        x = x_new;
    end
    
    if k == max_iter
        disp('Maximum number of iterations reached.');
    end
end
