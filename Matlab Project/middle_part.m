%% Taking the best part of the signal

function f = middle_part(x)
t = length(x);
max_t = t;
min_t = 0 ;
mid_t = (max_t-min_t)/2;
point = (mid_t)/2;
start_point = mid_t-point;
end_point = mid_t+point;
f = x( start_point:end_point,:);
