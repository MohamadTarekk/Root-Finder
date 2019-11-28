function [i,root,data,timeElapsed] = bisection(f,lower, upper, epsilon, maxNumberOfIterations)

tic;

data = 0;
root = 0;
    
if (f(lower) * f(upper) > 0)
    i = 0;
    timeElapsed = toc;
    errordlg('There is no change in the sign of the function over this interval.');
    return;
elseif f(lower) == 0
    i = 1;
    root = lower;
    data(1,1) = lower;
    data(1,2) = f(lower);
    data(1,3) = upper;
    data(1,4) = f(upper);
    data(1,5) = lower;
    data(1,6) = f(lower);
    data(1,7) = 0;
    timeElapsed = toc;
    return;
elseif f(upper) == 0
    i = 1;
    root = upper;
    data(1,1) = lower;
    data(1,2) = f(lower);
    data(1,3) = upper;
    data(1,4) = f(upper);
    data(1,5) = upper;
    data(1,6) = f(upper);
    data(1,7) = 0;
    timeElapsed = toc;
    return;
else
    root = (lower + upper) / 2;
    approximateError = 100;
    i = 1;
    previousRoot = 0;
    
    while true
%         data(i,1) = i;
        data(i,1) = lower;
        data(i,2) = f(lower);
        data(i,3) = upper;
        data(i,4) = f(upper);
        data(i,5) = root;
        data(i,6) = f(root);
        
        if (i > 1)
            approximateError = abs((root - previousRoot)/root) * 100;
        end
        
        data(i,7) = approximateError;

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

timeElapsed = toc;
end

