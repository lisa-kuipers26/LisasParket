#' Plots with means of variables of  population, GDP from gapminder and activity
#'
#' @param dataset all_data dataset
#' @param year Year you want data about
#' @param name Column/disease you want to know the mean activity of
#'
#' @return A stacked plot comparing population, gdp and activity
#'
#' @export
#'
#' @import stringr
#' @importFrom  magrittr %>%
#' @import  plotly
#' @importFrom  gridExtra grid.arrange
#' @importFrom  dplyr summarise group_by filter
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
  colnames(country_data) <- c("country","activity","population","GDP")
  country_data[order(country_data$population, decreasing=TRUE),]

  plot1 <- plot_ly(data = country_data,
                   x = ~activity,
                   y = ~population,
                   type = 'scatter',
                   color =~country,
                   showlegend=FALSE) %>%
    layout(yaxis = list(title = 'Population'))
  plot2 <- plot_ly(data = country_data,
                   x = ~activity,
                   y = ~GDP,
                   type = 'scatter',
                   color =~country,
                   showlegend=FALSE) %>%
    layout(xaxis = list(title = 'Activity'),
           yaxis = list(title = 'GDP'))

  fig <- subplot(plot1,plot2, nrows = 2,titleY = TRUE, shareX = TRUE, titleX = TRUE) %>%
    layout(title = list(text = paste(str_to_title(name),"search activity tegen populatie en GDP")))
  fig
}
