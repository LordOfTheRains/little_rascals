function [tcrit,H_t] = circOrbitDecay(alt,delta_t,alt_crit)

%Constants -----------------------------------------------------------------
R_u = 8.314; %Universal gas constant
g = 9.81; %Gravity m/s^2
Re = 6378e3; %KM
mw = .02897; %Mean Molecular Weight
rho_0  = 1.225; %kg.m^3; is the base density
t_avg = 257.5; %Average atmospheric temperature
mu = 3.986004418e14; % m^3/s^2
%Atmospheric Calcs First---------------------------------------------------
h_s = (R_u*t_avg)/(mw*g); %Scale Height

%Ballistics----------------------------------------------------------------
beta = m/(CD*A); %Ballistic coefficient
H_t = h_s * ln((exp(alt/h_s)-...
(((sqrt(mu*Re))/(h_s*beta))*rho_0*(delta_t)))); %Integrated height function
tcrit = ((h_s*beta)/(sqrt(mu*Re)*rho_0)))*(exp(alt,h_s)-exp(alt_crit/h_s));
