# Python example program 0
# Some basics

print ("Hello class")

x=5
y=3
x*y
x**y
x%y

#Import Python Libraries
import numpy as np
import scipy as sp
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib as mpl
import seaborn as sns


#Read csv file
CO2 = pd.read_csv("https://raw.githubusercontent.com/kho777/data-visualization/master/data/CO2.csv")

#Read other formats
#pd.read_excel('myfile.xlsx',sheet_name='Sheet1', index_col=None, na_values=['NA'])
#pd.read_stata('myfile.dta')
#pd.read_sas('myfile.sas7bdat')

x=CO2["CO2pc"]

x