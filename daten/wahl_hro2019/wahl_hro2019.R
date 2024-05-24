## Purpose: Load the election data from rostock open data portal

# Load the packages
library(tidyverse)
library(sf)

# Load the rostock map
hro_map <- sf::read_sf("daten/wahl_hro2019/buergerschaftswahl_2019_wahlbezirke.shp")

# Path to the data
csv_path <- "https://geo.sv.rostock.de/download/opendata/buergerschaftswahl_2019/buergerschaftswahl_2019_ergebnisse.csv"


# Load the data
wahl19 <- read.csv(csv_path)

# Pivot longer from zweistimmenanteile
wahl19 <- wahl19 |>
  pivot_longer(cols = starts_with("zweitstimmenanteile"), names_prefix = "zweitstimmenanteile_", values_to = "zweitstimmenanteil", names_to =  "partei")  

ggplot(data = wahl19, aes(x = stadtbereich_bezeichnung, y = zweitstimmenanteil, fill = partei)) +
  geom_col() +
  scale_x_discrete("Bezirk", expand = c(0, 0)) +
  scale_y_continuous("% Zweitstimme", expand = c(0, 0), n.breaks = 10) +
  coord_flip() +
  theme_bw(base_size = 12, base_family = "serif")

# Display only the AFTshare
ggplot(data = subset(wahl19, partei == "afd"), aes(x = fct_reorder(stadtbereich_bezeichnung, zweitstimmenanteil), y = zweitstimmenanteil)) +
  geom_col(fill = "navyblue") +
  geom_text(aes(label = zweitstimmenanteil, y = 2), colour = "white") +
  scale_x_discrete("Bezirk", expand = c(0, 0)) +
  scale_y_continuous("% Zweitstimme", expand = c(0, 0), n.breaks = 10) +
  coord_flip() +
  theme_bw(base_size = 12, base_family = "serif")


# Display only hhe
ggplot(data = subset(wahl19, partei == "afd"), aes(x = wahlbeteiligung, y = zweitstimmenanteil)) +
  geom_point(fill = "navyblue") +
  geom_text(aes(label = stadtbereich_bezeichnung)) +
  geom_smooth(se = F, method = "lm") +
  scale_x_continuous("Wahlbeteiligung", n.breaks = 10) +
  scale_y_continuous("% Zweitstimme", n.breaks = 10) +
  theme_bw(base_size = 12, base_family = "serif")

# Plot the winner in each election district
district_winner <- wahl19 |> 
  group_by(stadtbereich_bezeichnung) |> 
  mutate(winner_share = max(zweitstimmenanteil)) |> 
  filter(zweitstimmenanteil == winner_share)
left_join(hro_map, district_winner)

  
### END ###############################################