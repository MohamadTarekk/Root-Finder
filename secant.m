function [i,root,data,timeElapsed] = secant(f, xiMinusOne, xi, epsilon, maxNumberOfIterations)

tic;

data = 0;
root = 0;
i = 1;

while true
    
    root = xi - ((f(xi)*(xiMinusOne - xi))/(f(xiMinusOne) - f(xi)));
    approximateError = abs((root - xi)/root) * 100;

%     data(i,1) = i;
    data(i,1) = xiMinusOne;
    data(i,2) = f(xiMinusOne);
    data(i,3) = xi;
    data(i,4) = f(xi);
    data(i,5) = root;
    data(i,6) = approximateError;
    
    %fprintf('%2i  %f  %f  %f  %f  %f  %f \n', i, xiMinusOne, f(xiMinusOne), xi, f(xi), root, approximateError);   
    
    [done] = checkConditions(i, maxNumberOfIterations, approximateError, epsilon, f, root);
    
    if (done == true)
        break;
    end
    
    i = i + 1;
    xiMinusOne = xi;
    xi = root;
    
end
timeElapsed = toc;
end
