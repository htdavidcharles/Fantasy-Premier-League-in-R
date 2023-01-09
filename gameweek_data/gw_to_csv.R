# Import Libraries ####
library(jsonlite)
library(httr)
library(tidyverse)



# Import player id csv ####
id_dict <- read.csv("id_dict.csv")
id_dict <- id_dict %>%
  rename(id = FPL_ID) #rename column to match id column name found in the API game week data for merging

# Grab API for game week data ####
gw1 = GET("https://fantasy.premierleague.com/api/event/1/live/")
gw2 = GET("https://fantasy.premierleague.com/api/event/2/live/")
gw3 = GET("https://fantasy.premierleague.com/api/event/3/live/")
gw4 = GET("https://fantasy.premierleague.com/api/event/4/live/")
gw5 = GET("https://fantasy.premierleague.com/api/event/5/live/")
gw6 = GET("https://fantasy.premierleague.com/api/event/6/live/")
gw7 = GET("https://fantasy.premierleague.com/api/event/7/live/") # this data is blank due to all matches being cancelled that game week
gw8 = GET("https://fantasy.premierleague.com/api/event/8/live/")
gw9 = GET("https://fantasy.premierleague.com/api/event/9/live/")
gw10 = GET("https://fantasy.premierleague.com/api/event/10/live/")
gw11 = GET("https://fantasy.premierleague.com/api/event/11/live/")
gw12 = GET("https://fantasy.premierleague.com/api/event/12/live/")
gw13 = GET("https://fantasy.premierleague.com/api/event/13/live/")
gw14 = GET("https://fantasy.premierleague.com/api/event/14/live/")
gw15 = GET("https://fantasy.premierleague.com/api/event/15/live/")
gw16 = GET("https://fantasy.premierleague.com/api/event/16/live/")
gw17 = GET("https://fantasy.premierleague.com/api/event/17/live/")
gw18 = GET("https://fantasy.premierleague.com/api/event/18/live/")

# Convert from JSON to character ####
gw1_data = fromJSON(rawToChar(gw1$content))
gw2_data = fromJSON(rawToChar(gw2$content))
gw3_data = fromJSON(rawToChar(gw3$content))
gw4_data = fromJSON(rawToChar(gw4$content))
gw5_data = fromJSON(rawToChar(gw5$content))
gw6_data = fromJSON(rawToChar(gw6$content))
gw7_data = fromJSON(rawToChar(gw7$content))
gw8_data = fromJSON(rawToChar(gw8$content))
gw9_data = fromJSON(rawToChar(gw9$content))
gw10_data = fromJSON(rawToChar(gw10$content))
gw11_data = fromJSON(rawToChar(gw11$content))
gw12_data = fromJSON(rawToChar(gw12$content))
gw13_data = fromJSON(rawToChar(gw13$content))
gw14_data = fromJSON(rawToChar(gw14$content))
gw15_data = fromJSON(rawToChar(gw15$content))
gw16_data = fromJSON(rawToChar(gw16$content))
gw17_data = fromJSON(rawToChar(gw17$content))
gw18_data = fromJSON(rawToChar(gw18$content))

# Convert data to data frame ####
gw1_data <- as.data.frame(gw1_data$elements)
gw2_data <- as.data.frame(gw2_data$elements)
gw3_data <- as.data.frame(gw3_data$elements)
gw4_data <- as.data.frame(gw4_data$elements)
gw5_data <- as.data.frame(gw5_data$elements)
gw6_data <- as.data.frame(gw6_data$elements)
gw7_data <- as.data.frame(gw7_data$elements)
gw8_data <- as.data.frame(gw8_data$elements)
gw9_data <- as.data.frame(gw9_data$elements)
gw10_data <- as.data.frame(gw10_data$elements)
gw11_data <- as.data.frame(gw11_data$elements)
gw12_data <- as.data.frame(gw12_data$elements)
gw13_data <- as.data.frame(gw13_data$elements)
gw14_data <- as.data.frame(gw14_data$elements)
gw15_data <- as.data.frame(gw15_data$elements)
gw16_data <- as.data.frame(gw16_data$elements)
gw17_data <- as.data.frame(gw17_data$elements)
gw18_data <- as.data.frame(gw18_data$elements)

# Merge data to match player id's ####
gw1_data <- merge(id_dict, gw1_data, by="id")
gw2_data <- merge(id_dict, gw2_data, by="id")
gw3_data <- merge(id_dict, gw3_data, by="id")
gw4_data <- merge(id_dict, gw4_data, by="id")
gw5_data <- merge(id_dict, gw5_data, by="id")
gw6_data <- merge(id_dict, gw6_data, by="id")
gw7_data <- merge(id_dict, gw7_data, by="id")
gw8_data <- merge(id_dict, gw8_data, by="id")
gw9_data <- merge(id_dict, gw9_data, by="id")
gw10_data <- merge(id_dict, gw10_data, by="id")
gw11_data <- merge(id_dict, gw11_data, by="id")
gw12_data <- merge(id_dict, gw12_data, by="id")
gw13_data <- merge(id_dict, gw13_data, by="id")
gw14_data <- merge(id_dict, gw14_data, by="id")
gw15_data <- merge(id_dict, gw15_data, by="id")
gw16_data <- merge(id_dict, gw16_data, by="id")
gw17_data <- merge(id_dict, gw17_data, by="id")
gw18_data <- merge(id_dict, gw18_data, by="id")
# Create .CSV's of each game week ####

# GAME WEEK 1
gw1_csv <- unnest(gw1_data, stats)
gw1_csv <- gw1_csv %>%
  filter(minutes > 0) %>%
  select(-c(explain, in_dreamteam, FPL_Name, id, Understat_ID))
