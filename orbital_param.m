function [semi_major,h, h_mag, r_mag, v_mag,e, e_mag, dot_vr,i,norm_vector,norm_mag,ascending_node_longitude,n_dot_e,omega_calc,omega_final,e_dot_r,calc_true_anomaly,true_anomaly,v_dot_r] = orbital_param(r,v)
mu = 398600;
r_mag = norm(r);
v_mag = norm(v);
dot_vr = r*(v');
e = ((((v_mag^2)/mu)-(1/r_mag)).*r)-(((1/mu)*dot_vr).*v);
e_mag = norm(e);
h = cross(r,v);
h_mag = norm(h);
i = acosd(h(3)/h_mag);
norm_vector = [-h(2) h(1) 0];
norm_mag = norm(norm_vector);
ascending_node_longitude_calc = acosd(-h(2)/norm_mag);
p = h_mag^2/mu;
semi_major = p/(1-e_mag^2);

if norm_vector(2) < 0 
    ascending_node_longitude = 360 - ascending_node_longitude_calc;
else 
    ascending_node_longitude = ascending_node_longitude_calc;
end

n_dot_e = norm_vector*e';
omega_calc = acosd((norm_vector*(e'))/(norm_mag*e_mag));
if e(3) < 0
    omega_final = 360 - omega_calc
else 
    omega_final = omega_calc
end

e_dot_r = e*r';
calc_true_anomaly = acosd(e_dot_r/(e_mag*r_mag));
v_dot_r = v*r';
if v_dot_r > 0 
    true_anomaly = calc_true_anomaly
else
    true_anomaly = 360 - calc_true_anomaly
end

end