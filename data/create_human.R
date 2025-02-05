#data wrangling for week 4(human dataset)

hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

#summary and structure
#human development first
str(hd)
# 'data.frame':	195 obs. of  8 variables:
#   $ HDI.Rank                              : int  1 2 3 4 5 6 6 8 9 9 ...
# $ Country                               : chr  "Norway" "Australia" "Switzerland" "Denmark" ...
# $ Human.Development.Index..HDI.         : num  0.944 0.935 0.93 0.923 0.922 0.916 0.916 0.915 0.913 0.913 ...
# $ Life.Expectancy.at.Birth              : num  81.6 82.4 83 80.2 81.6 80.9 80.9 79.1 82 81.8 ...
# $ Expected.Years.of.Education           : num  17.5 20.2 15.8 18.7 17.9 16.5 18.6 16.5 15.9 19.2 ...
# $ Mean.Years.of.Education               : num  12.6 13 12.8 12.7 11.9 13.1 12.2 12.9 13 12.5 ...
# $ Gross.National.Income..GNI..per.Capita: chr  "64,992" "42,261" "56,431" "44,025" ...
# $ GNI.per.Capita.Rank.Minus.HDI.Rank    : int  5 17 6 11 9 11 16 3 11 23 ...
summary(hd)
# HDI.Rank        Country          Human.Development.Index..HDI.
# Min.   :  1.00   Length:195         Min.   :0.3480               
# 1st Qu.: 47.75   Class :character   1st Qu.:0.5770               
# Median : 94.00   Mode  :character   Median :0.7210               
# Mean   : 94.31                      Mean   :0.6918               
# 3rd Qu.:141.25                      3rd Qu.:0.8000               
# Max.   :188.00                      Max.   :0.9440               
# NA's   :7                                                        
#  Life.Expectancy.at.Birth Expected.Years.of.Education
#  Min.   :49.00            Min.   : 4.10              
#  1st Qu.:65.75            1st Qu.:11.10              
#  Median :73.10            Median :13.10              
#  Mean   :71.07            Mean   :12.86              
#  3rd Qu.:76.80            3rd Qu.:14.90              
#  Max.   :84.00            Max.   :20.20              
#                                                      
#  Mean.Years.of.Education Gross.National.Income..GNI..per.Capita
#  Min.   : 1.400          Length:195                            
#  1st Qu.: 5.550          Class :character                      
#  Median : 8.400          Mode  :character                      
#  Mean   : 8.079                                                
#  3rd Qu.:10.600                                                
#  Max.   :13.100                                                
#                                                                
#  GNI.per.Capita.Rank.Minus.HDI.Rank
#  Min.   :-84.0000                  
#  1st Qu.: -9.0000                  
#  Median :  1.5000                  
#  Mean   :  0.1862                  
#  3rd Qu.: 11.0000                  
#  Max.   : 47.0000                  
#  NA's   :7             

#then gender inequality
str(gii)
# 'data.frame':	195 obs. of  10 variables:
#   $ GII.Rank                                    : int  1 2 3 4 5 6 6 8 9 9 ...
# $ Country                                     : chr  "Norway" "Australia" "Switzerland" "Denmark" ...
# $ Gender.Inequality.Index..GII.               : num  0.067 0.11 0.028 0.048 0.062 0.041 0.113 0.28 0.129 0.157 ...
# $ Maternal.Mortality.Ratio                    : int  4 6 6 5 6 7 9 28 11 8 ...
# $ Adolescent.Birth.Rate                       : num  7.8 12.1 1.9 5.1 6.2 3.8 8.2 31 14.5 25.3 ...
# $ Percent.Representation.in.Parliament        : num  39.6 30.5 28.5 38 36.9 36.9 19.9 19.4 28.2 31.4 ...
# $ Population.with.Secondary.Education..Female.: num  97.4 94.3 95 95.5 87.7 96.3 80.5 95.1 100 95 ...
# $ Population.with.Secondary.Education..Male.  : num  96.7 94.6 96.6 96.6 90.5 97 78.6 94.8 100 95.3 ...
# $ Labour.Force.Participation.Rate..Female.    : num  61.2 58.8 61.8 58.7 58.5 53.6 53.1 56.3 61.6 62 ...
# $ Labour.Force.Participation.Rate..Male.      : num  68.7 71.8 74.9 66.4 70.6 66.4 68.1 68.9 71 73.8 ...
summary(gii)
# GII.Rank        Country          Gender.Inequality.Index..GII.
# Min.   :  1.00   Length:195         Min.   :0.0160               
# 1st Qu.: 47.75   Class :character   1st Qu.:0.2030               
# Median : 94.00   Mode  :character   Median :0.3935               
# Mean   : 94.31                      Mean   :0.3695               
# 3rd Qu.:141.25                      3rd Qu.:0.5272               
# Max.   :188.00                      Max.   :0.7440               
# NA's   :7                           NA's   :33                   
# Maternal.Mortality.Ratio Adolescent.Birth.Rate
# Min.   :   1.0           Min.   :  0.60       
# 1st Qu.:  16.0           1st Qu.: 15.45       
# Median :  69.0           Median : 40.95       
# Mean   : 163.2           Mean   : 49.55       
# 3rd Qu.: 230.0           3rd Qu.: 71.78       
# Max.   :1100.0           Max.   :204.80       
# NA's   :10               NA's   :5            
# Percent.Representation.in.Parliament
# Min.   : 0.00                       
# 1st Qu.:12.47                       
# Median :19.50                       
# Mean   :20.60                       
# 3rd Qu.:27.02                       
# Max.   :57.50                       
# NA's   :3                           
# Population.with.Secondary.Education..Female.
# Min.   :  0.9                               
# 1st Qu.: 27.8                               
# Median : 55.7                               
# Mean   : 54.8                               
# 3rd Qu.: 81.8                               
# Max.   :100.0                               
# NA's   :26                                  
#  Population.with.Secondary.Education..Male.
#  Min.   :  3.20                            
#  1st Qu.: 38.30                            
#  Median : 60.00                            
#  Mean   : 60.29                            
#  3rd Qu.: 85.80                            
#  Max.   :100.00                            
#  NA's   :26                                
#  Labour.Force.Participation.Rate..Female.
#  Min.   :13.50                           
#  1st Qu.:44.50                           
#  Median :53.30                           
#  Mean   :52.61                           
#  3rd Qu.:62.62                           
#  Max.   :88.10                           
#  NA's   :11                              
#  Labour.Force.Participation.Rate..Male.
#  Min.   :44.20                         
#  1st Qu.:68.88                         
#  Median :75.55                         
#  Mean   :74.74                         
#  3rd Qu.:80.15                         
#  Max.   :95.50                         
#  NA's   :11  

