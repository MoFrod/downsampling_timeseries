# Expand the ts values into rows
expand_ts <- df %>% separate_rows(full_ts) # %>% select(param, dataset, full_ts) %>%

## Filter expand_ts for df300 by method and param
## ==

# Param 1: Simple Decimation, df300
sd_300_1 <- expand_ts %>% filter(method == "simpleDecimation",
                          dataset == "df300",
                          param == "1") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 1: Simple Decimation, df300 with imputeTS
sd300_1_plot <- ggplot_na_distribution(sd_300_1 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF300, Parameter 1")


# Param 2: Simple Decimation, df300
sd_300_2 <- expand_ts %>% filter(method == "simpleDecimation",
                            dataset == "df300",
                            param == "2") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 2: Simple Decimation, df300 with imputeTS
sd300_2_plot <- ggplot_na_distribution(sd_300_2 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF300, Parameter 2")

# Param 5: Simple Decimation, df300
sd_300_5 <- expand_ts %>% filter(method == "simpleDecimation",
                            dataset == "df300",
                            param == "5") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 5: Simple Decimation, df300 with imputeTS
sd300_5_plot <- ggplot_na_distribution(sd_300_5 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF300, Parameter 5")

# Param 10: Simple Decimation, df300
sd_300_10 <- expand_ts %>% filter(method == "simpleDecimation",
                            dataset == "df300",
                            param == "10") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 10: Simple Decimation, df300 with imputeTS
sd300_10_plot <- ggplot_na_distribution(sd_300_10 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF300, Parameter 10")

# Param 20: Simple Decimation, df300
sd_300_20 <- expand_ts %>% filter(method == "simpleDecimation",
                                  dataset == "df300",
                                  param == "20") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 20: Simple Decimation, df300 with imputeTS
sd300_20_plot <- ggplot_na_distribution(sd_300_20 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF300, Parameter 20")

## ==

# Param 1: Percentage Change, df300
pc_300_1 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df300",
                                 param == "1") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 1: Percentage Change, df300 with imputeTS
pc300_1_plot <- ggplot_na_distribution(pc_300_1 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF300, Parameter 1")


# Param 2: Percentage Change, df300
pc_300_2 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df300",
                                 param == "2") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 2: Percentage Change, df300 with imputeTS
pc300_2_plot <- ggplot_na_distribution(pc_300_2 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF300, Parameter 2")

# Param 5: Percentage Change, df300
pc_300_5 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df300",
                                 param == "5") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 5: Percentage Change, df300 with imputeTS
pc300_5_plot <- ggplot_na_distribution(pc_300_5 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF300, Parameter 5")

# Param 10: Percentage Change, df300
pc_300_10 <- expand_ts %>% filter(method == "percentageChange",
                                  dataset == "df300",
                                  param == "10") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 10: Percentage Change, df300 with imputeTS
pc300_10_plot <- ggplot_na_distribution(pc_300_10 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF300, Parameter 10")

# Param 20: Percentage Change, df300
pc_300_20 <- expand_ts %>% filter(method == "percentageChange",
                                  dataset == "df300",
                                  param == "20") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 20: Percentage Change, df300 with imputeTS
pc300_20_plot <- ggplot_na_distribution(pc_300_20 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF300, Parameter 20")

## Combine all the plots into a neat visualisation
#==

sd300_1_plot + pc300_1_plot + sd300_2_plot + pc300_2_plot + sd300_5_plot + pc300_5_plot + sd300_10_plot + pc300_10_plot + sd300_20_plot + pc300_20_plot + plot_layout(ncol = 2)
