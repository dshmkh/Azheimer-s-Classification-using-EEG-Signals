%% Initial Noise removal

function f=noise_removal_filt(x)
fs=128;
tx =[0:length(x)-1]/fs;
Fnorm = 2/(fs/2); 
df = designfilt('lowpassfir','FilterOrder',6,'CutoffFrequency',Fnorm);
f = filter(df,x); 
%figure
%plot(tx,x,tx,f,'r','linewidth',1.5);
%title('Filtered Waveforms');
%xlabel('Time (s)')
%legend('Original Noisy Signal','Filtered Signal');
%grid on
%axis tight
%figure
%plot(tx,N2);
%y1=fft(y);
%y2=fft(n1);
%figure
%subplot(211)
%plot(tx,y1);
%subplot(212)
%plot(tx,y2);
