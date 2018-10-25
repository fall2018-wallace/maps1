
murder.bar <- ggplot(mergedf,aes(x=stateName,y=numMurders))#setting the required aesthetics 
murder.bar <- murder.bar + geom_col() # defining the geometry of the plot ie. Bar chart~geom_col() method
murder.bar <- murder.bar +ggtitle("Total Murders") #adding a title
murder.bar

murder.bar1 <- ggplot(mergedf,aes(x=stateName,y=numMurders))#setting the required aesthetics 
murder.bar1 <- murder.bar1 + geom_col() # defining the geometry of the plot ie. Bar chart~geom_col() method
murder.bar1 <- murder.bar1+ theme(axis.text.x =
                                    element_text(angle = 90, hjust = 1))#adjusting the state name text on the X-Axis
murder.bar1 <- murder.bar1 +ggtitle("Total Murders") #adding a title
murder.bar1



murder.bar2 <- ggplot(mergedf,aes(x=reorder(stateName,numMurders),y=numMurders)) # sorting the X-axis stateNames according to the Murder rate
murder.bar2 <- murder.bar2 + geom_col() # defining the geometry of the plot ie. Bar chart~geom_col() method
murder.bar2 <- murder.bar2+ theme(axis.text.x =
                                    element_text(angle = 90, hjust = 1)) #adjusting the state name text on the X-Axis
murder.bar2 <- murder.bar2 +ggtitle("Total Murders-Sorted")#adding a title
murder.bar2


murder.bar3 <- ggplot(mergedf,aes(x=reorder(stateName,numMurders),y=numMurders,fill=percentOver18))#setting the aesthetics and using fill with values of perecentOver18 which becomes the color reference for the bar.
murder.bar3 <- murder.bar3 + geom_col() # defining the geometry of the plot ie. Bar chart~geom_col() method
murder.bar3 <- murder.bar3+ theme(axis.text.x =
                                    element_text(angle = 90, hjust = 1))#adjusting the state name text on the X-Axi
murder.bar3 <- murder.bar3 +ggtitle("Total Murder-filled with percentOver18")
murder.bar3
