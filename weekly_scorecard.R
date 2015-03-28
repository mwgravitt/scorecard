---
title: "Weekly Analytics Implementation Scorecard"
author: "Max"
date: "Saturday, March 28, 2015"
output: pdf_document
---


``` {r echo=FALSE, warning=FALSE}
source ("scorecard.R")
library("ggplot2")
library("reshape")
library("scales")
library("ggthemes")
library("knitr")
sc <- read.csv (file="scorecard_data.csv")
sc$Date <- as.Date(sc$Date, "%m/%d/%Y")
sc$PDate <- as.POSIXct(sc$Date)

data <- melt (sc, id=c("Date", "Year", "Month", "PDate"))
data$variable <- gsub("_", " ", data$variable)

mrr_data <- subset(data, variable == "MRR Sold" | variable == "MRR Completed" | variable == "MRR Plan")
budget_data <- subset(data, variable == "Expense Budget Original" | variable == "Expense Actual" | variable == "Expense Budget Latest")
conn_data <- subset(data, variable == "Connections Sold" | variable == "Connections Completed" | variable == "Connections Plan")

# prepare YTD data
sc_ytd <- subset(sc, Year == 2015)
sc_ytd <- cbind (sc_ytd, Cum_MRR_Comp=cumsum(sc_ytd$MRR_Completed))
sc_ytd <- cbind (sc_ytd, Cum_MRR_Sold=cumsum(sc_ytd$MRR_Sold))
sc_ytd <- cbind (sc_ytd, Cum_MRR_Plan=cumsum(sc_ytd$MRR_Plan))
sc_ytd <- cbind (sc_ytd, Cum_Conn_Comp=cumsum(sc_ytd$Connections_Completed))
sc_ytd <- cbind (sc_ytd, Cum_Conn_Sold=cumsum(sc_ytd$Connections_Sold))
sc_ytd <- cbind (sc_ytd, Cum_Conn_Plan=cumsum(sc_ytd$Connections_Plan))

data_ytd <- melt (sc_ytd, id=c("Date", "Year", "Month", "PDate"))
data_ytd$variable <- gsub("_", " ", data_ytd$variable)

mrr_data_ytd <- subset(data_ytd, variable == "Cum MRR Comp" | variable == "Cum MRR Sold" | variable == "Cum MRR Plan")
conn_data_ytd <- subset(data_ytd, variable == "Cum Conn Comp" | variable == "Cum Conn Sold" | variable == "Cum Conn Plan")


```

You can also embed plots, for example:

```{r, echo=FALSE}
plot(cars)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
