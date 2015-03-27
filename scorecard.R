
library("ggplot2")
suppressWarnings(library("reshape"))
library("scales")
library("ggthemes")
sc <- read.csv (file="scorecard_data.csv")
sc$Date <- as.Date(sc$Date, "%m/%d/%Y")
sc$PDate <- as.POSIXct(sc$Date)

sc <- cbind (sc, Conn_Comp_to_Sold=sc$Connections_Completed / sc$Connections_Sold )
sc <- cbind (sc, Conn_Comp_to_Plan=sc$Connections_Completed / sc$Connections_Plan )
#sc <- 

data <- melt (sc, id=c("Date", "Year", "Month", "PDate"))
data$variable <- gsub("_", " ", data$variable)

#budget_data <- subset(data, variable == "Expense Budget Original" | variable == "Expense Actual" | variable == "Expense Budget Latest")

#ggplot(data=budget_data, aes(x=PDate, y=value, group=variable)) + geom_line(aes(color=variable, group=variable)) + geom_point()  + xlab("Month") + ylab("Implementation Expenses") + ggtitle("Expense Budget vs Actual by Month") + scale_y_continuous(labels = dollar) + theme_fivethirtyeight() + scale_colour_tableau() + scale_x_datetime() + theme(legend.title=element_blank()) + geom_vline(xintercept = as.numeric(Sys.time()))


conn_data <- subset(data, variable == "Connections Sold" | variable == "Connections Completed" | variable == "Connections Plan")

ggplot(data=conn_data, aes(x=PDate, y=value, group=variable)) + geom_line(aes(color=variable, group=variable)) + geom_point()  + xlab("Month") + ylab("MRR") + ggtitle("MRR Activities by Month vs Plan") + scale_y_continuous(labels = dollar) + theme_fivethirtyeight() + scale_colour_tableau() + scale_x_datetime() + theme(legend.title=element_blank()) + geom_vline(xintercept = as.numeric(Sys.time()))

#botleft <- c(16071,1)
#topright <- c(16770,1.5)
conn_data <- subset(data, variable == "Conn Comp to Sold" | variable == "Conn Comp to Plan" )
ggplot(data=conn_data, aes(x=PDate, y=value, group=variable)) + geom_line(aes(color=variable, group=variable)) + geom_point()  + xlab("Month") + ylab("MRR") + ggtitle("Connection Rates") + scale_y_continuous() + theme_fivethirtyeight() + scale_colour_tableau() + scale_x_datetime() + theme(legend.title=element_blank()) + geom_vline(xintercept = as.numeric(Sys.time())) + geom_rect(xmin=0, xmax=Inf, ymin=0, ymax=.9,fill = "#FFF0EC",alpha=0.01) + geom_rect(xmin=0, xmax=Inf, ymin=1, ymax=Inf,fill = "aquamarine",alpha=0.01) 


# 
# 
# 
# lim <- par("usr")
# rect(botleft[1], botleft[2], topright[1], topright[2], border = "white", col = "#FFF0EC")
# axis(1) ## add axes back
# axis(2)
# box()   ## and the plot frame
# 
# 
# botleft <- c(0,6)
# topright <- c(10,10)
# plot(1:10, 1:10, type = "n", axes = FALSE) ## no axes
# lim <- par("usr")
# #rect(2, lim[3]-1, 4, lim[4]+1, border = "red", col = "red")
# rect(botleft[1], botleft[2], topright[1], topright[2], border = "white", col = "#FFF0EC")
# #rect (2,2, 4, 4,border = "red", col = "red")
# axis(1) ## add axes back
# axis(2)
# box()   ## and the plot frame
# 
# 

