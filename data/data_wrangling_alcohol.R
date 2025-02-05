# Week 3 logistic regression data wrangling, Niko Johansson 15.11.2019.
# Data from UCI Machine Learning Repository
#https://archive.ics.uci.edu/ml/datasets/Student+Performance

#set working directory
setwd("C:\\Users\\Niko\\Documents\\IODS-project\\data")

#read data math
student_mat <- read.csv("student-mat.csv", header = T, sep = ";")
str(student_mat)
# 395 observations, 33 variables. Structure output below.
# 'data.frame':	395 obs. of  33 variables:
#   $ school    : Factor w/ 2 levels "GP","MS": 1 1 1 1 1 1 1 1 1 1 ...
# $ sex       : Factor w/ 2 levels "F","M": 1 1 1 1 1 2 2 1 2 2 ...
# $ age       : int  18 17 15 15 16 16 16 17 15 15 ...
# $ address   : Factor w/ 2 levels "R","U": 2 2 2 2 2 2 2 2 2 2 ...
# $ famsize   : Factor w/ 2 levels "GT3","LE3": 1 1 2 1 1 2 2 1 2 1 ...
# $ Pstatus   : Factor w/ 2 levels "A","T": 1 2 2 2 2 2 2 1 1 2 ...
# $ Medu      : int  4 1 1 4 3 4 2 4 3 3 ...
# $ Fedu      : int  4 1 1 2 3 3 2 4 2 4 ...
# $ Mjob      : Factor w/ 5 levels "at_home","health",..: 1 1 1 2 3 4 3 3 4 3 ...
# $ Fjob      : Factor w/ 5 levels "at_home","health",..: 5 3 3 4 3 3 3 5 3 3 ...
# $ reason    : Factor w/ 4 levels "course","home",..: 1 1 3 2 2 4 2 2 2 2 ...
# $ guardian  : Factor w/ 3 levels "father","mother",..: 2 1 2 2 1 2 2 2 2 2 ...
# $ traveltime: int  2 1 1 1 1 1 1 2 1 1 ...
# $ studytime : int  2 2 2 3 2 2 2 2 2 2 ...
# $ failures  : int  0 0 3 0 0 0 0 0 0 0 ...
# $ schoolsup : Factor w/ 2 levels "no","yes": 2 1 2 1 1 1 1 2 1 1 ...
# $ famsup    : Factor w/ 2 levels "no","yes": 1 2 1 2 2 2 1 2 2 2 ...
# $ paid      : Factor w/ 2 levels "no","yes": 1 1 2 2 2 2 1 1 2 2 ...
# $ activities: Factor w/ 2 levels "no","yes": 1 1 1 2 1 2 1 1 1 2 ...
# $ nursery   : Factor w/ 2 levels "no","yes": 2 1 2 2 2 2 2 2 2 2 ...
# $ higher    : Factor w/ 2 levels "no","yes": 2 2 2 2 2 2 2 2 2 2 ...
# $ internet  : Factor w/ 2 levels "no","yes": 1 2 2 2 1 2 2 1 2 2 ...
# $ romantic  : Factor w/ 2 levels "no","yes": 1 1 1 2 1 1 1 1 1 1 ...
# $ famrel    : int  4 5 4 3 4 5 4 4 4 5 ...
# $ freetime  : int  3 3 3 2 3 4 4 1 2 5 ...
# $ goout     : int  4 3 2 2 2 2 4 4 2 1 ...
# $ Dalc      : int  1 1 2 1 1 1 1 1 1 1 ...
# $ Walc      : int  1 1 3 1 2 2 1 1 1 1 ...
# $ health    : int  3 3 3 5 5 5 3 1 1 5 ...
# $ absences  : int  6 4 10 2 4 10 0 6 0 0 ...
# $ G1        : int  5 5 7 15 6 15 12 6 16 14 ...
# $ G2        : int  6 5 8 14 10 15 12 5 18 15 ...
# $ G3        : int  6 6 10 15 10 15 11 6 19 15 ...