#renaming variables
colnames(hd)
# [1] "HDI.Rank"                              
# [2] "Country"                               
# [3] "Human.Development.Index..HDI."         
# [4] "Life.Expectancy.at.Birth"              
# [5] "Expected.Years.of.Education"           
# [6] "Mean.Years.of.Education"               
# [7] "Gross.National.Income..GNI..per.Capita"
# [8] "GNI.per.Capita.Rank.Minus.HDI.Rank"  
colnames(hd) <- c("HDIrank", "country", "HDI", "life_exp_b", "eduyears", "meaneduyears","GNIperC","GNIrank-HDIrank")
colnames(gii)
# [1] "GII.Rank"                                    
# [2] "Country"                                     
# [3] "Gender.Inequality.Index..GII."               
# [4] "Maternal.Mortality.Ratio"                    
# [5] "Adolescent.Birth.Rate"                       
# [6] "Percent.Representation.in.Parliament"        
# [7] "Population.with.Secondary.Education..Female."
# [8] "Population.with.Secondary.Education..Male."  
# [9] "Labour.Force.Participation.Rate..Female."    
# [10] "Labour.Force.Participation.Rate..Male." 
colnames(gii) <- c("GIIrank", "country", "GII", "MMratio", "adol_br", "F_in_parlament", "edu2F","edu2M", "employedF", "employedM")

library(dplyr)
#new variable eduratio
gii <- mutate(gii, eduratio = (edu2F / edu2M))
#new variable empratio
gii <- mutate(gii, empratio = (employedF / employedM))

#joining
human <- inner_join(hd, gii, by = "country")
str(human)
# 'data.frame':	195 obs. of  19 variables:
#   $ HDIrank        : int  1 2 3 4 5 6 6 8 9 9 ...
# $ country        : chr  "Norway" "Australia" "Switzerland" "Denmark" ...
# $ HDI            : num  0.944 0.935 0.93 0.923 0.922 0.916 0.916 0.915 0.913 0.913 ...
# $ life_exp_b     : num  81.6 82.4 83 80.2 81.6 80.9 80.9 79.1 82 81.8 ...
# $ eduyears       : num  17.5 20.2 15.8 18.7 17.9 16.5 18.6 16.5 15.9 19.2 ...
# $ meaneduyears   : num  12.6 13 12.8 12.7 11.9 13.1 12.2 12.9 13 12.5 ...
# $ GNIperC        : chr  "64,992" "42,261" "56,431" "44,025" ...
# $ GNIrank-HDIrank: int  5 17 6 11 9 11 16 3 11 23 ...
# $ GIIrank        : int  1 2 3 4 5 6 6 8 9 9 ...
# $ GII            : num  0.067 0.11 0.028 0.048 0.062 0.041 0.113 0.28 0.129 0.157 ...
# $ MMratio        : int  4 6 6 5 6 7 9 28 11 8 ...
# $ adol_br        : num  7.8 12.1 1.9 5.1 6.2 3.8 8.2 31 14.5 25.3 ...
# $ F_in_parlament : num  39.6 30.5 28.5 38 36.9 36.9 19.9 19.4 28.2 31.4 ...
# $ edu2F          : num  97.4 94.3 95 95.5 87.7 96.3 80.5 95.1 100 95 ...
# $ edu2M          : num  96.7 94.6 96.6 96.6 90.5 97 78.6 94.8 100 95.3 ...
# $ employedF      : num  61.2 58.8 61.8 58.7 58.5 53.6 53.1 56.3 61.6 62 ...
# $ employedM      : num  68.7 71.8 74.9 66.4 70.6 66.4 68.1 68.9 71 73.8 ...
# $ eduratio       : num  1.007 0.997 0.983 0.989 0.969 ...
# $ empratio       : num  0.891 0.819 0.825 0.884 0.829 ...
library(dplyr)
library(rlang)
install.packages("rlang")
install.packages("ggplot2")
library(ggplot2)
install.packages("stringr")
library(stringr)
library(progress)
install.packages("progress")
install.packages("rlang")
library(rlang)
ggpairs(human)
install.packages("FactoMineR")
install.packages("Rtools")
library(FactoMiner)
data(tea)
upda