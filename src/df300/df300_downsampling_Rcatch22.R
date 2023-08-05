library(Rcatch22)

## Create new dataframes of Rcatch22 features for simpleDecimation df300 params 1, 2, 5, 10 and 20
## ==

# Create new dataframe for Param 1
catch22_sd300_1 <- sd_300_1 %>%
  select('full_ts') %>%
  unlist()

# Create features dataframe for Parm 1
features_sd300_1 <- catch22_all(catch22_sd300_1, catch24 = TRUE)

# Create new dataframe for Param 2
catch22_sd300_2 <- sd_300_2 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 2
features_sd300_2 <- catch22_all(catch22_sd300_2, catch24 = TRUE)

# Create new dataframe for Param 5
catch22_sd300_5 <- sd_300_5 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 5
features_sd300_5 <- catch22_all(catch22_sd300_5, catch24 = TRUE)

# Create new dataframe for Param 10
catch22_sd300_10 <- sd_300_10 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 10
features_sd300_10 <- catch22_all(catch22_sd300_10, catch24 = TRUE)

# Create new dataframe for Param 20
catch22_sd300_20 <- sd_300_20 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 20
features_sd300_20 <- catch22_all(catch22_sd300_20, catch24 = TRUE)

## Create new dataframes of Rcatch22 features for percentageChange df300 params 1, 2, 5, 10 and 20
## ==

# Create new dataframe for Param 1
catch22_pc300_1 <- pc_300_1 %>%
  select('full_ts') %>%
  unlist()

# Create features dataframe for Parm 1
features_pc300_1 <- catch22_all(catch22_pc300_1, catch24 = TRUE)

# Create new dataframe for Param 2
catch22_pc300_2 <- pc_300_2 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 2
features_pc300_2 <- catch22_all(catch22_pc300_2, catch24 = TRUE)

# Create new dataframe for Param 5
catch22_pc300_5 <- pc_300_5 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 5
features_pc300_5 <- catch22_all(catch22_pc300_5, catch24 = TRUE)

# Create new dataframe for Param 10
catch22_pc300_10 <- pc_300_10 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 10
features_pc300_10 <- catch22_all(catch22_pc300_10, catch24 = TRUE)

# Create new dataframe for Param 20
catch22_pc300_20 <- pc_300_20 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 20
features_pc300_20 <- catch22_all(catch22_pc300_20, catch24 = TRUE)
