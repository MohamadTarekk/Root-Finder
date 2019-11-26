function [i,root,data] = bisection(f,lower, upper, epsilon, maxNumberOfIterations)

data = 0;
root = 0;

if (f(lower) * f(upper) > 0)
    errordlg('There is no change in the sign of the function over this interval.');
else
    root = (lower + upper) / 2;
    approximateError = 100;
    i = 1;
    previousRoot = 0;
    
    while true
        data(i,1) = i;
        data(i,2) = lower;
        data(i,3) = f(lower);
        data(i,4) = upper;
        data(i,5) = f(upper);
        data(i,6) = root;
        data(i,7) = f(root);
        
        if (i > 1)
            approximateError = abs((root - previousRoot)/root) * 100;
        end
        
        data(i,8) = approximateError;

        %fprintf('%2i  %f  %f  %f  %f  %f  %f  %f\n', i, lower, f(lower), upper, f(upper), root, f(root), approximateError);   

        
        if (f(lower) * f(root) < 0)
            upper = root;
        else
            lower = root;
        end
        
        [done] = checkConditions(i, maxNumberOfIterations, approximateError, epsilon, f, root);
        
        if (done == true)
            break;
        end
        
        i = i + 1;
        previousRoot = root;
        root = (lower + upper) / 2;    

    end
    
end


end

