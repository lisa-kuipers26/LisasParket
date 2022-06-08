#' Visualise google search activity over the course of several years for different subjects
#'
#'
#'
#' @param dataset Dataset including multiple years, month and certain activities
#' @param activity What activity you want to visualise
#' @import magrittr
#' @import ggplot2
#' @import tidyverse
#'
#' @return A plot
#' @export
#'
#' @examples
#'
#' dataset <- data.frame(year=(2002:2013),month=(1:12),activity1=(12:1),activity2=(24:35))
#' activity_years(dataset,"activity1")
#' activity_years(dataset,"activity2")

activity_years <- function(dataset,activity){
  year<- month <- NULL
  dataset %>% ggplot(aes(x=month,y=dataset[[activity]], group=year, color=factor(year)))+
    geom_line()+
    scale_x_continuous(name="Month", breaks=(1:12), limits=c(1, 12))+
    theme_minimal()
}
