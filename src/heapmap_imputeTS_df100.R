# Create a heatmap of param for simple decimation
simple_decimation <- df %>% 
  filter(method == "simpleDecimation") %>% 
  mutate(number_NAs = as.numeric(number_NAs)) %>%
  mutate(number_na_gaps = as.numeric(number_na_gaps))

ggplot(simple_decimation, 
       aes(simple_decimation$dataset, simple_decimation$param, fill = simple_decimation$number_NAs)) + 
       geom_tile(color = "white", lwd = 1.5, linetype = 1)

ggplot(simple_decimation, 
       aes(simple_decimation$dataset, simple_decimation$param, fill = simple_decimation$number_na_gaps)) + 
  geom_tile(color = "white", lwd = 1.5, linetype = 1)


# Create a heatmap of param for percentage change
percentage_change <- df %>% 
  filter(method == "percentageChange") %>% 
  mutate(number_NAs = as.numeric(number_NAs)) %>%
  mutate(number_na_gaps = as.numeric(number_na_gaps))

ggplot(percentage_change, 
       aes(percentage_change$dataset, percentage_change$param, fill = percentage_change$number_NAs)) + 
  geom_tile(color = "white", lwd = 1.5, linetype = 1)

ggplot(percentage_change, 
       aes(percentage_change$dataset, percentage_change$param, fill = percentage_change$number_na_gaps)) + 
  geom_tile(color = "white", lwd = 1.5, linetype = 1)

# Try out ggpairs
ggpairs(simple_decimation,
        cardinality_threshold = 25, # Data frame
        columns = 1:5,        # Columns
        aes(color = dataset,  # Color by group (cat. variable)
            alpha = 0.5))     # Transparency
