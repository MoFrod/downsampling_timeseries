# Expand the ts values into rows
expand_ts <- df %>% separate_rows(full_ts) # %>% select(param, dataset, full_ts) %>%

## Filter expand_ts for df800a by method and param
## ==

# Param 1: Simple Decimation, df800a
sd_800a_1 <- expand_ts %>% filter(method == "simpleDecimation",
                          dataset == "df800a",
                          param == "1") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 1: Simple Decimation, df800a with imputeTS
sd800a_1_plot <- ggplot_na_distribution(sd_800a_1 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF800a, Parameter 1")


# Param 2: Simple Decimation, df800a
sd_800a_2 <- expand_ts %>% filter(method == "simpleDecimation",
                            dataset == "df800a",
                            param == "2") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 2: Simple Decimation, df800a with imputeTS
sd800a_2_plot <- ggplot_na_distribution(sd_800a_2 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF800a, Parameter 2")

# Param 5: Simple Decimation, df800a
sd_800a_5 <- expand_ts %>% filter(method == "simpleDecimation",
                            dataset == "df800a",
                            param == "5") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 5: Simple Decimation, df800a with imputeTS
sd800a_5_plot <- ggplot_na_distribution(sd_800a_5 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF800a, Parameter 5")

# Param 10: Simple Decimation, df800a
sd_800a_10 <- expand_ts %>% filter(method == "simpleDecimation",
                            dataset == "df800a",
                            param == "10") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 10: Simple Decimation, df800a with imputeTS
sd800a_10_plot <- ggplot_na_distribution(sd_800a_10 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF800a, Parameter 10")

# Param 20: Simple Decimation, df800a
sd_800a_20 <- expand_ts %>% filter(method == "simpleDecimation",
                                  dataset == "df800a",
                                  param == "20") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 20: Simple Decimation, df800a with imputeTS
sd800a_20_plot <- ggplot_na_distribution(sd_800a_20 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF800a, Parameter 20")

## ==

# Param 1: Percentage Change, df800a
pc_800a_1 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df800a",
                                 param == "1") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 1: Percentage Change, df800a with imputeTS
pc800a_1_plot <- ggplot_na_distribution(pc_800a_1 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF800a, Parameter 1")


# Param 2: Percentage Change, df800a
pc_800a_2 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df800a",
                                 param == "2") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 2: Percentage Change, df800a with imputeTS
pc800a_2_plot <- ggplot_na_distribution(pc_800a_2 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF800a, Parameter 2")

# Param 5: Percentage Change, df800a
pc_800a_5 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df800a",
                                 param == "5") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 5: Percentage Change, df800a with imputeTS
pc800a_5_plot <- ggplot_na_distribution(pc_800a_5 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF800a, Parameter 5")

# Param 10: Percentage Change, df800a
pc_800a_10 <- expand_ts %>% filter(method == "percentageChange",
                                  dataset == "df800a",
                                  param == "10") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 10: Percentage Change, df800a with imputeTS
pc800a_10_plot <- ggplot_na_distribution(pc_800a_10 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF800a, Parameter 10")

# Param 20: Percentage Change, df800a
pc_800a_20 <- expand_ts %>% filter(method == "percentageChange",
                                  dataset == "df800a",
                                  param == "20") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 20: Percentage Change, df800a with imputeTS
pc800a_20_plot <- ggplot_na_distribution(pc_800a_20 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF800a, Parameter 20")

## Combine all the plots into a neat visualisation
#==

sd800a_1_plot + pc800a_1_plot + sd800a_2_plot + pc800a_2_plot + sd800a_5_plot + pc800a_5_plot + sd800a_10_plot + pc800a_10_plot + sd800a_20_plot + pc800a_20_plot + plot_layout(ncol = 2)
