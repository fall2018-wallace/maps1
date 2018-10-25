
codemap <- map_data("state")
View(codemap)

Colormap <- ggplot(mergedf, aes(map_id = stateName))  
Colormap <- Colormap + geom_map(map = codemap, aes(fill=mergedf$stateArea, color="white"))  
Colormap <- Colormap + expand_limits(x =codemap$long, y = codemap$lat) 
Colormap <- Colormap + coord_map() + ggtitle("Area of State")
Colormap

# Step C: Create a color shaded map of the U.S. based on the Murder rate for each state 
# 4)	Repeat step B, but color code the map based on the murder rate of each state.
Colormap <- ggplot(mergedf, aes(map_id = stateName))  
Colormap <- Colormap + geom_map(map = codemap, aes(fill=mergedf$Murder))  
Colormap <- Colormap + expand_limits(x =codemap$long, y = codemap$lat) 
Colormap <- Colormap + coord_map() + ggtitle("Murder Rate of State")
Colormap
