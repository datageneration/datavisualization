
#Import Python Libraries
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

CO2 = pd.read_csv("https://raw.githubusercontent.com/kho777/data-visualization/master/data/CO2.csv")
hpi16= pd.read_excel("https://github.com/kho777/data-visualization/blob/master/data/hpi2016.xlsx?raw=true",sheet_name='Sheet1', index_col=None, na_values=['NA'])
CO2.head()

# Using matplotlib

CO2pc=CO2["CO2pc"]
plt.plot(CO2pc)

# Scatterplot

plt.scatter("Region","Footprint", data=hpi16)

plt.xticks(rotation='vertical')

plt.xticks(rotation=45)

# Using Seaborn

sns.regplot(x="GDPPC",
                  y="Footprint",
                  data=hpi16, fit_reg=False)

sns.stripplot(x="Region",
                  y="Footprint", 
                  data=hpi16);

sns.swarmplot(x="Region",
                  y="Footprint", 
                  data=hpi16);

# Rotate the x labels
# sns.boxplot
# sns.violinplot
# sns.barplot
# sns.factorplot              