#read data portugal
student_por <- read.csv("student-por.csv", header = T, sep = ";")
str(student_por)
#649 observations of 33 variables, structure output below
# 'data.frame':	649 obs. of  33 variables:
#   $ school    : Factor w/ 2 levels "GP","MS": 1 1 1 1 1 1 1 1 1 1 ...
# $ sex       : Factor w/ 2 levels "F","M": 1 1 1 1 1 2 2 1 2 2 ...
# $ age       : int  18 17 15 15 16 16 16 17 15 15 ...
# $ address   : Factor w/ 2 levels "R","U": 2 2 2 2 2 2 2 2 2 2 ...
# $ famsize   : Factor w/ 2 levels "GT3","LE3": 1 1 2 1 1 2 2 1 2 1 ...
# $ Pstatus   : Factor w/ 2 levels "A","T": 1 2 2 2 2 2 2 1 1 2 ...
# $ Medu      : int  4 1 1 4 3 4 2 4 3 3 ...
# $ Fedu      : int  4 1 1 2 3 3 2 4 2 4 ...
# $ Mjob      : Factor w/ 5 levels "at_home","health",..: 1 1 1 2 3 4 3 3 4 3 ...
# $ Fjob      : Factor w/ 5 levels "at_home","health",..: 5 3 3 4 3 3 3 5 3 3 ...
# $ reason    : Factor w/ 4 levels "course","home",..: 1 1 3 2 2 4 2 2 2 2 ...
# $ guardian  : Factor w/ 3 levels "father","mother",..: 2 1 2 2 1 2 2 2 2 2 ...
# $ traveltime: int  2 1 1 1 1 1 1 2 1 1 ...
# $ studytime : int  2 2 2 3 2 2 2 2 2 2 ...
# $ failures  : int  0 0 0 0 0 0 0 0 0 0 ...
# $ schoolsup : Factor w/ 2 levels "no","yes": 2 1 2 1 1 1 1 2 1 1 ...
# $ famsup    : Factor w/ 2 levels "no","yes": 1 2 1 2 2 2 1 2 2 2 ...
# $ paid      : Factor w/ 2 levels "no","yes": 1 1 1 1 1 1 1 1 1 1 ...
# $ activities: Factor w/ 2 levels "no","yes": 1 1 1 2 1 2 1 1 1 2 ...
# $ nursery   : Factor w/ 2 levels "no","yes": 2 1 2 2 2 2 2 2 2 2 ...
# $ higher    : Factor w/ 2 levels "no","yes": 2 2 2 2 2 2 2 2 2 2 ...
# $ internet  : Factor w/ 2 levels "no","yes": 1 2 2 2 1 2 2 1 2 2 ...
# $ romantic  : Factor w/ 2 levels "no","yes": 1 1 1 2 1 1 1 1 1 1 ...
# $ famrel    : int  4 5 4 3 4 5 4 4 4 5 ...
# $ freetime  : int  3 3 3 2 3 4 4 1 2 5 ...
# $ goout     : int  4 3 2 2 2 2 4 4 2 1 ...
# $ Dalc      : int  1 1 2 1 1 1 1 1 1 1 ...
# $ Walc      : int  1 1 3 1 2 2 1 1 1 1 ...
# $ health    : int  3 3 3 5 5 5 3 1 1 5 ...
# $ absences  : int  4 2 6 0 0 6 0 2 0 0 ...
# $ G1        : int  0 9 12 14 11 12 13 10 15 12 ...
# $ G2        : int  11 11 13 14 13 12 12 13 16 12 ...
# $ G3        : int  11 11 12 14 13 13 13 13 17 13 ...

#for joining open dplyr
library(dplyr)

#set up joining columns
join_by <- c("school", "sex", "age", "address", "famsize", "Pstatus", "Medu", "Fedu", "Mjob", "Fjob", "reason", "nursery", "internet")

