# Jettison Code MVP: downsampling parameters experiment

# Create data frame to store results.
df <- tibble(
  param = numeric(),
  method = character(),
  dataset = character(),
  vol = character(),
  number_NAs = character(),
  number_na_gaps = character(),
  full_ts = character(),
  indexes_of_values_kept = character()
)


# List of datasets to use in testing
list_of_dataset <- c("df100","df200","df300","df400","df500","df600","df700","df800a","df800b")

# Specify methods to use in experiment
list_of_methods <- c("simpleDecimation","percentageChange")

# Iterate across all datasets.
for (dataset in list_of_dataset)
{
  # Load dataset
  datats <- get(dataset)
  
  # Iterate across all methods
  for (method in list_of_methods)
  {
    for(i in 1:50)
    {
      if (method == "simpleDecimation") {
        a <- funSimpleDecimation(datats, i)
      } else if (method == "percentageChange") {
        a <- funPercentageChange(datats, i)
      }
      
      # Rejoin the original and downsampled datasets
      gaps <- left_join(datats, a, by = "id")
      
      # Obtain measures from imputeTS
      res <- statsNA(gaps$val.y, print_only = FALSE)
      
      df <- df %>% add_row(param = i,
                           #v = a,
                           method = method,
                           dataset = as.character(dataset),
                           vol = as.character(nrow(a)),
                           number_NAs = as.character(res$number_NAs[1]),
                           number_na_gaps = as.character(res$number_na_gaps[1]),
                           full_ts = as.character(paste(gaps$val.y, collapse = ",")),
                           indexes_of_values_kept = as.character(paste(a$id, collapse = ",")))
      
    }
  }
}

# Pivot the results dataset into a 'longer' form with a row for each metric type, to make it easier to facet on different values.
metrics_of_interest <- c("vol","number_NAs","number_na_gaps")

# Update to use metrics_of_interest in pivot.
df_longer <- df %>%
  pivot_longer(cols = c("vol","number_NAs","number_na_gaps")) %>%
  mutate(value = as.numeric(value))

