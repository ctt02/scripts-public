import matplotlib.pyplot as plt
import numpy as np
label = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
mean = [56.6, 74.1, 85.9, 128.5, 199.4, 547.2, 909.2, 800.6, 556.3, 238.6, 97, 46.1]
per = [1.51, 1.98, 2.30, 3.44, 5.33, 14.63, 24.31, 21.41, 14.88, 6.38, 2.59, 1.23]

plt.subplot(2,1,1)
index = np.arange(len(label))
plt.bar(index, mean)
#plt.xlabel('Climotological Months', fontsize=10)
plt.ylabel('Rainfall (mm/day)', fontsize=12)
plt.xticks(index, label, fontsize=10, rotation=0)
#plt.title('Climotological mean from 1901-2017')

plt.subplot(2,1,2)
index = np.arange(len(label))
plt.bar(index, per)
plt.xlabel('Climotological Months', fontsize=12)
plt.ylabel('Rainfall Percentage', fontsize=12)
plt.xticks(index, label, fontsize=10, rotation=0)
#plt.title('Climotological mean from 1901-2017')


plt.savefig('plot_mean.png', format='png')

