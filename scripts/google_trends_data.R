library(tidyverse)
library(gtrendsR)

trends <- gtrends(
  keyword = "flu symptoms",
  geo = "US",
  time = "2014-10-01 2026-02-01"
)

# Select the columns we want for analysis.
trends_by_time <- trends$interest_over_time %>%
  select(date, hits)

head(trends_by_time)

# Plot hits by date to get an idea of the trend. 
plot_gtrends <- trends_by_time %>% ggplot(aes(x=date, y=hits)) +
  geom_line()
plot_gtrends # Interestingly we see a consistent pattern except for the two years following covid. 
# "Flu symptoms" are likely search less often as people are searching "covid symptoms" instead.
# Also, 2018's flu season must have been rough!

# Split by pre and post covid if further analysis wanted to be done related to that.
trends_pre <- trends_by_time %>%
  filter(date < as.Date("2020-03-01"))
trends_post <- trends_by_time %>%
  filter(date >= as.Date("2020-03-01"))

head(trends_pre)
head(trends_post)