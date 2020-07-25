%To extract the Ideal region of Dataset 
%to remove initial noise interference


%% Alzheimer's Dataset

a1 = middle_part(a1);
a2 = middle_part(a2);
a3 = middle_part(a3);
a4 = middle_part(a4);
a5 = middle_part(a5);
a6 = middle_part(a6);
a7 = middle_part(a7);
a8 = middle_part(a8);
a9 = middle_part(a9);
a10 = middle_part(a10);
a11= middle_part(a11);
a12 = middle_part(a12);
a13 = middle_part(a13);
a14 = middle_part(a14);
a15 = middle_part(a15);


%% Migraine Dataset

m1 = middle_part(m1);
m2 = middle_part(m2);
m3 = middle_part(m3);
m4 = middle_part(m4);
m5 = middle_part(m5);
m6 = middle_part(m6);
m7 = middle_part(m7);
m8 = middle_part(m8);
m9 = middle_part(m9);
m10 = middle_part(m10);
m11= middle_part(m11);
m12 = middle_part(m12);
m13 = middle_part(m13);


%% Seizure Dataset

s1 = middle_part(s1);
s2 = middle_part(s2);
s3 = middle_part(s3);
s4 = middle_part(s4);
s5 = middle_part(s5);
s6 = middle_part(s6);
s7 = middle_part(s7);
s8 = middle_part(s8);
s9 = middle_part(s9);
s10 = middle_part(s10);


%% Normal Dataset
n1 = middle_part(n1);
n2 = middle_part(n2);
n3 = middle_part(n3);


%% Updating Dataset

save('middle_extracted.mat');