## Create a heatmap of params for simple decimation
#==

# Create new dataframe with numeric values
simple_decimation <- df %>% 
  filter(method == "simpleDecimation") %>% 
  mutate(number_NAs = as.numeric(number_NAs)) %>%
  mutate(number_na_gaps = as.numeric(number_na_gaps))

# Create heatmap for numbers_NAs
ggplot(simple_decimation, 
       aes(dataset, param, fill = number_NAs)) + 
       geom_tile(color = "white", lwd = 1.5, linetype = 1) +
       labs(x = "Annotated Change Dataset", y = "Parameter", fill = "Number of NAs", title = "Number of NAs from Simple Decimation Downsampling by Parameter and Dataset")

# Create heatmap for number_na_gaps
ggplot(simple_decimation, 
       aes(dataset, param, fill = number_na_gaps)) + 
       geom_tile(color = "white", lwd = 1.5, linetype = 1) +
  labs(x = "Annotated Change Dataset", y = "Parameter", fill = "Number of NAs", title = "Number of NAs Gaps from Simple Decimation Downsampling by Parameter and Dataset")


##Create a heatmap of param for percentage change
#==

# Create new dataframe with numeric values
percentage_change <- df %>% 
  filter(method == "percentageChange") %>% 
  mutate(number_NAs = as.numeric(number_NAs)) %>%
  mutate(number_na_gaps = as.numeric(number_na_gaps))

# Create heatmap for numbers_NAs
ggplot(percentage_change, 
       aes(pdataset, param, fill = number_NAs)) + 
  geom_tile(color = "white", lwd = 1.5, linetype = 1) +
  labs(x = "Annotated Change Dataset", y = "Parameter", fill = "Number of NAs", title = "Number of NAs from Percentage Change Downsampling by Parameter and Dataset")

# Create heatmap for number_na_gaps
ggplot(percentage_change, 
       aes(dataset, param, fill = number_na_gaps)) + 
  geom_tile(color = "white", lwd = 1.5, linetype = 1) +
  labs(x = "Annotated Change Dataset", y = "Parameter", fill = "Number of NAs", title = "Number of NAs Gaps from Percentage Change Downsampling by Parameter and Dataset")


