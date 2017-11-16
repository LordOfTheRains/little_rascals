function [ a_delta ] = maj_axis_change(r_apo, r_per, M, CD, A, rho, delta_t, t_step )
%maj_axis_change calculates the change in major axis with respect to time 
%% constants 
r_earth = 6378000;   % m
mu = 3.986004418e14; % m^3/s^2

%% initial semi major axis calculation 
r_apo = r_apo + r_earth;
r_per = r_per + r_earth;
a_i = (r_apo+r_per)/2;

%% ballistic_coe calculation  
ballistic_coe = M/(CD*A);

%% final semi major axis calculation by integrating da/dt equation
%a_f = 3/2*(-rho/ballistic_coe*sqrt(mu)*t)^(2/3);

%% change in semi major axis 
%a_delta = a_f-a_i;



rho_0  = 1.225; %kg.m^3; is the base density
R_u = 8.314; %Universal gas constant
g = 9.81; %Gravity m/s^2
mw = .02897; %Mean Molecular Weight
t_avg = 257.5; %Average atmospheric temperature
h_s = (R_u*t_avg)/(mw*g); %Scale Height
h_inital = a_i-r_earth;
dhdt = @(t,h)-sqrt(mu(h+r_earth))/ballistic_coe*rho_0*exp(-h/h_s)*t;
int_limit = linspace(0,delta_t, t_step);
[t, h]= ode45(dhdt,int_limit, h_inital);

a =[];
for i = 1:length(h)
  a(end+1) = h+r_earth;
end

plot(t,a)
title('Semi Major Axis vs Time ')
ylabel('Altitude (meters)')
xlabel('Time (s)')
figure



end