write_csv(gw1_csv, "gameweek_data/gw_csv/gw1.csv")

# GAME WEEK 2
gw2_csv <- unnest(gw2_data, stats)
gw2_csv <- gw2_csv %>%
  filter(minutes > 0) %>%
  select(-c(explain, in_dreamteam, FPL_Name, id, Understat_ID))
write_csv(gw2_csv, "gameweek_data/gw_csv/gw2.csv")

# GAME WEEK 3
gw3_csv <- unnest(gw3_data, stats)
gw3_csv <- gw3_csv %>%
  filter(minutes > 0) %>%
  select(-c(explain, in_dreamteam, FPL_Name, id, Understat_ID))
write_csv(gw3_csv, "gameweek_data/gw_csv/gw3.csv")

# GAME WEEK 4
gw4_csv <- unnest(gw4_data, stats)
gw4_csv <- gw4_csv %>%
  filter(minutes > 0) %>%
  select(-c(explain, in_dreamteam, FPL_Name, id, Understat_ID))
write_csv(gw4_csv, "gameweek_data/gw_csv/gw4.csv")

# GAME WEEK 5
gw5_csv <- unnest(gw5_data, stats)
gw5_csv <- gw5_csv %>%
  filter(minutes > 0) %>%
  select(-c(explain, in_dreamteam, FPL_Name, id, Understat_ID))
write_csv(gw5_csv, "gameweek_data/gw_csv/gw5.csv")

# GAME WEEK 6
gw6_csv <- unnest(gw6_data, stats)
gw6_csv <- gw6_csv %>%
  filter(minutes > 0) %>%
  select(-c(explain, in_dreamteam, FPL_Name, id, Understat_ID))
write_csv(gw6_csv, "gameweek_data/gw_csv/gw6.csv")

# GAME WEEK 7 - NO DATA DUE TO FIXTURE CANCELLATION

# GAME WEEK 8
gw8_csv <- unnest(gw8_data, stats)
gw8_csv <- gw8_csv %>%
  filter(minutes > 0) %>%
  select(-c(explain, in_dreamteam, FPL_Name, id, Understat_ID))
write_csv(gw8_csv, "gameweek_data/gw_csv/gw8.csv")

# GAME WEEK 9
gw9_csv <- unnest(gw9_data, stats)
gw9_csv <- gw9_csv %>%
  filter(minutes > 0) %>%
  select(-c(explain, in_dreamteam, FPL_Name, id, Understat_ID))
write_csv(gw9_csv, "gameweek_data/gw_csv/gw9.csv")

# GAME WEEK 10
gw10_csv <- unnest(gw10_data, stats)
gw10_csv <- gw10_csv %>%
  filter(minutes > 0) %>%
  select(-c(explain, in_dreamteam, FPL_Name, id, Understat_ID))
write_csv(gw10_csv, "gameweek_data/gw_csv/gw10.csv")

# GAME WEEK 11
gw11_csv <- unnest(gw11_data, stats)
gw11_csv <- gw11_csv %>%
  filter(minutes > 0) %>%
  select(-c(explain, in_dreamteam, FPL_Name, id, Understat_ID))
write_csv(gw11_csv, "gameweek_data/gw_csv/gw11.csv")

# GAME WEEK 12
gw12_csv <- unnest(gw12_data, stats)
gw12_csv <- gw12_csv %>%
  filter(minutes > 0) %>%
  select(-c(explain, in_dreamteam, FPL_Name, id, Understat_ID))
write_csv(gw12_csv, "gameweek_data/gw_csv/gw12.csv")

# GAME WEEK 13
gw13_csv <- unnest(gw13_data, stats)
gw13_csv <- gw13_csv %>%
  filter(minutes > 0) %>%
  select(-c(explain, in_dreamteam, FPL_Name, id, Understat_ID))
write_csv(gw13_csv, "gameweek_data/gw_csv/gw13.csv")

# GAME WEEK 14
gw14_csv <- unnest(gw14_data, stats)
gw14_csv <- gw14_csv %>%
  filter(minutes > 0) %>%
  select(-c(explain, in_dreamteam, FPL_Name, id, Understat_ID))
write_csv(gw14_csv, "gameweek_data/gw_csv/gw14.csv")

# GAME WEEK 15
gw15_csv <- unnest(gw15_data, stats)
gw15_csv <- gw15_csv %>%
  filter(minutes > 0) %>%
  select(-c(explain, in_dreamteam, FPL_Name, id, Understat_ID))
write_csv(gw15_csv, "gameweek_data/gw_csv/gw15.csv")

# GAME WEEK 16
gw16_csv <- unnest(gw16_data, stats)
gw16_csv <- gw16_csv %>%
  filter(minutes > 0) %>%
  select(-c(explain, in_dreamteam, FPL_Name, id, Understat_ID))
write_csv(gw16_csv, "gameweek_data/gw_csv/gw16.csv")

# GAME WEEK 17
gw17_csv <- unnest(gw17_data, stats)
gw17_csv <- gw17_csv %>%
  filter(minutes > 0) %>%
  select(-c(explain, in_dreamteam, FPL_Name, id, Understat_ID))
write_csv(gw17_csv, "gameweek_data/gw_csv/gw17.csv")

# GAME WEEK 18
gw18_csv <- unnest(gw18_data, stats)
gw18_csv <- gw18_csv %>%
  filter(minutes > 0) %>%
  select(-c(explain, in_dreamteam, FPL_Name, id, Understat_ID))
write_csv(gw18_csv, "gameweek_data/gw_csv/gw18.csv")