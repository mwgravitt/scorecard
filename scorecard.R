

getTSPlot <- function(data, title, xlabel, ylabel, yformat, ... ){
  # create plot, add lines and points
  g <- ggplot(data=data, aes(x=PDate, y=value, group=variable)) 
  g <- g + geom_line(aes(color=variable, group=variable)) 
  g <- g + geom_point()  
  
  # configure labels and axis
  g <- g + ggtitle(title) 
  g <- g + xlab(xlabel) + ylab(ylabel) 
  g <- g + scale_y_continuous(labels = yformat) 
  g <- g + scale_x_datetime() 
  
  # apply theme
  g <- g + theme_few()
  
  # blank out the legend title
  g <- g+ theme(legend.title=element_blank(), legend.position="bottom") 
  
  
  # add a vertical line on "today"
  g <- g + geom_vline(lty="dotted", xintercept = as.numeric(Sys.time()))

  return(g)
}

getTSPlotWeekly <- function(data, title, xlabel, ylabel, yformat, ... ){
  # create plot, add lines and points
  g <- ggplot(data=data, color=variable, aes(x=PDate, y=value, color=variable, group=variable)) 
 # g <- g + geom_line(aes(color=variable, group=variable)) 
  g <- g + geom_point(aes(color=variable, group=variable))  
  
  # configure labels and axis
  g <- g + ggtitle(title) 
  g <- g + xlab(xlabel) + ylab(ylabel) 
  g <- g + scale_y_continuous(labels = yformat, limits=c(0,15000)) 
  #g <- g + scale_y_continuous(trans = 'log10', labels = yformat)
  g <- g + scale_x_datetime() 
  
  # apply theme
  g <- g + theme_few()
  
  # blank out the legend title
  g <- g+ theme(legend.title=element_blank(), legend.position="bottom") 
  
  
  # add a vertical line on "today"
  g <- g + geom_vline(lty="dotted", xintercept = as.numeric(Sys.time()))
  
  return(g)
}