library(Rcatch22)

## Create new dataframes of Rcatch22 features for simpleDecimation df500 params 1, 2, 5, 10 and 20
## ==

# Create new dataframe for Param 1
catch22_sd500_1 <- sd_500_1 %>%
  select('full_ts') %>%
  unlist()

# Create features dataframe for Parm 1
features_sd500_1 <- catch22_all(catch22_sd500_1, catch24 = TRUE)

# Create new dataframe for Param 2
catch22_sd500_2 <- sd_500_2 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 2
features_sd500_2 <- catch22_all(catch22_sd500_2, catch24 = TRUE)

# Create new dataframe for Param 5
catch22_sd500_5 <- sd_500_5 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 5
features_sd500_5 <- catch22_all(catch22_sd500_5, catch24 = TRUE)

# Create new dataframe for Param 10
catch22_sd500_10 <- sd_500_10 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 10
features_sd500_10 <- catch22_all(catch22_sd500_10, catch24 = TRUE)

# Create new dataframe for Param 20
catch22_sd500_20 <- sd_500_20 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 20
features_sd500_20 <- catch22_all(catch22_sd500_20, catch24 = TRUE)

## Create new dataframes of Rcatch22 features for percentageChange df500 params 1, 2, 5, 10 and 20
## ==

# Create new dataframe for Param 1
catch22_pc500_1 <- pc_500_1 %>%
  select('full_ts') %>%
  unlist()

# Create features dataframe for Parm 1
features_pc500_1 <- catch22_all(catch22_pc500_1, catch24 = TRUE)

# Create new dataframe for Param 2
catch22_pc500_2 <- pc_500_2 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 2
features_pc500_2 <- catch22_all(catch22_pc500_2, catch24 = TRUE)

# Create new dataframe for Param 5
catch22_pc500_5 <- pc_500_5 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 5
features_pc500_5 <- catch22_all(catch22_pc500_5, catch24 = TRUE)

# Create new dataframe for Param 10
catch22_pc500_10 <- pc_500_10 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 10
features_pc500_10 <- catch22_all(catch22_pc500_10, catch24 = TRUE)

# Create new dataframe for Param 20
catch22_pc500_20 <- pc_500_20 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 20
features_pc500_20 <- catch22_all(catch22_pc500_20, catch24 = TRUE)
