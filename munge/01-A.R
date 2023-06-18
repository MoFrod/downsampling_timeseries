# Create data frames from JSON files of Turing Change Point Dataset (TCPD).
                        
# Bee data
bee_df <- fromJSON(file='D:/Morgan/Documents/NCL MSc/final_project/mofrod_project/data/bee_waggle_6.json')
bee_df <- as.data.frame(ozone_df)

# Bitcoin data
bitcoin_df <- fromJSON(file='D:/Morgan/Documents/NCL MSc/final_project/mofrod_project/data/bitcoin.json')
bitcoin_df <- as.data.frame(bitcoin_df)

# Children per women data
children_per_woman_df <- fromJSON(file='D:/Morgan/Documents/NCL MSc/final_project/mofrod_project/data/children_per_woman.json')
children_per_woman_df <- as.data.frame(children_per_woman_df)

# Measles data
measles_df <- fromJSON(file='D:/Morgan/Documents/NCL MSc/final_project/mofrod_project/data/measles.json')
measles_df <- as.data.frame(measles_df)

# Ozone data
ozone_df <- fromJSON(file='D:/Morgan/Documents/NCL MSc/final_project/mofrod_project/data/ozone.json')
ozone_df <- as.data.frame(ozone_df)

# Rail data
rail_lines_df <- fromJSON(file='D:/Morgan/Documents/NCL MSc/final_project/mofrod_project/data/rail_lines.json')
rail_lines_df <- as.data.frame(rail_lines_df)
