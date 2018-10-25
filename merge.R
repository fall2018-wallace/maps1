
mergedf <- merge(arrests,states3,by ="stateName")
View(mergedf)
arrests$stateName <- row.names(arrests)

