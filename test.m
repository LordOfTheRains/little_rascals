clc
clear
altitude = 90000;
[ density, pressure,nu, a, temperature] = std_atmosphere( altitude,1);



p = [];
t = [];
altitude =  0:100:100000;
for alt = altitude
    [density, pressure,nu, a, temperature] = std_atmosphere( alt,1);
    p(end+1) = pressure;
    t(end+1) = temperature;
end


figure(1)
plot(altitude,p);
xlabel('Altitude (m)');
ylabel('Pressure (pa)');
title('Pressure VS Altitude');

figure(2)
plot(altitude,t);
xlabel('Altitude (m)');
ylabel('Temperature (K)');
title('Altitude VS Temperature');