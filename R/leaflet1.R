
# install.packages(c("maps","leaflet","htmlwidgets"))

# Simple map of US states
library(leaflet)
library(maps)
library(htmlwidgets)
mapStates = map("state", fill = TRUE, plot = FALSE)
leaflet(data = mapStates) %>% addTiles() %>%
  addPolygons(fillColor = topo.colors(10, alpha = .5), stroke = FALSE)

# Create a map with location (Karl Ho at UTD EPPS)
# Create object using leaflet setting the view at EPPS geo location)
eppsmap <- leaflet() %>% setView(-96.7478372, 32.9886268, zoom=14)

# Create object to acquire map data from ESRI
esri <- grep("^Esri", providers, value = TRUE)

for (provider in esri) {
  eppsmap <- eppsmap %>% addProviderTiles(provider, group = provider)
}

find_me_at <- paste(sep = "<br/>",
                  "<b><a href='http://karlho.com' target='_blank'>Karl Ho </a></b>",
                  "<b><a href='http://epps.utdallas.edu' target='_blank'>School of Economic, </a></b>",
                  "<b><a href='http://epps.utdallas.edu' target='_blank'>Political and Policy Sciences</a></b>",
                  "<b><a href='http://www.utdallas.edu' target='_blank'>University of Texsa at Dallas</a></b>",
                  "800 West Campbell Road, GR31",
                  "Richardson TX 75080"
)

# Use htmlwidget::onRender function to  add custom behavior to the leaflet map using native JavaScript.

eppsmap %>%
  addLayersControl(baseGroups = names(esri),
                   options = layersControlOptions(collapsed = TRUE)) %>%
  # addMiniMap(tiles = esri[[1]], toggleDisplay = TRUE,
  #           position = "bottomleft") %>%
  addMarkers(eppsmap, lng=-96.7478372, lat=32.9886268, popup=find_me_at)  %>%
  htmlwidgets::onRender("
                        function(el, x) {
                        var myMap = this;
                        myMap.on('baselayerchange',
                        function (e) {
                        myMap.minimap.changeLayer(L.tileLayer.provider(e.name));
                        })
                        }")
