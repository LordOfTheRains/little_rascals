function [m_prop,m_inert,m_final,m_init] = mass_vals(del_v,ISP,f_inert,m_pay);
go = 9.81;

num_prop = m_pay*(exp(del_v/(ISP*go))-1)*(1-f_inert);
den_prop = 1-(f_inert*exp(del_v/(ISP*go)));

m_prop = num_prop/den_prop;

m_inert = (f_inert/(1-f_inert))*m_prop;

m_final = m_pay + m_inert;

m_init = m_pay + m_inert + m_prop;