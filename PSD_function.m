%% PSD function

function f = PSD_function(x)
f = (abs(fft(x))).^2;
