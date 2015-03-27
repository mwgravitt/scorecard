library("ggplot2")
suppressWarnings(library("reshape"))
library("scales")
library("ggthemes")
sc <- read.csv (file="scorecard_data.csv")
sc$Date <- as.Date(sc$Date, "%m/%d/%Y")
sc$PDate <- as.POSIXct(sc$Date)

# sc <- cbind (sc, Conn_Comp_to_Sold=sc$Connections_Completed / sc$Connections_Sold )
# sc <- cbind (sc, Conn_Comp_to_Plan=sc$Connections_Completed / sc$Connections_Plan )
# 
# conn_data <- subset(data, variable == "Connections Sold" | variable == "Connections Completed" | variable == "Connections Plan")
# 
# # create plot, add lines and points
# g <- ggplot(data=conn_data, aes(x=PDate, y=value, group=variable)) 
# g <- g + geom_line(aes(color=variable, group=variable)) 
# g <- g + geom_point()  
# 
# # configure labels and axis
# g <- g + ggtitle("Connections by Month vs Plan") 
# g <- g + xlab("Month") + ylab("Connections") 
# g <- g + scale_y_continuous() 
# g <- g + scale_x_datetime() 
# 
# # apply theme
# g <- g + theme_fivethirtyeight() + scale_colour_tableau() 
# 
# # blank out the legend title
# g <- g+ theme(legend.title=element_blank()) 
# 
# # add a vertical line on "today"
# g <- g + geom_vline(xintercept = as.numeric(Sys.time()))
# g


# # this graph for cumulative connection sold, completed, and plan
# sc <- subset(sc, Year == 2015)
# 
# sc <- cbind (sc, Cum_Conn_Comp=cumsum(sc$Connections_Completed))
# sc <- cbind (sc, Cum_Conn_Sold=cumsum(sc$Connections_Sold))
# sc <- cbind (sc, Cum_Conn_Plan=cumsum(sc$Connections_Plan))
# 
# data <- melt (sc, id=c("Date", "Year", "Month", "PDate"))
# data$variable <- gsub("_", " ", data$variable)
# 
# conn_data_ytd <- subset(data, variable == "Cum Conn Comp" | variable == "Cum Conn Sold" | variable == "Cum Conn Plan")
# 
# # create plot, add lines and points
# g <- ggplot(data=conn_data_ytd, aes(x=PDate, y=value, group=variable)) 
# g <- g + geom_line(aes(color=variable, group=variable)) 
# g <- g + geom_point()  
# 
# # configure labels and axis
# g <- g + ggtitle("YTD Cumulative Connections Sold, Completed and Planned") 
# g <- g + xlab("Month") + ylab("Connections") 
# g <- g + scale_y_continuous() 
# g <- g + scale_x_datetime() 
# 
# # apply theme
# g <- g + theme_fivethirtyeight() + scale_colour_tableau() 
# 
# # blank out the legend title
# g <- g+ theme(legend.title=element_blank()) 
# 
# # add a vertical line on "today"
# g <- g + geom_vline(xintercept = as.numeric(Sys.time()))
# g


# this graph for cumulative MRR sold, completed, and plan
sc <- subset(sc, Year == 2015)

sc <- cbind (sc, Cum_MRR_Comp=cumsum(sc$MRR_Completed))
sc <- cbind (sc, Cum_MRR_Sold=cumsum(sc$MRR_Sold))
sc <- cbind (sc, Cum_MRR_Plan=cumsum(sc$MRR_Plan))

data <- melt (sc, id=c("Date", "Year", "Month", "PDate"))
data$variable <- gsub("_", " ", data$variable)

mrr_data_ytd <- subset(data, variable == "Cum MRR Comp" | variable == "Cum MRR Sold" | variable == "Cum MRR Plan")

# create plot, add lines and points
g <- ggplot(data=mrr_data_ytd, aes(x=PDate, y=value, group=variable)) 
g <- g + geom_line(aes(color=variable, group=variable)) 
g <- g + geom_point()  

# configure labels and axis
g <- g + ggtitle("YTD Cumulative MRR Sold, Completed and Planned") 
g <- g + xlab("Month") + ylab("MRR") 
g <- g + scale_y_continuous(labels = dollar) 
g <- g + scale_x_datetime() 

# apply theme
g <- g + theme_fivethirtyeight() + scale_colour_tableau() 

# blank out the legend title
g <- g+ theme(legend.title=element_blank()) 

# add a vertical line on "today"
g <- g + geom_vline(xintercept = as.numeric(Sys.time()))
g