# Expand the ts values into rows
expand_ts <- df %>% separate_rows(full_ts) # %>% select(param, dataset, full_ts) %>%

## Filter expand_ts for df400 by method and param
## ==

# Param 1: Simple Decimation, df400
sd_100_1 <- expand_ts %>% filter(method == "simpleDecimation",
                          dataset == "df400",
                          param == "1") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 1: Simple Decimation, df400 with imputeTS
ggplot_na_distribution(sd_100_1 %>% select(full_ts))


# Param 2: Simple Decimation, df400
sd_100_2 <- expand_ts %>% filter(method == "simpleDecimation",
                            dataset == "df400",
                            param == "2") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 2: Simple Decimation, df400 with imputeTS
ggplot_na_distribution(sd_100_2 %>% select(full_ts))

# Param 5: Simple Decimation, df400
sd_100_5 <- expand_ts %>% filter(method == "simpleDecimation",
                            dataset == "df400",
                            param == "5") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 5: Simple Decimation, df400 with imputeTS
ggplot_na_distribution(sd_100_5 %>% select(full_ts))

# Param 10: Simple Decimation, df400
sd_100_10 <- expand_ts %>% filter(method == "simpleDecimation",
                            dataset == "df400",
                            param == "10") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 10: Simple Decimation, df400 with imputeTS
ggplot_na_distribution(sd_100_10 %>% select(full_ts))

# Param 20: Simple Decimation, df400
sd_100_20 <- expand_ts %>% filter(method == "simpleDecimation",
                                  dataset == "df400",
                                  param == "20") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 20: Simple Decimation, df400 with imputeTS
ggplot_na_distribution(sd_100_20 %>% select(full_ts))

## ==

# Param 1: Percentage Change, df400
pc_100_1 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df400",
                                 param == "1") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 1: Percentage Change, df400 with imputeTS
ggplot_na_distribution(pc_100_1 %>% select(full_ts))


# Param 2: Percentage Change, df400
pc_100_2 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df400",
                                 param == "2") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 2: Percentage Change, df400 with imputeTS
ggplot_na_distribution(pc_100_2 %>% select(full_ts))

# Param 5: Percentage Change, df400
pc_100_5 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df400",
                                 param == "5") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 5: Percentage Change, df400 with imputeTS
ggplot_na_distribution(pc_100_5 %>% select(full_ts))

# Param 10: Percentage Change, df400
pc_100_10 <- expand_ts %>% filter(method == "percentageChange",
                                  dataset == "df400",
                                  param == "10") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 10: Percentage Change, df400 with imputeTS
ggplot_na_distribution(pc_100_10 %>% select(full_ts))

# Param 20: Percentage Change, df400
pc_100_20 <- expand_ts %>% filter(method == "percentageChange",
                                  dataset == "df400",
                                  param == "20") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 20: Percentage Change, df400 with imputeTS
ggplot_na_distribution(pc_100_20 %>% select(full_ts))

## ==

# Param 1: Percentage Change, df400
pc_100_1 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df400",
                                 param == "1") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 1: Percentage Change, df400 with imputeTS
ggplot_na_distribution(pc_100_1 %>% select(full_ts))


# Param 2: Percentage Change, df400
pc_100_2 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df400",
                                 param == "2") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 2: Percentage Change, df400 with imputeTS
ggplot_na_distribution(pc_100_2 %>% select(full_ts))

# Param 5: Percentage Change, df400
pc_100_5 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df400",
                                 param == "5") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 5: Percentage Change, df400 with imputeTS
ggplot_na_distribution(pc_100_5 %>% select(full_ts))

# Param 10: Percentage Change, df400
pc_100_10 <- expand_ts %>% filter(method == "percentageChange",
                                  dataset == "df400",
                                  param == "10") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 10: Percentage Change, df400 with imputeTS
ggplot_na_distribution(pc_100_10 %>% select(full_ts))

# Param 20: Percentage Change, df400
pc_100_20 <- expand_ts %>% filter(method == "percentageChange",
                                  dataset == "df400",
                                  param == "20") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 20: Percentage Change, df400 with imputeTS
ggplot_na_distribution(pc_100_20 %>% select(full_ts))
