clear all
clc


% Part 1-----------------------------------------------------------------------
alt = linspace(0,100000,5e6);
density = [];
temp = [];

for i = 1:length(alt)
  [density(i),t_scale rho, p, nu, a, temp(i)]= std_atmosphere;
end

plot(alt,density)
title('Density vs Altitude')
xlabel = ('Altitude (meters)')
ylabel = ('Density (kg/m^3)')
figure
plot(alt,temp)
title('Temperature vs Altitude')
xlabel = ('Altitude (meters)')
ylabel = ('Temperature (kelvin)')

% Part 2-----------------------------------------------------------------------
r_apo = 306000; %meters
r_peri = 185000; %meters
mass = 15000; %kilograms
diameter = 4.5; %meters







% Part 3----------------------------------------------------------------------
alt_circ = 306000; %initial circular height meters
alt_crit = 120000; %critical alt given in class meters
delta_t = 3600; %1 hour time step since it will take a while
[t_step, tcrit, H_t] = circOrbitDecay(alt_circ,delta_t,alt_crit);
figure
plot(t_step,H_t)
title('Altitude vs Time')
xlabel('Time (seconds)')
ylabel('Altitude')
