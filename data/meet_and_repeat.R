# Marc Denojean-Mairet
# Chapter 6: Analysis of longitudinal data

BPRS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep = " ", header = TRUE)

# Look at the (column) names of BPRS
names(BPRS)

# Look at the structure of BPRS
str(BPRS)

# print out summaries of the variables
summary(BPRS)

RATS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", sep = "\t", header = TRUE)

# Look at the (column) names of BPRS
names(RATS)

# Look at the structure of BPRS
str(RATS)

# print out summaries of the variables
summary(RATS)