function [error, method, f, g, x, epsilon, max_iter] = readfile()
%{
file format:
bisection       ->  root finding method
x^2 + 8*x - 7   ->  function
sqrt(-8*x + 7)  ->  G(x) (only in fixed point method)
5 9             ->  bounds OR initial guess(es) depending on the method
1e06            ->  epsilon
100             ->  maximum number of iterations
%}

% open file
filter = {'.txt'};
[name, path] = uigetfile(filter);
directory = [path name];
if length(directory) == 2
    fid = -1;
else
    fid = fopen(directory);
end
% check if file exists
if (fid < 0)
    error = 'Yuo did not choose a file';
    method = '';
    f = '';
    g = '';
    x = '';
    epsilon = '';
    max_iter = '';
    return
end
% read input data
method = fgetl(fid);
f = fgetl(fid);
if strcmp(method, 'fixed point')
    g = fgetl(fid);
else
    g = '';
end
Xin = fgetl(fid);
epsilon = fgetl(fid);
max_iter = fgetl(fid);
% close file
fclose(fid);

% validate inputs
% check for miaaing fields
if (f == -1)
    error = 'F(x) is missing';
    return
elseif (g == -1)
    error = 'G(x) is missing';
    return
elseif (Xin == -1)
    error = 'Initial guess(es) are missing';
    return;
end
% validate initial guess(es)
x = str2num(Xin);
method = lower(method);
switch method
    case {'fixed point', 'newton raphson'}
        if length(x) ~= 1
            error = 'There must be exactly 1 initial guess';
            return
        end
    case {'bisection', 'regula falsi', 'secant'}
        if length(x) ~= 2
            error = 'There must be exactly 2 initial guesses';
            return
        end
    otherwise
        error = 'Invalid root finding method';
        return
end
x = Xin;
% validate epsilon
if epsilon == -1
    epsilon = '0.00001';
else
    es = str2num(epsilon);
    if length(es) ~= 1
        error = 'Invalid accuracy format';
        return
    end
    if (es < 0) || (es > 1)
        error = 'Invalid accuracy format';
        return
    end
end
% validate max_iter
if max_iter == -1
    max_iter = '50';
else
    i = str2num(epsilon);
    if length(i) ~= 1
        error = 'Invalid number of maximum iterations';
        return
    end
    if (i < 0) || (i > 1)
        error = 'Invalid number of maximum iterations';
        return
    end
end

% No errors
error = 0;

end