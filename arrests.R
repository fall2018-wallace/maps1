
arrests <- data.frame(USArrests)
View(arrests)

#3) Create a merged dataframe -- with the attributes from both dataframes
arrests$stateName <- row.names(arrests) #adding the name of the column 
mergedf <- merge(arrests,states3,by="stateName")
View(mergedf)


