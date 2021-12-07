# Marc Denojean-Mairet
# Chapter 6: Analysis of longitudinal data

# libraries
library(dplyr)
library(tidyr)

# part 1: Load the data sets (BPRS and RATS) into R using as the source the GitHub repository of MABS

# load BPRS data
BPRS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep = " ", header = TRUE)

# Look at the (column) names of BPRS
names(BPRS)

# Look at the structure of BPRS
str(BPRS)

# print out summaries of the variables
summary(BPRS)



# load rats data
RATS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", sep = "\t", header = TRUE)

# Look at the (column) names of BPRS
names(RATS)

# Look at the structure of BPRS
str(RATS)

# print out summaries of the variables
summary(RATS)

# part 2: Convert the categorical variables of both data sets to factors


# Factor treatment & subject
BPRS$treatment <- factor(BPRS$treatment)
BPRS$subject <- factor(BPRS$subject)

# Take a glimpse at the BPRSL data
glimpse(BPRSL)

# Factor variables ID and Group
RATS$ID <- factor(RATS$ID)
RATS$Group <- factor(RATS$Group)

# Glimpse the data
glimpse(RATS)