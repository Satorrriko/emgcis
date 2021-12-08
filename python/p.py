from neurokit2 import emg
import numpy as np
import  neurokit2 as nk
from matplotlib import pyplot as plt
#import datacq
def datacq(data_name,point_number,sample_angle):
    sample_number=len(data_name)//point_number
    print(sample_number)
    base=(len(data_name)%point_number)//2
    print(base)
    #for loop in range(1,sample_number):
    #    ch1=data_name(base+(point_number*(loop-1)):base+(point_number*(loop)),2)'

txt_path = 'D:\Developments\\00.EMG\git\emgcis\database\\0.txt'
f = open(txt_path)
data_lists = f.readlines()	#
#ecg = nk.ecg_simulate(duration=10, heart_rate=70)

dataset= []
# 
for data in data_lists:
    data1 = data.strip('\n')	# 
    data2 = data1.strip('\n               \n')	# 
    data3 = data2.split('               ')	# 
    dataset.append(data3)	# 
for i in range(len(dataset)-1,-1,-1):
    if dataset[i]==['']:
        dataset.remove([''])
dataset = np.array(dataset)
channel1=dataset[:,1]
channel1 = channel1.astype(np.float64)
channel2=dataset[:,2]
channel2 = channel2.astype(np.float64)
emg.emg_analyze(channel1,sampling_rate=100,method="auto")
#plt.plot(channel1)
#plt.plot(channel2)
#使用show展示图像
#plt.show()
datacq(channel1,200,0)


