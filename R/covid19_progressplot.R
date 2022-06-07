function(condition,type){
  data_filtered %>% ggplot(aes(x=date_range, y=condition))+
    geom_point()+
    scale_x_discrete(breaks=data_filtered$date_range[seq(1,length(data_filtered$date_range),by=50)])+
    theme(axis.text.x = element_text(angle = 90))+
    labs(x="Date",
         y=type,
         title = paste("Amount of COVID-19",type," from",data_filtered$dateRep[length(data_filtered$dateRep)],"to",data_filtered$dateRep[1]))
}
