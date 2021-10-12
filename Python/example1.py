# Python example program 1
# Install packages

!pip install pandas
!pip install numpy

# Import packages

import numpy as np
import pandas as pd

hpi16= pd.read_excel("https://github.com/datageneration/datavisualization/blob/master/data/hpi2016.xlsx?raw=true",sheet_name='Sheet1', index_col=None, na_values=['NA'])

# Exploring data

#List first 5 records
hpi16.head()

# List last 10 records

hpi16.tail(10)

# Making a plot using seaborn:

import seaborn as sns

# Scatterplot
sns.regplot(x="HPI",
                  y="popln",
                  data=hpi16, fit_reg=False)

# Bar Chart
sns.barplot(x="HPI",
                y="GDPPC",
                data=hpi16)

# Joint plot

sns.jointplot(x=hpi16["HPI"], y=hpi16["popln"], kind='kde')

# Custom the inside plot: options are: “scatter” | “reg” | “resid” | “hex”