#join
joineddata <- inner_join(student_mat, student_por, by = join_by, suffix = c(".math", ".por"))
str(joineddata)
#382 observations of 53 variables, so 20 new variables. Structure output below.
# 'data.frame':	382 obs. of  53 variables:
#   $ school         : Factor w/ 2 levels "GP","MS": 1 1 1 1 1 1 1 1 1 1 ...
# $ sex            : Factor w/ 2 levels "F","M": 1 1 1 1 1 2 2 1 2 2 ...
# $ age            : int  18 17 15 15 16 16 16 17 15 15 ...
# $ address        : Factor w/ 2 levels "R","U": 2 2 2 2 2 2 2 2 2 2 ...
# $ famsize        : Factor w/ 2 levels "GT3","LE3": 1 1 2 1 1 2 2 1 2 1 ...
# $ Pstatus        : Factor w/ 2 levels "A","T": 1 2 2 2 2 2 2 1 1 2 ...
# $ Medu           : int  4 1 1 4 3 4 2 4 3 3 ...
# $ Fedu           : int  4 1 1 2 3 3 2 4 2 4 ...
# $ Mjob           : Factor w/ 5 levels "at_home","health",..: 1 1 1 2 3 4 3 3 4 3 ...
# $ Fjob           : Factor w/ 5 levels "at_home","health",..: 5 3 3 4 3 3 3 5 3 3 ...
# $ reason         : Factor w/ 4 levels "course","home",..: 1 1 3 2 2 4 2 2 2 2 ...
# $ guardian.math  : Factor w/ 3 levels "father","mother",..: 2 1 2 2 1 2 2 2 2 2 ...
# $ traveltime.math: int  2 1 1 1 1 1 1 2 1 1 ...
# $ studytime.math : int  2 2 2 3 2 2 2 2 2 2 ...
# $ failures.math  : int  0 0 3 0 0 0 0 0 0 0 ...
# $ schoolsup.math : Factor w/ 2 levels "no","yes": 2 1 2 1 1 1 1 2 1 1 ...
# $ famsup.math    : Factor w/ 2 levels "no","yes": 1 2 1 2 2 2 1 2 2 2 ...
# $ paid.math      : Factor w/ 2 levels "no","yes": 1 1 2 2 2 2 1 1 2 2 ...
# $ activities.math: Factor w/ 2 levels "no","yes": 1 1 1 2 1 2 1 1 1 2 ...
# $ nursery        : Factor w/ 2 levels "no","yes": 2 1 2 2 2 2 2 2 2 2 ...
# $ higher.math    : Factor w/ 2 levels "no","yes": 2 2 2 2 2 2 2 2 2 2 ...
# $ internet       : Factor w/ 2 levels "no","yes": 1 2 2 2 1 2 2 1 2 2 ...
# $ romantic.math  : Factor w/ 2 levels "no","yes": 1 1 1 2 1 1 1 1 1 1 ...
# $ famrel.math    : int  4 5 4 3 4 5 4 4 4 5 ...
# $ freetime.math  : int  3 3 3 2 3 4 4 1 2 5 ...
# $ goout.math     : int  4 3 2 2 2 2 4 4 2 1 ...
# $ Dalc.math      : int  1 1 2 1 1 1 1 1 1 1 ...
# $ Walc.math      : int  1 1 3 1 2 2 1 1 1 1 ...
# $ health.math    : int  3 3 3 5 5 5 3 1 1 5 ...
# $ absences.math  : int  6 4 10 2 4 10 0 6 0 0 ...
# $ G1.math        : int  5 5 7 15 6 15 12 6 16 14 ...
# $ G2.math        : int  6 5 8 14 10 15 12 5 18 15 ...
# $ G3.math        : int  6 6 10 15 10 15 11 6 19 15 ...
# $ guardian.por   : Factor w/ 3 levels "father","mother",..: 2 1 2 2 1 2 2 2 2 2 ...
# $ traveltime.por : int  2 1 1 1 1 1 1 2 1 1 ...
# $ studytime.por  : int  2 2 2 3 2 2 2 2 2 2 ...
# $ failures.por   : int  0 0 0 0 0 0 0 0 0 0 ...
# $ schoolsup.por  : Factor w/ 2 levels "no","yes": 2 1 2 1 1 1 1 2 1 1 ...
# $ famsup.por     : Factor w/ 2 levels "no","yes": 1 2 1 2 2 2 1 2 2 2 ...
# $ paid.por       : Factor w/ 2 levels "no","yes": 1 1 1 1 1 1 1 1 1 1 ...
# $ activities.por : Factor w/ 2 levels "no","yes": 1 1 1 2 1 2 1 1 1 2 ...
# $ higher.por     : Factor w/ 2 levels "no","yes": 2 2 2 2 2 2 2 2 2 2 ...
# $ romantic.por   : Factor w/ 2 levels "no","yes": 1 1 1 2 1 1 1 1 1 1 ...
# $ famrel.por     : int  4 5 4 3 4 5 4 4 4 5 ...
# $ freetime.por   : int  3 3 3 2 3 4 4 1 2 5 ...
# $ goout.por      : int  4 3 2 2 2 2 4 4 2 1 ...
# $ Dalc.por       : int  1 1 2 1 1 1 1 1 1 1 ...
# $ Walc.por       : int  1 1 3 1 2 2 1 1 1 1 ...
# $ health.por     : int  3 3 3 5 5 5 3 1 1 5 ...
# $ absences.por   : int  4 2 6 0 0 6 0 2 0 0 ...
# $ G1.por         : int  0 9 12 14 11 12 13 10 15 12 ...
# $ G2.por         : int  11 11 13 14 13 12 12 13 16 12 ...
# $ G3.por         : int  11 11 12 14 13 13 13 13 17 13 ...

#combining duplicate data

#only joining columns
alc <- select(joineddata, one_of(join_by))

