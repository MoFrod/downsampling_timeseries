# Expand the ts values into rows
expand_ts <- df %>% separate_rows(full_ts) # %>% select(param, dataset, full_ts) %>%

## Filter expand_ts for df200 by method and param
## ==

# Param 1: Simple Decimation, df200
sd_200_1 <- expand_ts %>% filter(method == "simpleDecimation",
                          dataset == "df200",
                          param == "1") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 1: Simple Decimation, df200 with imputeTS
sd200_1_plot <- ggplot_na_distribution(sd_200_1 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF200, Parameter 1")


# Param 2: Simple Decimation, df200
sd_200_2 <- expand_ts %>% filter(method == "simpleDecimation",
                            dataset == "df200",
                            param == "2") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 2: Simple Decimation, df200 with imputeTS
sd200_2_plot <- ggplot_na_distribution(sd_200_2 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF200, Parameter 2")

# Param 5: Simple Decimation, df200
sd_200_5 <- expand_ts %>% filter(method == "simpleDecimation",
                            dataset == "df200",
                            param == "5") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 5: Simple Decimation, df200 with imputeTS
sd200_5_plot <- ggplot_na_distribution(sd_200_5 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF200, Parameter 5")

# Param 10: Simple Decimation, df200
sd_200_10 <- expand_ts %>% filter(method == "simpleDecimation",
                            dataset == "df200",
                            param == "10") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 10: Simple Decimation, df200 with imputeTS
sd200_10_plot <- ggplot_na_distribution(sd_200_10 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF200, Parameter 10")

# Param 20: Simple Decimation, df200
sd_200_20 <- expand_ts %>% filter(method == "simpleDecimation",
                                  dataset == "df200",
                                  param == "20") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 20: Simple Decimation, df200 with imputeTS
sd200_20_plot <- ggplot_na_distribution(sd_200_20 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF200, Parameter 20")

## ==

# Param 1: Percentage Change, df200
pc_200_1 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df200",
                                 param == "1") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 1: Percentage Change, df200 with imputeTS
pc200_1_plot <- ggplot_na_distribution(pc_200_1 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF200, Parameter 1")


# Param 2: Percentage Change, df200
pc_200_2 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df200",
                                 param == "2") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 2: Percentage Change, df200 with imputeTS
pc200_2_plot <- ggplot_na_distribution(pc_200_2 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF200, Parameter 2")

# Param 5: Percentage Change, df200
pc_200_5 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df200",
                                 param == "5") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 5: Percentage Change, df200 with imputeTS
pc200_5_plot <- ggplot_na_distribution(pc_200_5 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF200, Parameter 5")

# Param 10: Percentage Change, df200
pc_200_10 <- expand_ts %>% filter(method == "percentageChange",
                                  dataset == "df200",
                                  param == "10") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 10: Percentage Change, df200 with imputeTS
pc200_10_plot <- ggplot_na_distribution(pc_200_10 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF200, Parameter 10")

# Param 20: Percentage Change, df200
pc_200_20 <- expand_ts %>% filter(method == "percentageChange",
                                  dataset == "df200",
                                  param == "20") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 20: Percentage Change, df200 with imputeTS
pc200_20_plot <- ggplot_na_distribution(pc_200_20 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF200, Parameter 20")

## Combine all the plots into a neat visualisation
#==

sd200_1_plot + pc200_1_plot + sd200_2_plot + pc200_2_plot + sd200_5_plot + pc200_5_plot + sd200_10_plot + pc200_10_plot + sd200_20_plot + pc200_20_plot + plot_layout(ncol = 2)
