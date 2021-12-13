# Marc Denojean-Mairet
# Chapter 6: Analysis of longitudinal data
# Some code have been copied from DataCamp

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
glimpse(BPRS)

# Factor variables ID and Group
RATS$ID <- factor(RATS$ID)
RATS$Group <- factor(RATS$Group)

# Glimpse the data
glimpse(RATS)

# part 3: Convert the data sets to long form

# Convert to long form
BPRSL <-  BPRS %>% gather(key = weeks, value = bprs, -treatment, -subject)

# Extract the week number
BPRSL <-  BPRSL %>% mutate(week = as.integer(substr(weeks,5,5)))

# Convert data to long form
RATSL <- RATS %>%
  gather(key = WD, value = Weight, -ID, -Group) %>%
  mutate(Time = as.integer(substr(WD,3,4))) 

# part 4: look at the new data sets

# Wide Format:
# repeated responses (longitudinal data) over a period of time are recorded in a single row.
# Each response is a separate column.

# Long Format:
# Repeated responses over a period of time are recorded only in one column.
# Variables that do not change over time, will have the same value
# in multiple rows.

# Reason to change from wide format to long format for analysis:
# repeated measurements of the response will not be independent but correlated.

dim (BPRSL)
dim (RATSL)
str (BPRSL)
str (RATSL)
summary (BPRSL)
summary (RATSL)
BPRSL
RATSL

# Save new data set to data folder
write.csv(BPRSL,file="~/IODS-project/IODS-project/data/BPRSL.csv", row.names=T)
# Save new data set to data folder
write.csv(RATSL,file="~/IODS-project/IODS-project/data/RATSL.csv", row.names=T)