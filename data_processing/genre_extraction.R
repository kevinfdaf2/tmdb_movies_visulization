# load library
library(readr)
library(tidyverse)
library(visdat)
library(dplyr)
# expand the decimal point display range to 100 digits
options(scipen = 100)
# read csv file
credits <- read_csv("./credits.csv")
movies <- read_csv("./movies.csv")

# delete witch don't have director recodes
credits <- credits[-which(is.na(credits$director)),]
credits <- credits[-2]
# replace NA values
credits$crew[is.na(credits$crew)] <- "No crews information is available at the moment."
credits$cast[is.na(credits$cast)] <- "No casts information is available at the moment."
#remove unnecessary column
movies <- movies[, -c(22,26)]
# use bool value to replce genre columns
for (i in c(17:34)){
  names(movies)[i] <- unique(movies[!is.na(movies[i]),][i])
  movies[i][!is.na(movies[i])] <- "1"
  movies[i][is.na(movies[i])] <- "0"
}
# remove all the movies haven release or missing release date
movies <- movies[-which(is.na(movies$release_date)),]
movies$homepage[is.na(movies$homepage)] <- "No homepage link available at the moment."
movies$overview[is.na(movies$overview)] <- "No overview available at the moment."
movies$spoken_languages[is.na(movies$spoken_languages)] <- "Unknow"
movies$runtime[is.na(movies$runtime)] <- 120
# join two data set together
movie_final <- inner_join(movies, credits, by = c("id" = "movie_id"))
# write into a new csv file
write.csv(movie_final,"movie_final.csv")

# movie genre - popularity
library(readr)
library(tidyverse)
library(ggplot2)
library(dplyr)
genpop <- read_csv("./movie_final.csv")
genpop <- genpop[c(7,10, c(18:35))]
data <- data.frame()
for (i in c(3:20)){
  m <- genpop %>% filter(genpop[i] == 1)
  m <- m[c(1,2,i)]
  m[3] <- names(genpop)[i]
  names(m)[3] <- "genre"
  
  data <- bind_rows(data, m)
  names(data)[3] <- "genre"
}
write.csv(data,"genpop.csv")
 



