function [ rho, p,nu, a, t] = std_atmosphere(altitude)
%UNTITLED Summary of this function goes here
% Since there is no class today, you will have an extended group lab session.  
% Each group must have a function and accurate Matlab code that calculates 
% the standard atmosphere from sea level to 100km altitude.  
% You must calculate density, pressure, kinematic viscosity, speed of sound, 
% and temperature.  Each group must have a functional routine, not each person. 
% Submit to me via e-mail and I will run it tonight.  
% If it runs and is accurate, full credit.  If it runs but not accurate, half credit.  
% If it doesn't run, then I will wad up your printout and set it on fire. 
% 10 points for each accurate condition mentioned above (50 points total)
% rho
% p
% nu
% a
% t - kelvin



GAMMA = 1.4; % or replace with handle if we are not using constant
R_AIR = 286.9; %j/kg.K
mu_0_earth = 0.000017332654; %Pa.s
earth_t0 = 288.11; %K
earth_ts = 110.33; %K

p = 0;
t = 0;
mu = 0;

if altitude < 86000 %Troposphere
    [rho,a,t,p,nu,ZorH]=stdatmo(altitude,0,'si');
    return
% do some stuff here for altitude abvoe 86km
elseif altitude < 91000 
    altitude = altitude/1000; %Equations are for z in km
    t = 186.8673;
    p = exp(2.156582e-06*altitude^3 -4.836957e-04*altitude^2-0.1425192*altitude + 13.47530);
    rho = exp(-3.322622e-06*altitude^3 +9.111460e-04*altitude^2-0.1425192*altitude + 5.944694);
    mu = mu_0_earth*((t/earth_t0)^1.5)*((earth_t0+earth_ts)/(t+earth_ts));
elseif altitude < 100001
    altitude = altitude/1000; %Equations are for z in km
    delta_z = altitude - 91000;
    little_a = -19942.9;
    t = 263.1905-76.3232*sqrt(1-((delta_z/little_a)^2));
    p = exp(3.304895e-05*altitude^3 -0.009062730e-04*altitude^2+0.6516698*altitude - 11.03037);
    rho = exp(2.873405e-05*altitude^3 - 0.008492037*altitude^2+0.6541179*altitude -23.62010);
    mu = mu_0_earth*((t/earth_t0)^1.5)*((earth_t0+earth_ts)/(t+earth_ts));
else %out of bound just give them error
    disp('we do not support data outside of 100km');
end



nu = mu/rho;
a = sqrt(GAMMA*R_AIR*t);



end

