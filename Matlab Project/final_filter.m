%% Theta, Beta and Range filters

function f = final_filter(x)
y = range_filt(x);
x1 = beta_filter(y);
x2 = theta_filter(y);
f = x1+x2;