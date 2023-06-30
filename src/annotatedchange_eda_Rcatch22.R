library(Rcatch22)

## Create new dataframes of Rcatch22 features for simpleDecimation df100 params 1, 2, 5, 10 and 20
## ==

# Create new dataframe for Param 1
catch22_sd100_1 <- sd_100_1 %>%
  select('full_ts') %>%
  unlist()

# Create features dataframe for Parm 1
features_sd100_1 <- catch22_all(catch22_sd100_1, catch24 = TRUE)

# Create new dataframe for Param 2
catch22_sd100_2 <- sd_100_2 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 2
features_sd100_2 <- catch22_all(catch22_sd100_2, catch24 = TRUE)

# Create new dataframe for Param 5
catch22_sd100_5 <- sd_100_5 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 5
features_sd100_5 <- catch22_all(catch22_sd100_5, catch24 = TRUE)

# Create new dataframe for Param 10
catch22_sd100_10 <- sd_100_10 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 10
features_sd100_10 <- catch22_all(catch22_sd100_10, catch24 = TRUE)

# Create new dataframe for Param 20
catch22_sd100_20 <- sd_100_20 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 20
features_sd100_20 <- catch22_all(catch22_sd100_20, catch24 = TRUE)

## Create new dataframes of Rcatch22 features for percentageChange df100 params 1, 2, 5, 10 and 20
## ==

# Create new dataframe for Param 1
catch22_pc100_1 <- pc_100_1 %>%
  select('full_ts') %>%
  unlist()

# Create features dataframe for Parm 1
features_pc100_1 <- catch22_all(catch22_pc100_1, catch24 = TRUE)

# Create new dataframe for Param 2
catch22_pc100_2 <- pc_100_2 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 2
features_pc100_2 <- catch22_all(catch22_pc100_2, catch24 = TRUE)

# Create new dataframe for Param 5
catch22_pc100_5 <- pc_100_5 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 5
features_pc100_5 <- catch22_all(catch22_pc100_5, catch24 = TRUE)

# Create new dataframe for Param 10
catch22_pc100_10 <- pc_100_10 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 10
features_pc100_10 <- catch22_all(catch22_pc100_10, catch24 = TRUE)

# Create new dataframe for Param 20
catch22_pc100_20 <- pc_100_20 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 20
features_pc100_20 <- catch22_all(catch22_pc100_20, catch24 = TRUE)
