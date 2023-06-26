blah <- df %>% separate_rows(full_ts) # %>% select(param, dataset, full_ts) %>%



closer <- blah %>% filter(method == "simpleDecimation",
                          dataset == "df100",
                          param == "12") %>% 
  mutate(full_ts = as.numeric(full_ts))



ggplot_na_distribution(closer %>% select(full_ts))


df_copy <- df
merged_copy <- merged

df_copy$raw_values <- lapply(strsplit(df_copy$indexes_of_values_kept, ","), function(ids) merged_copy$val[as.integer(ids)])

df_copy$raw_values <- sapply(df_copy$raw_values, function(x) paste(x, collapse = ","))

list_of_datasets <- split(df_copy, df$dataset)

df_1 <- list_of_dataset[[1]]


# Assuming df is your data frame
df1_expanded <- df_1 %>%
  # Split the comma-separated strings into list of separate values
  mutate(indexes_of_values_kept = strsplit(indexes_of_values_kept, split = ","),
         raw_values = strsplit(raw_values, split = ",")) %>%
  # Unnest the lists to make each value into its own row
  unnest(indexes_of_values_kept, raw_values) %>%
  # Convert the character values to numeric (if they are numeric values)
  mutate(indexes_of_values_kept = as.numeric(indexes_of_values_kept),
         raw_values = as.numeric(raw_values))






df_2 <- list_of_datasets[[2]]


# Assuming df is your data frame
df2_expanded <- df_2 %>%
  # Split the comma-separated strings into list of separate values
  mutate(indexes_of_values_kept = strsplit(indexes_of_values_kept, split = ","),
         raw_values = strsplit(raw_values, split = ",")) %>%
  # Unnest the lists to make each value into its own row
  unnest(indexes_of_values_kept, raw_values) %>%
  # Convert the character values to numeric (if they are numeric values)
  mutate(indexes_of_values_kept = as.numeric(indexes_of_values_kept),
         raw_values = as.numeric(raw_values))

df2_expanded <- pivot_longer(
  cols = 
)


