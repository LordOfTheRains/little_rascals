function [t_step,tcrit,H_t,Q_tot,dq] = circOrbitDecay(alt,alt_crit,M,CD,A)

%Constants -----------------------------------------------------------------
R_u = 8.314; %Universal gas constant
g = 9.81; %Gravity m/s^2
Re = 6378e3; %M
mw = .02897; %Mean Molecular Weight
rho_0  = 1.225; %kg.m^3; is the base density
t_avg = 257.5; %Average atmospheric temperature
mu = 3.986004418e14; % m^3/s^2
p_0 = 101325;
%Atmospheric Calcs First---------------------------------------------------
h_s = (R_u*t_avg)/(mw*g); %Scale Height

%Ballistics----------------------------------------------------------------
beta = M/(CD*A); %Ballistic coefficient
tcrit = ((h_s*beta)/(sqrt(mu*Re)*rho_0))*(exp(alt/h_s)-exp(alt_crit/h_s));
t_step = 0:15:tcrit;
H_t = [];
r = alt + Re;
Vi = sqrt(mu/r);
dq = [];
dq(end+1) = 0;
Q_tot = .5*.0000999*(.5*M*Vi^2);
vel = Vi;
for i = 2:length(t_step)
  H_t(i) = h_s*log((exp(alt/h_s)-(((sqrt(mu*Re))/(h_s*beta))*rho_0*(t_step(i)))));
  S = vel*15;
  gam = 57.3*(S/r);
  dv = -.5*(vel^2/h_s)*sind(gam);
  vel = vel + dv;
  rho = rho_0*exp(-H_t(i)/h_s);
  
  dq_at_t = .25*rho*vel^3*A*CD*15;
  dq(end+1) = dq(end)+ dq_at_t;
  %Integrated height function
end
H_t(1) = alt;