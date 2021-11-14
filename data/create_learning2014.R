# Name: Marc Denojean-Mairet
# Date: 2021-11-10
# This script reads learning2014 data file for exercise 2.

# Read data file
lrn14 <- read.table("https://www.mv.helsinki.fi/home/kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t",header=TRUE)

# Get dimensions of data frame: 183 observations and 60 variables.
dim(lrn14)

# Shows structure of data frame.
str(lrn14)

# dplyr library
library(dplyr)

# Questions and combining variables.
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

# Creates columns 'deep' and average mean.
deep_columns <- select(lrn14, one_of(deep_questions))
lrn14$deep <- rowMeans(deep_columns)

# Creates columns 'surf' and average mean.
surface_columns <- select(lrn14, one_of(surface_questions))
lrn14$surf <- rowMeans(surface_columns)

# Creates columns 'stra' and average mean.
strategic_columns <- select(lrn14, one_of(strategic_questions))
lrn14$stra <- rowMeans(strategic_columns)

# Select columns to keep.
keep_columns <- c("gender","Age","Attitude", "deep", "stra", "surf", "Points")

# Creates new data set with keep_columns.
learning2014 <- select(lrn14, one_of(keep_columns))

# Applies filter to Points.
learning2014 <- filter(learning2014, Points > 0)

# Dimensions are now 166 observations and 7 variables.
dim(learning2014)
