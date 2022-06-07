function(dataset,activity){
  dataset %>% ggplot(aes(x=month,y=dataset[[activity]], group=year, color=factor(year)))+
    geom_line()+
    scale_x_continuous(name="Month", breaks=(1:12), limits=c(1, 12))+
    scale_color_brewer(palette = "Set1")+
    theme_minimal()
}
