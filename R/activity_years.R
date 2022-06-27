#' Visualize google search activity over the course of several years for different diseases
#'
#'
#'
#' @param dataset Dataset including multiple years, month and certain activities
#' @param name What disease you want to visualize
#'
#' @importFrom magrittr %>%
#' @import ggplot2
#' @import RColorBrewer
#' @importFrom dplyr filter
#'
#' @return A plot
#' @export
#'
#' @examples
#'
#' dataset <- data.frame(year=(2002:2013),
#'                       month=(1:12),
#'                       activity=(12:1),
#'                       disease=(rep(c("flu","dengue"),times=6)))
#' activity_years_func(dataset,"flu")
#' activity_years_func(dataset,"dengue")

activity_years_func <- function(dataset,name){
  disease <- NULL
  month <- NULL
  activity <- NULL
  year <- NULL

  dataset %>% filter(disease==name) %>%
    ggplot(aes(x=month,y=activity, group=year, color=factor(year)))+
    geom_line()+
    scale_x_continuous(name="Month", breaks=(1:12), limits=c(1, 12))+
    scale_color_brewer(palette = "Set1")+
    theme_minimal()
}
