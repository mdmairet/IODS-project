# Marc Denojean-Mairet
# Chapter 4 Script



library(dplyr)


# part 2: read files

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

names(hd)[names(hd) == 'HDI.Rank'] <- 'HDI_R'
names(hd)[names(hd) == 'Human.Development.Index..HDI.'] <- 'HDI'
names(hd)[names(hd) == 'Life.Expectancy.at.Birth'] <- 'LEB'
names(hd)[names(hd) == 'Expected.Years.of.Education'] <- 'EYE'
names(hd)[names(hd) == 'Mean.Years.of.Education'] <- 'MYE'
names(hd)[names(hd) == 'Gross.National.Income..GNI..per.Capita'] <- 'GNIC'
names(hd)[names(hd) == 'GNI.per.Capita.Rank.Minus.HDI.Rank'] <- 'GNIC-HDI_R'



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

gii <- mutate(gii, RFMPSE = PSEF/PSEM)
gii <- mutate(gii, RFMLFP = LFPRF/LFPRM)

# Part 6: merge hd with gii by country name

hdgii <- merge(hd, gii, by = "Country")

# show dimension of new merged data set

dim(hdgii)