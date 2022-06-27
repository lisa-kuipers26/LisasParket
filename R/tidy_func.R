
#' Function used for making datasets tidy and splitting date and adding disease to table
#'
#' @param path path to file
#' @param name disease choosen to make tidy
#'
#' @import dplyr
#' @import tidyr
#' @importFrom utils read.csv
#'
#' @return A tidy dataset
#' @export
#'
#' @examples
#'
#'
tidy_func <- function(path,name){
  Date <- NULL
  read_df <- read.csv(path, skip=11) %>% as.data.frame()
  col_nam <- colnames(read_df)
  read_df %>% pivot_longer(cols=col_nam[-1], names_to="country", values_to=paste0("activity")) %>%
    separate(Date, into = c("year", "month","day"),convert = TRUE) %>% mutate("disease"=name)
}
