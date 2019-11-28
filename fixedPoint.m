function [i,root,data,timeElapsed] = fixedPoint(f, g, xi, epsilon, maxNumberOfIterations)

tic;

data = 0;
root = 0;
i = 1;

if f(xi) == 0
    root = xi;
    data(1,1) = xi;
    data(1,2) = xi;
    data(1,3) = 0;
    timeElapsed = toc;
    return;
end

syms x
differentiation = eval(['@(x)' char(diff(g(x)))]);
result = abs(differentiation(xi));

if result >= 1
    i = 0;
    timeElapsed = toc;
    errordlg('Functions diverges, Change g(x).');
    return;
end

while true
    
    root = g(xi);
    approximateError = abs((root - xi)/root) * 100;
    
%     data(i,1) = i;
    data(i,1) = xi;
    data(i,2) = root;
    data(i,3) = approximateError;
    
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

