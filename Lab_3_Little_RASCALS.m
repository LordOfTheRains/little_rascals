clear all
clc


% Part 1-----------------------------------------------------------------------
alt = linspace(0,100000,5e5);
density = [];
t_scale = [];

for i = 1:length(alt)
  [density(i),t_scale(i), rho, p, nu, a, temp]= std_atmosphere(alt(i));
end

plot(alt,density)
title('Density vs Altitude')
xlabel('Altitude (meters)')
ylabel('Density (kg/m^3)')
figure
plot(alt,t_scale)
title('Temperature vs Altitude')
xlabel('Altitude (meters)')
ylabel('Temperature (kelvin)')

% Part 2-----------------------------------------------------------------------
r_apo = 306000; %meters
r_peri = 185000; %meters
mass = 15000; %kilograms
diameter = 4.5; %meters
CD = .5;
area = (pi*diameter^2)/4;
%not sure what rho is.
[a_delta] = maj_axis_change(r_apo, r_peri, mass, CD, area, 0.0, 600, 1200);

%% Part 3----------------------------------------------------------------------
alt_circ = 306000; %initial circular height meters
alt_crit = 120000; %critical alt given in class meters
delta_t = 36000; %Resolution for time step
[t_step, tcrit, H_t] = circOrbitDecay(alt_circ,delta_t,alt_crit,mass,CD,area);
figure
plot(t_step,H_t)
title('Altitude vs Time')
xlabel('Time (seconds)')
ylabel('Altitude')
ylim([0 360000]);
fprintf('The time to decay is %.2f', tcrit/(3600*24*365))
fprintf(' years \n')
