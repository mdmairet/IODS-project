# Marc Denojean-Mairet
# Chapter 4 Script
# Original data source: http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt
# http://hdr.undp.org/en/content/human-development-index-hdi
# the “Human development” and “Gender inequality” datas are from the above the United Nations development programme.
# The Human Development Index (HDI) was created to emphasize that people and their capabilities should be the ultimate criteria 
# for assessing the development of a country, not economic growth alone. 

# ***This work on wrangler started last week and continue this week.***


# *** Last week work ***

library(dplyr)


# part 2: Read the “Human development” and “Gender inequality” datas into R.

hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

# part 3: Explore files structures and dimensions of hd and gii

str(hd)
dim(hd)
str(gii)
dim(gii)

# Show original column names of hd and gii

colnames(hd)
colnames(gii)

# part 4: rename columns for hd and gii 
# for dataset hd, the long variable names have been changed to:

#'HDI.Rank' = 'HDI_R'
#'Human.Development.Index..HDI.' = 'HDI'
#'Life.Expectancy.at.Birth' = 'LEB'
#'Expected.Years.of.Education' = 'EYE'
#'Mean.Years.of.Education' = 'MYE'
#'Gross.National.Income..GNI..per.Capita' = 'GNIC'
#'GNI.per.Capita.Rank.Minus.HDI.Rank' = 'GNIC-HDI_R'

names(hd)[names(hd) == 'HDI.Rank'] <- 'HDI_R'
names(hd)[names(hd) == 'Human.Development.Index..HDI.'] <- 'HDI'
names(hd)[names(hd) == 'Life.Expectancy.at.Birth'] <- 'LEB'
names(hd)[names(hd) == 'Expected.Years.of.Education'] <- 'EYE'
names(hd)[names(hd) == 'Mean.Years.of.Education'] <- 'MYE'
names(hd)[names(hd) == 'Gross.National.Income..GNI..per.Capita'] <- 'GNIC'
names(hd)[names(hd) == 'GNI.per.Capita.Rank.Minus.HDI.Rank'] <- 'GNIC-HDI_R'




#for gii dataset, the long variable names have been changed to:

#'GII.Rank' = 'GII_R'
#'Gender.Inequality.Index..GII.' = 'GII'
#'Maternal.Mortality.Ratio' = 'MMR'
#'Adolescent.Birth.Rate' = 'ABR'
#'Percent.Representation.in.Parliament' = 'PRP'
#'Population.with.Secondary.Education..Female.' = 'PSEF'
#'Population.with.Secondary.Education..Male.' = 'PSEM'
#'Labour.Force.Participation.Rate..Female.' = 'LFPRF'
#'Labour.Force.Participation.Rate..Male.' = 'LFPRM'

names(gii)[names(gii) == 'GII.Rank'] <- 'GII_R'
names(gii)[names(gii) == 'Gender.Inequality.Index..GII.'] <- 'GII'
names(gii)[names(gii) == 'Maternal.Mortality.Ratio'] <- 'MMR'
names(gii)[names(gii) == 'Adolescent.Birth.Rate'] <- 'ABR'
names(gii)[names(gii) == 'Percent.Representation.in.Parliament'] <- 'PRP'
names(gii)[names(gii) == 'Population.with.Secondary.Education..Female.'] <- 'PSEF'
names(gii)[names(gii) == 'Population.with.Secondary.Education..Male.'] <- 'PSEM'
names(gii)[names(gii) == 'Labour.Force.Participation.Rate..Female.'] <- 'LFPRF'
names(gii)[names(gii) == 'Labour.Force.Participation.Rate..Male.'] <- 'LFPRM'



# show new column names for hd and gii
colnames(hd)
colnames(gii)

# part 5: mutate for gii
#create two new variables. 
#The first one is the ratio of Female and Male populations with secondary education in each country.
#The second new variable is the ratio of labour force participation of females and males in each country.

gii <- mutate(gii, RFMPSE = PSEF/PSEM)
gii <- mutate(gii, RFMLFP = LFPRF/LFPRM)

# Part 6: merge hd with gii by country name

hdgii <- merge(hd, gii, by = "Country")

# show dimension of new merged data set
# hdgii dataset has 195 observations and 19 variables
dim(hdgii)


# Save new data set to data folder
write.csv(hdgii,file="~/IODS-project/IODS-project/data/hdgii.csv", row.names=FALSE)

# *** This week work ***

# read given dataset file into human
library(stringr)
library (dplyr)

human <- read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt", sep = ",", header = TRUE)

# see description of the data in last week work (above).  Please note the file and variable names from my last week work are different then the given file in the exercise.
# for this week, I am using the given file in the exercise.

#195 observations and 19 variables
dim(human)
str(human)

# part 1: mutate and change observations of GNI from chr to numerical

# remove "," from GNI variables and assign to GNIN
GNIN  <- str_replace(human$GNI, pattern=",", replace ="") %>% as.numeric

# mutate GNI with GNIN
human <- mutate(human, GNI = GNIN)

# check structure of GNI (now num)
str(human)

# part 2: Exclude unneeded variables
# code is from DataCamp

# columns to keep
keep <- c("Country", "Edu2.FM", "Labo.FM", "Life.Exp", "Edu.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F")

# select the 'keep' columns
human <- select(human, one_of(keep))

# print out a completeness indicator of the 'human' data
complete.cases(human)

# print out the data along with a completeness indicator as the last column
data.frame(human[-1], comp = complete.cases(human))

# part 3: Remove all rows with missing values
# code is from DataCamp

# filter out all rows with NA values
human_ <- filter(human, complete.cases(human))

# part 4: Remove the observations which relate to regions instead of countries
# code is from DataCamp

# look at the last 10 observations
tail(human_, 10)

# last indice we want to keep
last <- nrow(human_) - 7

# choose everything until the last 7 observations
human_ <- human[1:last, ]

str(human_)

# part 5: Define the row names of the data by the country names and remove the country name column from the data
# code is from DataCamp

# add countries as rownames
rownames(human_) <- human_$Country

# remove the Country variable
human_ <- select(human_, -Country)

# dim and str
# 155 observations and 8 variables

dim(human_)

str(human_)

#save new dataset as human.csv to data folder
write.csv(human_,file="~/IODS-project/IODS-project/data/human.csv", row.names=TRUE)
