#Week 5 data wrangling

human <- read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt", header = T, sep = ",")

#changing GNIperC to numerical values with sttring manipulation
str_replace(human$GNI, pattern = ",", replacement = "") %>% as.numeric()

#removing unwanted variables
#columns to keep
keep <- c("Country", "Edu2.FM", "Labo.FM", "Edu.Exp", "Life.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F")
human <- select(human, one_of(keep))

#removing rows with NA
data.frame(human[-1], comp = complete.cases(human))
human_ <- filter(human, complete.cases(human))

#removing last 7 rows
last <- nrow(human_) -7
human_ <- human_[1:last,]

#naming rows as country names
rownames(human_)<- human_$Country

#remove country as variable
human_ <- select(human_, -Country)
str(human_)
write.csv(human_,"human.csv", row.names = T)
?write.csv
