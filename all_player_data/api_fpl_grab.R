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
gw7 = GET("https://fantasy.premierleague.com/api/event/7/live/")
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

# Merge all game weeks into one data frame ####
merged_data <- dplyr::bind_rows(gw1_data,
                   gw2_data,
                   gw3_data,
                   gw4_data,
                   gw5_data,
                   gw6_data,
                   gw7_data,
                   gw8_data,
                   gw9_data,
                   gw10_data,
                   gw11_data,
                   gw12_data,
                   gw13_data,
                   gw14_data,
                   gw15_data,
                   gw16_data,
                   gw17_data,
                   gw18_data)

# Clean data frame ####
merged_gws <- unnest(merged_data, stats)
merged_gws <- merged_gws %>%
  filter(minutes > 0) %>%
  select(-c(explain, in_dreamteam, FPL_Name, id, Understat_ID))
write_csv(merged_gws, "all_player_data/merged_gws.csv")

# Create final table for viewing ####
complete_data <- merged_gws %>%
  group_by(Understat_Name) %>%
  summarise(mins = sum(minutes),
            `90s` = mins / 90,
            Goals = sum(goals_scored),
            Assists = sum(assists),
            Clean_Sheets = sum(clean_sheets),
            Yellow_Cards = sum(yellow_cards),
            Red_Cards = sum(red_cards),
            Bonus_Points = sum(bonus),
            Total_Points = sum(total_points),
            Average_Points = mean(total_points),
            Points_Standard_Deviation = sd(total_points)) %>%
  rename(player_name = Understat_Name)

View(complete_data)