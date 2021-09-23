## Introduction to R sample program 3
## file: introR03.R
## Adapted from Venables, W.N., Smith, D.M. and Team, R.C., 2018. An Introduction to R, Version 3.5.1 (2018-07-02)

# Data from the "datasets" package loaded with a data set of the classical experiment 
# of Michelson to measure the speed of light. The morley in the dataset is will be loaded
# using the read.table function.

filepath <- system.file("data", "morley.tab" , package="datasets")

# Checking the file.

file.show(filepath)

# Create a data frame.

mm <- read.table(filepath)

# Redefine variables as factors.

mm$Expt <- factor(mm$Expt) 
mm$Run <- factor(mm$Run)


attach(mm)

# Compare the five experiments with simple boxplots.

plot(Expt, Speed, main="Speed of Light Data", xlab="Experiment No.")

# Analyze as a randomized block, with ‘runs’ and ‘experiments’ as factors.

fm <- aov(Speed ~ Run + Expt, data=mm) 
summary(fm)

# Fit the sub-model omitting ‘runs’.
fm0 <- update(fm, . ~ . - Run) 

# Compare using a formal analysis of variance.
anova(fm0, fm)

detach() 

rm(fm, fm0, mm, filepath)
