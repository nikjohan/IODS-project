#Week 6 data wrangling

#read the data
BPRS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", header = T)
str(BPRS)
#treatment, subject and 0 to 8 weeks of BPRS summed scores. 
summary(BPRS)

RATS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", header = T)
str(RATS)
#ID and group, and then weight data from 11 time intervals from day 1 to day 64.
summary(RATS)

#factorization
BPRS$treatment <- as.factor(BPRS$treatment)
BPRS$subject <- as.factor(BPRS$subject)
RATS$ID <- as.factor(RATS$ID)
RATS$Group <- as.factor(RATS$Group)

#convert to long form
library(dplyr)
library(tidyr)
BPRSL <-  BPRS %>% gather(key = weeks, value = bprs, -treatment, -subject)
BPRSL <-  BPRSL %>% mutate(week = as.integer(substr(weeks, 5,5)))
BPRSL <- subset(BPRSL, select = -weeks)
str(BPRSL)
colnames(BPRSL)
summary(BPRSL)


RATSL <- RATS %>%
  gather(key = WD, value = Weight, -ID, -Group) %>%
  mutate(Time = as.integer(substr(WD,3,4)))
str(RATSL)
colnames(RATSL)
summary(RATSL)
