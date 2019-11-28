function [data, i, done, error] = trap_bisection_start(f, xl, xu)
% check if there are roots in the interval
fl = f(xl);
fu = f(xu);
error = false;
if(fl*fu > 0)
    data = [];
    i = [];
    done = 0;
    error = true;
    errordlg('There is no change in the sign of the function over this interval.');
    return;
elseif(fl == 0)
    data(1,1) = xl;
    data(1,2) = fl;
    data(1,3) = xu;
    data(1,4) = fu;
    data(1,5) = xl;
    data(1,6) = fl;
    data(1,7) = 0;
    i = 1;
    done = 1;
    error = false;
    return;
elseif(fu == 0)
    data(1,1) = xl;
    data(1,2) = fl;
    data(1,3) = xu;
    data(1,4) = fu;
    data(1,5) = xu;
    data(1,6) = fu;
    data(1,7) = 0;
    i = 1;
    done = 1;
    error = false;
    return;
end
% calculate new root
xr = (xl+xu)/2;
fr = f(xr);
% populate data table
i = 1;
data(i,1) = xl;
data(i,2) = fl;
data(i,3) = xu;
data(i,4) = fu;
data(i,5) = xr;
data(i,6) = fr;
data(i,7) = 100;
% prepare for next iteration
if (fl*fr < 0)    
    data(i+1,1) = xl;
    data(i+1,2) = fl;
    data(i+1,3) = xr;
    data(i+1,4) = fr;
elseif (fl*fr > 0)
    data(i+1,1) = xr;
    data(i+1,2) = fr;
    data(i+1,3) = xu;
    data(i+1,4) = fu;
else
    data(1,7) = 0;
    done = 1;
    return;
end
done = 0;
end