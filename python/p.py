import numpy as np
import neurokit2 as nk

txt_path = 'D:\Developments\\00.EMG\git\emgcis\database\\00.txt'	# txt文本路径
f = open(txt_path)
data_lists = f.readlines()	#读出的是str类型
ecg = nk.ecg_simulate(duration=10, heart_rate=70)

dataset= []
# 对每一行作循环
for data in data_lists:
    data1 = data.strip('\n')	# 去掉开头和结尾的换行符
    data2 = data1.strip('\n               \n')	# 去掉开头和结尾的换行符
    data3 = data2.split('               ')	# 把tab作为间隔符
    dataset.append(data3)	# 把这一行的结果作为元素加入列表dataset
dataset.remove([''])
dataset = np.array(dataset)
print(dataset)
for i in range(1,len(dataset)):
    print(dataset(i))