function gamma = bisector_search(f, x, d, a, b, l, e)
    max_iterations = 50;
    for iter = 1:max_iterations
        if (b - a) <= l
            break;
        end

        x1 = (a + b) / 2 - e;
        x2 = (a + b) / 2 + e;
        f1 = f(x + x1 * d);
        f2 = f(x + x2 * d);

        if f1 < f2
            b = x2;
        else
            a = x1;
        end
    end
    gamma = (a + b) / 2;  
end

