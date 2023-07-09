library(dplyr)

## Simple Decimation df100
#==

# Renaming 'values' column in each dataframe
names(features_sd100_1)[names(features_sd100_1) == "values"] <- "1"
names(features_sd100_2)[names(features_sd100_2) == "values"] <- "2"
names(features_sd100_5)[names(features_sd100_5) == "values"] <- "5"
names(features_sd100_10)[names(features_sd100_10) == "values"] <- "10"
names(features_sd100_20)[names(features_sd100_20) == "values"] <- "20"

# Joining all datasets by 'names' column
features_sd100 <- full_join(features_sd100_1, features_sd100_2, by = "names") %>%
  full_join(features_sd100_5, by = "names") %>%
  full_join(features_sd100_10, by = "names") %>%
  full_join(features_sd100_20, by = "names")

# normalize columns 1, 2, 5, 10, 20
cols_to_normalize <- c('1', '2', '5', '10', '20')
features_sd100[cols_to_normalize] <- scale(features_sd100[cols_to_normalize])

# Pivoting the data to long format
features_sd100_long <- features_sd100 %>%
  pivot_longer(cols = (2:6), names_to = "parameters", values_to = "value")

# Point plot
Rcatch22_plot_sd100 <- ggplot(features_sd100_long, aes(y = names, x = value, color = as.numeric(parameters))) + 
  geom_point() + 
  theme_minimal() + 
  labs(y = "Names", x = "Values", color = "Param") + 
  ggtitle("Comparative Visualization of Simple Decimation for DF100") +
  theme(axis.title.y = element_blank(), axis.title.x = element_blank())

## Percentage Change df100
#==

# Renaming 'values' column in each dataframe
names(features_pc100_1)[names(features_pc100_1) == "values"] <- "1"
names(features_pc100_2)[names(features_pc100_2) == "values"] <- "2"
names(features_pc100_5)[names(features_pc100_5) == "values"] <- "5"
names(features_pc100_10)[names(features_pc100_10) == "values"] <- "10"
names(features_pc100_20)[names(features_pc100_20) == "values"] <- "20"

# Joining all datasets by 'names' column
features_pc100 <- full_join(features_pc100_1, features_pc100_2, by = "names") %>%
  full_join(features_pc100_5, by = "names") %>%
  full_join(features_pc100_10, by = "names") %>%
  full_join(features_pc100_20, by = "names")

# normalize columns 1, 2, 5, 10, 20
cols_to_normalize <- c('1', '2', '5', '10', '20')
features_pc100[cols_to_normalize] <- scale(features_sd100[cols_to_normalize])

# Pivoting the data to long format
features_pc100_long <- features_pc100 %>%
  pivot_longer(cols = (2:6), names_to = "parameters", values_to = "value")

# Point plot
Rcatch22_plot_pc100 <- ggplot(features_pc100_long, aes(y = names, x = value, color = as.numeric(parameters))) + 
  geom_point() + 
  theme_minimal() + 
  labs(y = "Names", x = "Values", color = "Param") + 
  ggtitle("Comparative Visualization of Percentage Change for DF100") +
  theme(axis.title.y = element_blank(), axis.title.x = element_blank())

## Combine plots
#==


grid.arrange(patchworkGrob(Rcatch22_plot_sd100 + Rcatch22_plot_pc100), left = "Names", bottom = "Values")

