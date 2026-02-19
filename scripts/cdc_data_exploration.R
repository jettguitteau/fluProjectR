library(tidyverse)
library(lubridate)

# Loading the data
cdcdata <- read_csv('data/cdcdata.csv')

# Viewing the data
head(cdcdata)

# Determining the rating system for activity level
unique(cdcdata$`ACTIVITY LEVEL`)

# Cleaning data: removing unnecessary columns, renaming columns for clarity, changing data types for analysis
cdcdata <- cdcdata %>%
  select(-URL, -WEBSITE) %>%
  rename(DATE = WEEKEND) %>%
  mutate(`ACTIVITY LEVEL` = parse_number(`ACTIVITY LEVEL`)) %>%
  mutate(DATE = mdy(DATE))

# Viewing cleaned data
head(cdcdata)

# Aggregating data to be one national data set based on date and average activity level.
cdcus <- cdcdata %>%
  group_by(DATE) %>%
  summarize(ACTIVITY_LEVEL = mean(`ACTIVITY LEVEL`, na.rm = TRUE))

head(cdcus)

plot_cdc <- cdcus %>% ggplot(aes(x=DATE, y=ACTIVITY_LEVEL)) +
  geom_line()
plot_cdc # We see consistent spikes around flu season, just like in the google trends searches. Likely showing a relationship in google searches and visits for flu like symptoms. 
# There is also a strange nuance in 2021 and 2022, likely related to social distancing lowering transmission of disease and lock downs lowering outpatient visits. Uncertain if telehealth is counted. 

# Splitting dataset to pre-covid and post-covid & viewing the new data frames.
cdc_pre <- cdcus %>%
  filter(DATE < as.Date("2020-03-01"))
cdc_post <- cdcus %>%
  filter(DATE >= as.Date("2020-03-01"))
head(cdc_pre)
head(cdc_post)

