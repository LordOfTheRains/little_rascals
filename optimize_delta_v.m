%Little Rascals
%DEL V mass staging
function [min_f1, min_f2] = optimize_delta_v(num_stage,total_dv, f_init, delta_f, isp, m_payload)

delta_fs = linspace(delta_f,f_init,f_init/delta_f);
inital_mass = [];
min_f1 = 0;
min_f2 = 0;

for i = 1:length(delta_fs)
    df = delta_fs(i);
    delta_v = df*total_dv;
    [~,~,~,m_inital] = mass_vals_first(delta_v,isp, df, m_payload);
    inital_mass(i) = m_inital;
end


[min_m, index] = min(inital_mass);
min_f1 = delta_fs(index);

% stage 2
if num_stage == 2 
    return
end

f2 = 1-f_init;
delta_fs = linspace(delta_f,1-f2,f2/delta_f);

for i = 1:length(delta_fs)
    df = delta_fs(i);
    delta_v = df*total_dv;
    [~,~,~,m_inital] = mass_vals_first(delta_v,isp, df, m_payload);
    inital_mass(i) = m_inital;
end

[min_m, index] = min(inital_mass);
min_f2 = delta_fs(index);

end
