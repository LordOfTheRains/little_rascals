
%comment the line to allow break point with in function
clear all
clc


% Part 2-----------------------------------------------------------------------
r_earth = 6378000;
r_apo = 306000 + r_earth; %meters
r_peri = 185000 + r_earth; %meters
mass = 15000; %kilograms
diameter = 4.5; %meters
CD = .5;
area = (pi*diameter^2)/4;
[a_delta, t_span, orbits] = maj_axis_change(r_apo, r_peri, mass, CD, area, 0.0);

plot(t_span,a_delta)

title('Semi Major Axis vs Time ')
ylabel('semi_major_axis (meters)')
xlabel('Time (s)')
figure


fprintf('The time to circularize is %.2f  years (%d orbits) \n', (t_span(end))/(3600*24*365), orbits)


% Part 1-----------------------------------------------------------------------
alt = linspace(0,100000,5e5);
density = [];
t_scale = [];

for i = 1:length(alt)
  [density(i),t_scale(i), rho, p, nu, a, temp]= std_atmosphere(alt(i));
end

plot(alt,density)
title('Altitude vs Density')
ylabel('Altitude (meters)')
xlabel('Density (kg/m^3)')
figure
plot(alt,t_scale)
title('Altitude vs Temperature')
ylabel('Altitude (meters)')
xlabel('Temperature (kelvin)')


%% Part 3----------------------------------------------------------------------
alt_circ = 185000; %initial circular height meters
alt_crit = 120000; %critical alt given in class meters
delta_t = 36000; %Resolution for time step
[t_step, tcrit, H_t] = circOrbitDecay(alt_circ,delta_t,alt_crit,mass,CD,area);
figure
plot(t_step,H_t)
title('Altitude vs Time')
xlabel('Time (seconds)')
ylabel('Altitude')
ylim([0 360000]);
fprintf('The time to decay is %.2f years \n', tcrit/(3600*24*365))
