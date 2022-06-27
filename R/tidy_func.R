
#' Function used for making datasets tidy and splitting date and adding disease to table
#'
#' @param path path to file
#' @param name Disease choosen to make tidy
#'
#' @importFrom magrittr %>%
#' @importFrom dplyr mutate
#' @importFrom tidyr pivot_longer separate
#' @importFrom utils read.csv
#'
#' @return A tidy dataset
#' @export
#'
#' @examples
#' test <- c(rep(c(" , , , "), 11),"Date,a,b,c","2002-12-29,1,2,3", "2003-01-05,4,5,6",
#' "2003-01-12,7,8,9")
#'
#' tf <-tempfile()
#' writeLines(test,tf)
#' tidy_func(tf,"dengue")
#' unlink(tf)
#'
tidy_func <- function(path,name){
  Date <- NULL
  read_df <- read.csv(path, skip=11) %>% as.data.frame()
  col_nam <- colnames(read_df)
  read_df %>% pivot_longer(cols=col_nam[-1], names_to="country", values_to=paste0("activity")) %>%
    separate(Date, into = c("year", "month","day"),convert = TRUE) %>% mutate("disease"=name)
}