#non-joined columns
notjoined_columns <- colnames(student_mat)[!colnames(student_mat) %in% join_by]

#if-then loop for combining
for(column_name in notjoined_columns) 
  {
    two_columns <- select(joineddata, starts_with(column_name))
    # select the first column vector of those two columns
  first_column <- select(two_columns, 1)[[1]]

# if that first column vector is numeric...
if(is.numeric(first_column)) {
  # take a rounded average of each row of the two columns and
  # add the resulting vector to the alc data frame
  alc[column_name] <- round(rowMeans(two_columns))
} else { # else if it's not numeric...
  # add the first column vector to the alc data frame
  alc[column_name] <- first_column
}
}

#creating the alc_use column as an average of Dalc and Walc
alc <- mutate(alc, alc_use = (Dalc + Walc) / 2)

#creating the logical high_use which is T if alc_use > 2
alc <- mutate(alc, high_use = alc_use > 2)

#glimpse the final dataset
glimpse(alc)
#382 observations of 35 variables, looks good, output below
# Observations: 382
# Variables: 35
# $ school     <fct> GP, GP, GP, GP, GP, GP, GP, GP, GP, ...
# $ sex        <fct> F, F, F, F, F, M, M, F, M, M, F, F, ...
# $ age        <int> 18, 17, 15, 15, 16, 16, 16, 17, 15, ...
# $ address    <fct> U, U, U, U, U, U, U, U, U, U, U, U, ...
# $ famsize    <fct> GT3, GT3, LE3, GT3, GT3, LE3, LE3, G...
# $ Pstatus    <fct> A, T, T, T, T, T, T, A, A, T, T, T, ...
# $ Medu       <int> 4, 1, 1, 4, 3, 4, 2, 4, 3, 3, 4, 2, ...
# $ Fedu       <int> 4, 1, 1, 2, 3, 3, 2, 4, 2, 4, 4, 1, ...
# $ Mjob       <fct> at_home, at_home, at_home, health, o...
# $ Fjob       <fct> teacher, other, other, services, oth...
# $ reason     <fct> course, course, other, home, home, r...
# $ nursery    <fct> yes, no, yes, yes, yes, yes, yes, ye...
# $ internet   <fct> no, yes, yes, yes, no, yes, yes, no,...
# $ guardian   <fct> mother, father, mother, mother, fath...
# $ traveltime <dbl> 2, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 3, ...
# $ studytime  <dbl> 2, 2, 2, 3, 2, 2, 2, 2, 2, 2, 2, 3, ...
# $ failures   <dbl> 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, ...
# $ schoolsup  <fct> yes, no, yes, no, no, no, no, yes, n...
# $ famsup     <fct> no, yes, no, yes, yes, yes, no, yes,...
# $ paid       <fct> no, no, yes, yes, yes, yes, no, no, ...
# $ activities <fct> no, no, no, yes, no, yes, no, no, no...
# $ higher     <fct> yes, yes, yes, yes, yes, yes, yes, y...
# $ romantic   <fct> no, no, no, yes, no, no, no, no, no,...
# $ famrel     <dbl> 4, 5, 4, 3, 4, 5, 4, 4, 4, 5, 3, 5, ...
# $ freetime   <dbl> 3, 3, 3, 2, 3, 4, 4, 1, 2, 5, 3, 2, ...
# $ goout      <dbl> 4, 3, 2, 2, 2, 2, 4, 4, 2, 1, 3, 2, ...
# $ Dalc       <dbl> 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, ...
# $ Walc       <dbl> 1, 1, 3, 1, 2, 2, 1, 1, 1, 1, 2, 1, ...
# $ health     <dbl> 3, 3, 3, 5, 5, 5, 3, 1, 1, 5, 2, 4, ...
# $ absences   <dbl> 5, 3, 8, 1, 2, 8, 0, 4, 0, 0, 1, 2, ...
# $ G1         <dbl> 2, 7, 10, 14, 8, 14, 12, 8, 16, 13, ...
# $ G2         <dbl> 8, 8, 10, 14, 12, 14, 12, 9, 17, 14,...
# $ G3         <dbl> 8, 8, 11, 14, 12, 14, 12, 10, 18, 14...
# $ alc_use    <dbl> 1.0, 1.0, 2.5, 1.0, 1.5, 1.5, 1.0, 1...
# $ high_use   <lgl> FALSE, FALSE, TRUE, FALSE, FALSE, FA...

#saving data
write.table(alc, "alc.txt")
read.table("alc.txt")
alc <- read.table("alc.txt")
