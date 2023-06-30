# See what types of data we have in the dataframe
str(df)

# Create a new dataframe with mutations
imputeTS_df <- df %>%
  select(param, method, vol, number_NAs, number_na_gaps) %>%
  mutate(param = as.numeric(param), vol = as.numeric(vol), 
         number_NAs = as.numeric(number_NAs), number_na_gaps = as.numeric(number_na_gaps),
         method = ifelse(method == "simpleDecimation", 0, 1))

# Create a basic pairs plot to understand any potential relationships
pairs(imputeTS_df)
