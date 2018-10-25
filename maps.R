

# Step A: Load and Merge datasets
#1)	Read in the census dataset and the USArrests and merge them 

myfunction <- function(){                                       #function to read census dataset
  dfStates <- read.csv("states.csv", header = TRUE)
  uncoloumns <- c("SUMLEV","REGION","DIVISION","STATE")        #dropping the specified coloumns 
  unrows <- row.names(dfStates)[c(1,nrow(dfStates))] 
  cleandf <- dfStates[-which(rownames(dfStates) %in% unrows),-which(colnames(dfStates) %in% uncoloumns), drop = FALSE]
  colnames(cleandf) <- c("stateName","population","popOver18","percentOver18") 
  return(cleandf)
}

states3 <- myfunction()
myfunction()

arrests <- data.frame(USArrests)
View(arrests)

arrests$stateName <- row.names(arrests)
mergedf <- merge(arrests,states3,by ="stateName")
View(mergedf)

#2)Add the area of each state, and the center of each state, to the merged dataframe, using the 'state.center', 'state.center' and 'state.name' vectors

stateArea <- state.area
centerofState <- state.center
stateName <- state.name
newdf <- data.frame(stateName,stateArea,centerofState)
View(newdf)
mergeDf <- merge(mergedf,newdf,by="stateName")
View(mergeDf)
mergeDf$stateName <- tolower(mergeDf$stateName) 
View(mergeDf)

#Step B: Generate a color coded map
#3)	Create a color coded map, based on the area of the  states 
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

#5)	 Show the population as a circle per state (the larger the population, the larger the circle), using the location defined by the center of each state

Colormap <- Colormap + geom_point(data = mergedf, aes(x=mergedf$x, y= mergedf$y, size = mergedf$population, color=mergedf$UrbanPop))
Colormap

#Step D: Zoom the map
#6)	Repeat step C, but only show the states in the north east
#Hint: get the lat and lon of new york city
#Hint: set the xlim and ylim to NYC +/- 10

#playing with a SU latlon
latlon <- geocode(source="dsk", "nyc,new york city, NY")
latlon <- geocode(source ="dsk", "Syracuse Univeristy , syracuse ")
latlon
Colormap <- Colormap + xlim(latlon$lon-10,latlon$lon+10) + ylim(latlon$lat-10, latlon$lat+10)
Colormap <- Colormap + coord_map() 
#mapColor <- mapColor + expand_limits(x =us$long, y = us$lat) 
Colormap
