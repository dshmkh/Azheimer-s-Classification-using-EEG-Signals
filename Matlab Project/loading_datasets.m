clc;
clear all;
close all;


%Loading Datasets

%% Alzheimers
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Alzheimer/a1.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Alzheimer/a2.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Alzheimer/a3.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Alzheimer/a4.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Alzheimer/a5.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Alzheimer/a6.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Alzheimer/a7.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Alzheimer/a8.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Alzheimer/a9.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Alzheimer/a10.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Alzheimer/a11.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Alzheimer/a12.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Alzheimer/a13.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Alzheimer/a14.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Alzheimer/a15.asc');

%% Healthy
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Normal/n1.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Normal/n2.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Normal/n3.asc');

%% Migrane
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Migrane/m1.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Migrane/m2.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Migrane/m3.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Migrane/m4.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Migrane/m5.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Migrane/m6.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Migrane/m7.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Migrane/m8.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Migrane/m9.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Migrane/m10.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Migrane/m11.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Migrane/m12.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Migrane/m13.asc');

%% Seizure
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Seizure/s1.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Seizure/s2.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Seizure/s3.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Seizure/s4.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Seizure/s5.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Seizure/s6.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Seizure/s7.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Seizure/s8.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Seizure/s9.asc');
load('/Users/atharvadeshmukh/Desktop/Books and Notes/MINIPROJECT/Datasets/Seizure/s10.asc');

%% Saving as .mat file
save('init_database.mat');