library(Rcatch22)

## Create new dataframes of Rcatch22 features for simpleDecimation df200 params 1, 2, 5, 10 and 20
## ==

# Create new dataframe for Param 1
catch22_sd200_1 <- sd_200_1 %>%
  select('full_ts') %>%
  unlist()

# Create features dataframe for Parm 1
features_sd200_1 <- catch22_all(catch22_sd200_1, catch24 = TRUE)

# Create new dataframe for Param 2
catch22_sd200_2 <- sd_200_2 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 2
features_sd200_2 <- catch22_all(catch22_sd200_2, catch24 = TRUE)

# Create new dataframe for Param 5
catch22_sd200_5 <- sd_200_5 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 5
features_sd200_5 <- catch22_all(catch22_sd200_5, catch24 = TRUE)

# Create new dataframe for Param 10
catch22_sd200_10 <- sd_200_10 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 10
features_sd200_10 <- catch22_all(catch22_sd200_10, catch24 = TRUE)

# Create new dataframe for Param 20
catch22_sd200_20 <- sd_200_20 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 20
features_sd200_20 <- catch22_all(catch22_sd200_20, catch24 = TRUE)

## Create new dataframes of Rcatch22 features for percentageChange df200 params 1, 2, 5, 10 and 20
## ==

# Create new dataframe for Param 1
catch22_pc200_1 <- pc_200_1 %>%
  select('full_ts') %>%
  unlist()

# Create features dataframe for Parm 1
features_pc200_1 <- catch22_all(catch22_pc200_1, catch24 = TRUE)

# Create new dataframe for Param 2
catch22_pc200_2 <- pc_200_2 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 2
features_pc200_2 <- catch22_all(catch22_pc200_2, catch24 = TRUE)

# Create new dataframe for Param 5
catch22_pc200_5 <- pc_200_5 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 5
features_pc200_5 <- catch22_all(catch22_pc200_5, catch24 = TRUE)

# Create new dataframe for Param 10
catch22_pc200_10 <- pc_200_10 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 10
features_pc200_10 <- catch22_all(catch22_pc200_10, catch24 = TRUE)

# Create new dataframe for Param 20
catch22_pc200_20 <- pc_200_20 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 20
features_pc200_20 <- catch22_all(catch22_pc200_20, catch24 = TRUE)
