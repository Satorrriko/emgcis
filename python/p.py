import numpy as np
#import  neurokit2 as nk
from matplotlib import pyplot as plt

txt_path = 'C:\\Users\\ZJohnny\\Documents\\GitHub\\emgcis\\database\\0低通.txt'
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
plt.plot(channel1)
plt.plot(channel2)
#使用show展示图像
plt.show()
