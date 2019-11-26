function [data, i, done] = trap_bisection_step(f, data, i, es)
% get bounds;
i = i + 1;
xl = data(i,1);
fl = data(i,2);
xu = data(i,3);
fu = data(i,4);
% calcuate new root
xr = (xl+xu)/2;
fr = f(xr);
% calculate relative error
xr_old = data(i-1,5);
Erelative = (abs(xr - xr_old)/xr) * 100;
% populate data table
data(1,5) = xr;
data(1,6) = fr;
data(1,7) = Erelative;
% check if desired accuracy reached
if(Erelative < es)
    done = 1;
    return
end
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
    data(i,7) = 0;
    done = 1;
    return
end
done = 0;
end