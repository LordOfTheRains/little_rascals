function [ rho, p,nu, a, t] = std_atmosphere( altitude_m,vel_ms)
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
R_AIR = 0.2869; %kj/kg.K

p = 0;
t = 0;


if altitude_m < 86000 %Troposphere
   [rho,sound,t,p,nu,ZorH]=stdatmo(altitude_m,0,'si');

% do some stuff here for altitude abvoe 86km
elseif altitude_m < 105000 %Mesosphere 
    
else %out of bound just give them error
    disp('we do not support data outside of 100km');
end


rho = p/(R_AIR* t);
mu = 1/2*vel_ms^2;
nu = mu/p;
a = sqrt(GAMMA*R_AIR*t);



end

