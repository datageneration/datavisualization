# -*- coding: utf-8 -*-
"""
Created on Wed Apr  4 14:14:01 2018

@author: kxh022100
"""
#Import Python Libraries
import numpy as np
import scipy as sp
import pandas as pd
import matplotlib as mpl
import matplotlib.pyplot as plt
import seaborn as sns

CO2 = pd.read_csv("https://raw.githubusercontent.com/datageneration/datavisualization/master/data/CO2.csv")
hpi16= pd.read_excel("https://github.com/datageneration/datavisualization/blob/master/data/hpi2016.xlsx?raw=true",sheet_name='Sheet1', index_col=None, na_values=['NA'])

CO2pc=CO2["CO2pc"]
plt.plot(CO2pc)

plt.xticks(rotation='vertical')
plt.scatter("Region","Footprint", data=hpi16)
plt.xticks(rotation=45)
