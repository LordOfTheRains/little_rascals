function [ a_delta, t_span,orbits] = maj_axis_change(r_apo, r_per, M, CD, A )
%maj_axis_change calculates the change in major axis with respect to time 
%% constants 
r_earth = 6378000;   % m
mu = 3.986004418e14; % m^3/s^2

%difference between apogee and perigee to determine if oorbit is
%circularized (meters)
cir_orbit_tolerance = 100;
% ballistic_coe calculation  
% ballistic_coe = M/(CD*A);

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
ballistic_coe =150;
dhdt = @(t,h)((-sqrt(mu*(h+r_earth))/ballistic_coe)*rho_0*exp(-h/h_s))*t;
period = @(semi_major)2.*pi.*sqrt(semi_major.^3./mu);

apogee = r_apo;
perigee = r_per;

a =[];
t = [];

semi_major_axis = (perigee+apogee)/2;
half_period = 0.5*(period(semi_major_axis));
h_inital = apogee-r_earth;
o = exp(-h_inital/h_s);
% disp(o);
a(end+1) = semi_major_axis;
t(end+1) = 0;
% initial eval at apo, so the  height is the height at perigee
num_pass = 0;
disp('orbit decaying.....');
while apogee-perigee >= cir_orbit_tolerance ;
    %disp(semi_major_axis);
    t(end+1) = t(end)+half_period;
    dh_per = dhdt(half_period, h_inital);
    perigee = perigee + dh_per;
    semi_major_axis = (perigee+apogee)/2;
    half_period = 0.5*(period(semi_major_axis));
    %completed one orbit pass
    t(end) = t(end)+half_period;
    h_inital = perigee-r_earth;
    dh_apo = dhdt(half_period, h_inital);
    apogee = apogee + dh_apo;
    
    semi_major_axis = (perigee+apogee)/2;
    a(end+1) = semi_major_axis;
    half_period = 0.5*(period(semi_major_axis));
    h_inital = apogee-r_earth;
    num_pass = num_pass +1;
    
end
a_delta = a;
t_span = t;
orbits = num_pass;

%{
disp('orbits passed:');
disp(num_pass);
plot(t,a)
title('Semi Major Axis vs Time ')
ylabel('semi_major_axis (meters)')
xlabel('Time (s)')
figure
%}


end

