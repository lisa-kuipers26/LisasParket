function(dataset, kolom){
  means <- dataset %>%
    group_by(year) %>%
    summarise(naam=mean(!! sym(kolom),na.rm=TRUE),
              "mean_life_expectancy"=mean(life_expectancy,na.rm=TRUE))

  colnames(means) <- c("year",paste0("mean_",kolom),"mean_life_expectancy")
  means
}
