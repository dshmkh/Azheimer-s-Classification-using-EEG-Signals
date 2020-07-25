%Initial Noise Removal

%% Alzheimers Dataset
a1=noise_removal_filt(a1);
a2=noise_removal_filt(a2);
a3=noise_removal_filt(a3);
a4=noise_removal_filt(a4);
a5=noise_removal_filt(a5);
a6=noise_removal_filt(a6);
a7=noise_removal_filt(a7);
a8=noise_removal_filt(a8);
a9=noise_removal_filt(a9);
a10=noise_removal_filt(a10);
a11=noise_removal_filt(a11);
a12=noise_removal_filt(a12);
a13=noise_removal_filt(a13);
a14=noise_removal_filt(a14);
a15=noise_removal_filt(a15);

%% Normal Dataset
n1=noise_removal_filt(n1);
n2=noise_removal_filt(n2);
n3=noise_removal_filt(n3);

%% Migraine Dataset
m1=noise_removal_filt(m1);
m2=noise_removal_filt(m2);
m3=noise_removal_filt(m3);
m4=noise_removal_filt(m4);
m5=noise_removal_filt(m5);
m6=noise_removal_filt(m6);
m7=noise_removal_filt(m7);
m8=noise_removal_filt(m8);
m9=noise_removal_filt(m9);
m10=noise_removal_filt(m10);
m11=noise_removal_filt(m11);
m12=noise_removal_filt(m12);
m13=noise_removal_filt(m13);

%% Seizure Dataset
s1=noise_removal_filt(s1);
s2=noise_removal_filt(s2);
s3=noise_removal_filt(s3);
s4=noise_removal_filt(s4);
s5=noise_removal_filt(s5);
s6=noise_removal_filt(s6);
s7=noise_removal_filt(s7);
s8=noise_removal_filt(s8);
s9=noise_removal_filt(s9);
s10=noise_removal_filt(s10);

%% Saving as .mat file
save('init_noise_filt.mat');