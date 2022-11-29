```{r}
library(foreign) # for reading spss formatted data
library(tidyr)
library(dplyr)
library(stringr) # useful for some string manipulation
library(ggplot2)
library(here)
```

##### Import Data ####
d = read.csv("Jara-ettinger2022_October 28, 2022_22.24.csv")

#path <- here::here('Jara-ettinger2022_October 28, 2022_22.24.csv')
d_filtered = d %>% select(c("ResponseId", "Q5", "Q9", "Q12"))
d_filtered_long = d_filtered %>% 
  pivot_longer(cols = -c("ResponseId") ,names_to = 'Question', values_to = 'Choice')


##### Data preperation #####


#d_filtered_long <- factor(d_filtered_long)
#is.factor(d_filtered_long$Question)
#factor(d_filtered_long$Question)
#print(levels(d_filtered_long$Question))
#levels(val)[levels(val) == "Coding"] < - "Learning"

d_filtered_long$Question[d_filtered_long$Question == "Q5"] <- "Yarn"
d_filtered_long$Question[d_filtered_long$Question == "Q9"] <- "Dax"
d_filtered_long$Question[d_filtered_long$Question == "Q12"] <- "Fep"

d_filtered_long$Choice[d_filtered_long$Choice == "IM_eY8Vwfih2OynNCm"] <- "Yarn"
d_filtered_long$Choice[d_filtered_long$Choice == "IM_enDeJ2onL1JrLP8"] <- "Fep"
d_filtered_long$Choice[d_filtered_long$Choice == "IM_5A9xQWROP0v4aPA"] <- "Dax"


#d_filtered_long = d_filtered_long %>% select(-contains("Response ID"))
#d_filtered_long = d_filtered_long %>% filter(ResponseId != "Response ID", ResponseId != "{"ImportId":"_recordId"}"
                                             
d_filtered_long = d_filtered_long %>% filter( !grepl("Import|Response",ResponseId))
is.na(d_filtered_long$Choice)
d_filtered_long$Choice[d_filtered_long$Choice==""] <- NA


d_filtered_long = d_filtered_long %>% filter(!is.na(Choice))


##### Analysis ####
