# Simple visualisation of each dataset, one per facet.
tsp <- merged %>% ggplot(aes(x = id, y = val)) + 
  geom_line() + 
  geom_point() + 
  facet_grid(dataset~., scales = "free")

# Show the visualisation
tsp

# Simple visualisation for datasets and methods
resplot <- df_longer %>%
  ggplot(aes(x = param, y = value, colour = method)) + 
  facet_grid(name~dataset) + 
  geom_point() + 
  theme(legend.position = "bottom")

# Plot original data and visualisation graph side-by-side using patchwork '+' operator.
tsp + resplot

do # Simple historgram visualisation of the disribution of each dataset, one per facet.
dis_tsp <- merged %>% 
  ggplot(aes(x = val)) +
  geom_histogram(binwidth=1, fill="white", color="black") + 
  facet_grid(dataset~., scales = "free")

# Simple density visualisation of the disribution of each dataset, one per facet.
dens_tsp <- merged %>% 
  ggplot(aes(x = val)) +
  geom_density() + 
  facet_grid(dataset~., scales = "free")



