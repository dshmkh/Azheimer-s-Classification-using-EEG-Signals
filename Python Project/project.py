import os
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import glob
import mne
from scipy.signal import butter, lfilter, filtfilt
from scipy.fft import fft, fftfreq

###############################################################################

# Data Importing

print('Importing Data...')

n = ['EMG', 'EKG', 'Fp1', 'Fp2', 'A2', 'F7', 'F3', 'Fz', 'F4', 'F8', 'T3', 'C3', 'Cz', 'C4',
     'T4', 'T5', 'P3', 'Pz', 'P4', 'O1', 'O2', 'T1', 'T2', 'PG1', 'PG2', 'A1', 'T6', 'MK']


# Try during training of model, brings all the files into 1 huge dataset

'''
path = r'/Users/atharvadeshmukh/Desktop/Miniproject_python/alz_csv/'
all_files = glob.glob(os.path.join(path, "*.csv"))
alz_df = [pd.read_csv(f, names=n) for f in all_files]
alz_new = pd.concat(alz_df)

'''

# Alzheimer's Data
alz_df = []
path = r'/Users/atharvadeshmukh/Desktop/Miniproject_python/alz_csv/'
all_files = glob.glob(os.path.join(path, "*.csv"))
for f in all_files:
    alz_df.append(pd.read_csv(f, names=n))

# Migraine Data
mig_df = []
path = r'/Users/atharvadeshmukh/Desktop/Miniproject_python/mig_csv/'
all_files = glob.glob(os.path.join(path, "*.csv"))
for f in all_files:
    mig_df.append(pd.read_csv(f, names=n))

# Seizure Data
sei_df = []
path = r'/Users/atharvadeshmukh/Desktop/Miniproject_python/seiz_csv/'
all_files = glob.glob(os.path.join(path, "*.csv"))
for f in all_files:
    sei_df.append(pd.read_csv(f, names=n))

# Normal Data
nor_df = []
path = r'/Users/atharvadeshmukh/Desktop/Miniproject_python/nor_csv/'
all_files = glob.glob(os.path.join(path, "*.csv"))
for f in all_files:
    nor_df.append(pd.read_csv(f, names=n))

del all_files
del f
del path

###############################################################################

# PRE PROCESSING

# Data Initialisation

'''
def clip_fn(a):
    length = len(a)
    all_cl = []
    for i in range(length):
        l = len(a[i])
        mid = l/2
        cl = mid/2
        u_lim = int(mid+cl)
        l_lim = int(mid-cl)
        clip = a[i][l_lim:u_lim]
    all_cl.append(clip)
    return all_cl

'''

print('Initializing data...')

len1 = len(alz_df)
alz_clip = []
for i in range(len1):
    length = len(alz_df[i])
    mid = length / 2
    cl_point = mid / 2
    upper_lim = int(mid + cl_point)
    lower_lim = int(mid - cl_point)
    clipped = alz_df[i][lower_lim:upper_lim]
    alz_clip.append(clipped)

len1 = len(mig_df)
mig_clip = []
for i in range(len1):
    length = len(mig_df[i])
    mid = length / 2
    cl_point = mid / 2
    upper_lim = int(mid + cl_point)
    lower_lim = int(mid - cl_point)
    clipped = mig_df[i][lower_lim:upper_lim]
    mig_clip.append(clipped)

len1 = len(sei_df)
sei_clip = []
for i in range(len1):
    length = len(sei_df[i])
    mid = length / 2
    cl_point = mid / 2
    upper_lim = int(mid + cl_point)
    lower_lim = int(mid - cl_point)
    clipped = sei_df[i][lower_lim:upper_lim]
    sei_clip.append(clipped)

len1 = len(nor_df)
nor_clip = []
for i in range(len1):
    length = len(nor_df[i])
    mid = length / 2
    cl_point = mid / 2
    upper_lim = int(mid + cl_point)
    lower_lim = int(mid - cl_point)
    clipped = nor_df[i][lower_lim:upper_lim]
    nor_clip.append(clipped)

'''
alz_clip = []
x = clip_fn(alz_df)
alz_clip.append(x)
print(alz_clip)
'''

del clipped
del len1
del length
del lower_lim
del upper_lim
del cl_point
del mid
del i
del alz_df
del mig_df
del nor_df
del sei_df

# 6th Order Low Pass Butterworth filter

print('Implementing 6th order LP Butterworth Filter')


def butter_lowpass(lowcut, fs, order=6):
    nyq = 0.5 * fs
    low = lowcut / nyq
    b, a = butter(order, low, btype='low')
    return b, a


def butter_lowpass_filter(data, lowcut, fs, order=6):
    b, a = butter_lowpass(lowcut, fs, order=order)
    y = filtfilt(b, a, data)
    return y


alz_lp = []
for i in range(15):
    x = butter_lowpass_filter(alz_clip[i], 0.5, 128)
    alz_lp.append(x)

mig_lp = []
for i in range(13):
    x = butter_lowpass_filter(mig_clip[i], 0.5, 128)
    mig_lp.append(x)

sei_lp = []
for i in range(10):
    x = butter_lowpass_filter(sei_clip[i], 0.5, 128)
    sei_lp.append(x)

nor_lp = []
for i in range(3):
    x = butter_lowpass_filter(nor_clip[i], 0.5, 128)
    nor_lp.append(x)

del alz_clip
del sei_clip
del mig_clip
del nor_clip

###############################################################################

# FEATURE EXTRACTION

# PSD Feature


# 4th Order Bandpass Butterworth Filter

print('Extracting Features from FFT (Beta and Theta Bands)')


def butter_bandpass(lowcut, highcut, fs=128, order=6):
    nyq = 0.5 * fs
    low = lowcut / nyq
    high = highcut / nyq
    b, a = butter(order, [low, high], btype='band')
    return b, a


def butter_bandpass_filter(data, lowcut, highcut, fs=128, order=6):
    b, a = butter_bandpass(lowcut, highcut, fs, order=order)
    y = filtfilt(b, a, data)
    return y

# Beta and Theta Band Extraction


def betatheta(data):
    a = butter_bandpass_filter(data, 3.5, 7.5)  # Theta Band
    b = butter_bandpass_filter(data, 11.5, 30.5)  # Beta Band
    out = a + b
    return out
