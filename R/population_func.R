#' Summarises means of variables of  population, GDP from gapminder and activity life expectancy from the google dataset an dmake a plot
#'
#' @param dataset all_data dataset
#' @param year year you want data about
#' @param name column/disease you want the mean of
#'
#' @return A summarised dataset
#'
#' @export
#'
#' @import  magrittr
#' @import  ggplot2
#' @import  gridExtra
#' @import  dplyr
#'
#' @examples
#' dataset <- data.frame(year=(2002:2013),
#' country=letters[1:12],
#' population=(1:12),
#' gdp=(1:12),
#' month=(1:12),
#' activity=(12:1),
#' disease=(rep(c("flu","dengue"),times=6)))
#'
#' population_func(dataset,2008,"flu")
#' population_func(dataset,2008,"dengue")
population_func <- function(dataset,year,name){
  disease <- NULL
  country <- NULL
  activity <- NULL
  population <- NULL
  gdp <- NULL

  country_data <- dataset %>% filter(year==2008, disease==name) %>%
    group_by(country) %>%
    summarise(mean(activity, na.rm=TRUE), max(population),max(gdp))
  colnames(country_data) <- c("country","activity","population","gdp")
  country_data[order(country_data$population, decreasing=TRUE),]


  plot1 <- country_data %>% ggplot(aes(x=country, y=population))+
    geom_col()+
    theme_minimal()+
    theme(axis.text.x = element_text(angle = 90,vjust=0.3,hjust=1))
  plot2 <- country_data %>% ggplot(aes(x=country, y=gdp))+
    geom_col()+
    theme_minimal()+
    theme(axis.text.x = element_text(angle = 90,vjust=0.3,hjust=1))
  plot3 <- country_data %>% ggplot(aes(x=country, y=activity))+
    geom_col()+
    theme_minimal()+
    theme(axis.text.x = element_text(angle = 90,vjust=0.3,hjust=1))

  grid.arrange(plot1,plot2,plot3)
}
