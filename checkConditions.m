function [done] = checkConditions(i,maxNumberOfIterations,approximateError,epsilon, f, root)
    done = false;
    if (i >= maxNumberOfIterations)
        done = true;
    end
    
    if (approximateError < epsilon)
        done = true;
    end
    
    if (f(root) == 0)
        done = true;
    end
end

