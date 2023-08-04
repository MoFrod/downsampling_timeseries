# Expand the ts values into rows
expand_ts <- df %>% separate_rows(full_ts) # %>% select(vol, dataset, full_ts) %>%

## Filter expand_ts for df100 by method and vol
## ==

# vol 100: Simple Decimation, df100
sd_100_100 <- expand_ts %>% filter(method == "simpleDecimation",
                                 dataset == "df100",
                                 vol == "100") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise vol 100: Simple Decimation, df100 with imputeTS
sd100_100_plot <- ggplot_na_distribution(sd_100_100 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF100, vol 100")


# vol 50: Simple Decimation, df100
sd_100_50 <- expand_ts %>% filter(method == "simpleDecimation",
                                 dataset == "df100",
                                 vol == "50") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise vol 50: Simple Decimation, df100 with imputeTS
sd100_50_plot <- ggplot_na_distribution(sd_100_50 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF100, vol 50")

# vol 34: Simple Decimation, df100
sd_100_34 <- expand_ts %>% filter(method == "simpleDecimation",
                                 dataset == "df100",
                                 vol == "34") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise vol 34: Simple Decimation, df100 with imputeTS
sd100_34_plot <- ggplot_na_distribution(sd_100_34 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF100, vol 34")

# vol 25: Simple Decimation, df100
sd_100_25 <- expand_ts %>% filter(method == "simpleDecimation",
                                  dataset == "df100",
                                  vol == "25") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise vol 25: Simple Decimation, df100 with imputeTS
sd100_25_plot <- ggplot_na_distribution(sd_100_25 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF100, vol 25")

# vol 20: Simple Decimation, df100
sd_100_20 <- expand_ts %>% filter(method == "simpleDecimation",
                                  dataset == "df100",
                                  vol == "20") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise vol 20: Simple Decimation, df100 with imputeTS
sd100_20_plot <- ggplot_na_distribution(sd_100_20 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF100, vol 20")

## ==

# vol 97: Percentage Change, df100
pc_100_97 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df100",
                                 vol == "97") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise vol 97: Percentage Change, df100 with imputeTS
pc100_97_plot <- ggplot_na_distribution(pc_100_97 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF100, vol 97")


# vol 51: Percentage Change, df100
pc_100_51 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df100",
                                 vol == "51") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise vol 51: Percentage Change, df100 with imputeTS
pc100_51_plot <- ggplot_na_distribution(pc_100_51 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF100, vol 51")

# vol 43: Percentage Change, df100
pc_100_43 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df100",
                                 vol == "43") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise vol 43: Percentage Change, df100 with imputeTS
pc100_34_plot <- ggplot_na_distribution(pc_100_34 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF100, vol 43")





