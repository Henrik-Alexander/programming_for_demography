library(leaflet)

# Set the coordinates
y <- 54.09452
x <- 12.11044
m |> 
  setView(x, y, zoom = 15) |> 
  addPopups(x, y, 'Hier liegt das <b>MPIDR</b>')

