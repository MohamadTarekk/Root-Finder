function [i,root,data,timeElapsed] = newtonRaphson(f, xi, epsilon, maxNumberOfIterations)

tic;

data = 0;
root = 0;
i = 1;

syms x
differentiation = eval(['@(x)' char(diff(f(x)))]);

%x(i+1) = x(i) - f(x) / f'(x)   

while true
    
    root = xi - (f(xi)/differentiation(xi));
    approximateError = abs((root - xi)/root) * 100;

%     data(i,1) = i;
    data(i,1) = xi;
    data(i,2) = f(xi);
    data(i,3) = differentiation(xi);
    data(i,4) = root;
    data(i,5) = approximateError;
    
    %fprintf('%2i  %f  %f  %f \n', i, xi, root, approximateError);   
    
    [done] = checkConditions(i, maxNumberOfIterations, approximateError, epsilon, f, root);
    
    if (done == true)
        break;
    end
    
    i = i + 1;
    xi = root;
    
end
timeElapsed = toc;
end

