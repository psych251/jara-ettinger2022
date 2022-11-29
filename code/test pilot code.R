install.packages("here")


```{r}
library(foreign) # for reading spss formatted data
library(tidyr)
library(dplyr)
library(stringr) # useful for some string manipulation
library(ggplot2)
library(here)
```

# if you're using custom packages, include path

## set paths
# setwd("/Users/elenaluchkina/Documents/GitHub/code_review/9 months csv")
#path <- here::here("/Volumes/GoogleDrive/My Drive/PhD stuff/courses/Autumn 2022/Experimental methods /course project/code/Jara-ettinger2022_October 27, 2022_19.57.csv")
# consider getting rid of sapces in filenames
#merge_file_name <- here::here('data/9 months csv/All_9mo')

## load data
#filenames <- list.files(path= path, full.names=TRUE)
#all_data <- map_df(filenames, ~read.csv(.x) %>% mutate(File = basename(.x)))
#df <- strings2factors(all_data) # convert all strings to factors, rename as df

d = read.csv("Jara-ettinger2022_October 27, 2022_19.57.csv")
d_filtered1 = d %>% select(c("ResponseId", "Q5", "Q9", "Q12"))
d_filtered2 = d_filtered1 %>% 
  pivot_longer(cols = -c("ResponseId") ,names_to = 'Question', values_to = 'Choice')

tiny_demo_d %>% pivot_longer(cols=-c("Subject", "Cond"), # this tells it to transform all columns *except* these ones
                             names_to='Measurement', 
                             values_to='Value')