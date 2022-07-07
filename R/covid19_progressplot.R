#' Function for visulaising covid cases and deaths
#'
#' @param dataset Filtered dataset with covid data
#' @param condition Choose cases or deaths
#'
#' @importFrom magrittr %>%
#' @import plotly
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
  plot_ly(data = dataset,
          x = ~date_range,
          y = ~dataset[[condition]],
          type = 'scatter',
          showlegend=FALSE) %>%
    layout(xaxis=list(title="Date"),
           yaxis=list(title=condition))
}
