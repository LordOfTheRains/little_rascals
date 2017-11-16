function [ a_delta ] = maj_axis_change(r_apo, r_per, M, CD, A, rho )
%maj_axis_change calculates the change in major axis with respect to time 
%% constants 
r_earth = 6378000;   % m
mu = 3.986004418e14; % m^3/s^2

%% initial semi major axis calculation 
r_apo = r_apo + r_earth;
r_per = r_per + r_eath;
a_i = (r_apo+r_per)/2;

%% beta calculation 
beta = M/(CD*A);

%% final semi major axis calculation by integrating da/dt equation
a_f = 3/2*(-rho/beta*sqrt(mu)*t)^(2/3);

%% change in semi major axis 
a_delta = a_f-a_i;

end

