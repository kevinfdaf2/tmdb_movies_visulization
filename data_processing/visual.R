# Load packages
library(ggplot2) # visualization
library(scales) # visualization
library(dplyr) # data manipulation
library(visdat)

# read data
movie <- read.csv('movie_final.csv')
# create a column to store periode and set the defual value to 0s
movie$periodes <- rep(0)
# change all value to date type
movie$release_date <- as.Date(movie$release_date)
movie$homepage[movie$homepage == "No homepage link available at the moment."] = "./nohomepage.html"

# give the periods values
movie[which(movie$release_date >= as.Date('1910-01-01') & movie$release_date < as.Date('1979-12-31')),]$periodes = '1910-1980'
movie[which(movie$release_date >= as.Date('1980-01-01') & movie$release_date < as.Date('1989-12-31')),]$periodes = '1980-1990'
movie[which(movie$release_date >= as.Date('1990-01-01') & movie$release_date < as.Date('2099-12-31')),]$periodes = '1990-2000'
movie[which(movie$release_date >= as.Date('2000-01-01') & movie$release_date < as.Date('2009-12-31')),]$periodes = '2000-2010'
movie[which(movie$release_date >= as.Date('2010-01-01') & movie$release_date < as.Date('2017-06-01')),]$periodes = '2010-2017'

# check the unique values
unique(movie$periodes)

top_pop_peri <- data_frame()
# get the top popularity film of each period
for (i in unique(movie$periodes)){
  print(i)
  top_pop_peri <- rbind(top_pop_peri, movie[movie$popularity == max(movie[which(movie$periodes == i),]$popularity),])
  
}
movie %>% 
  group_by(periodes) %>%
  sum(movie$History)

movierank <- movie[,c(2:3,5:13,15:17,36:37, 39)]


movierank$budget <- movierank$budget/1000000
movierank$revenue <- movierank$revenue/1000000
#names(movierank)[1] <-"budget(million)"
#names(movierank)[9] <-"revenue(million)"
#names(movierank)[10] <- "runtime(min)"

write.csv(movierank,"movierank.csv")

data <- movierank[,c(1:3,5:13, 15:16)]
data <- data[order(-data$budget),]
data <- data[c(1:300),]
write.csv(data,"scatter.csv")












