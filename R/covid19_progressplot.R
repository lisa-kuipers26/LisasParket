#' Function for visulaising covid cases and deaths
#'
#' @param dataset Filtered dataset with covid data
#' @param condition Choose cases or deaths
#'
#' @importFrom magrittr %>%
#' @import ggplot2
#'
#' @return A plot with date range on x-axis and amount of deaths/cases on y axis
#' @export
#'
#' @examples
#' dataset <- data.frame(date_range=(20200512:20200812),
#'            deaths=(1:301),cases=(1:301),
#'            dateRep=(20200512:20200812))
#' covid19_progressplot(dataset,"cases")
#' covid19_progressplot(dataset,"deaths")
covid19_progressplot <- function(dataset,condition){
  date_range<-NULL
  dataset %>% ggplot(aes(x=date_range, y=dataset[[condition]]))+
    geom_point()+
    scale_x_discrete(breaks=dataset$date_range[seq(1,length(dataset$date_range),by=50)])+
    theme(axis.text.x = element_text(angle = 90))+
    labs(x="Date",
         y=dataset[[condition]],
         title = paste("Amount of COVID-19",condition," from",dataset$dateRep[length(dataset$dateRep)],"to",dataset$dateRep[1]))
}
