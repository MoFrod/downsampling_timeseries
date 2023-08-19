## All datasets as line and point graphs
#==

# Simple visualisation of each dataset, one per facet.
tsp <- merged %>% ggplot(aes(x = id, y = val)) + geom_line(color = "#084594") + geom_point(color = "#084594") + facet_grid(dataset~., scales = "free") + 
  labs(x = "Time Series ID", y = "Time Series Value", title = "Annotated Change Time Series Data")

# Show the visualisation
tsp

# Recode the names of the datasets
#merged$dataset <- recode(merged$dataset,
                              #"100" = "A", 
                              #"200" = "B", 
                              #"300" = "C", 
                              #"400" = "D", 
                              #"500" = "E", 
                              #"600" = "F", 
                              #"700" = "G", 
                              #"800A" = "H", 
                              #"800B" = "I")

# Create matching visualisation
ggplot(merged, 
       aes(x = id, y = val)) + geom_line(linewidth = 1, color = "#084594") + facet_grid(dataset~., scales = "free") +
  labs(x = "Time ID", y = "Time Value", title = "Annotated Change Nine Synthetic Time Series") +
  facet_grid(dataset~., scales = "free") +
  theme_minimal()





