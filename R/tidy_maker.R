function(path, ziekte){
  read_df <- read.csv(path, skip=11) %>% as.data.frame
  col_nam <- colnames(read_df)
  df_tidy <- read_df %>% pivot_longer(cols=col_nam[-1], names_to="country", values_to=paste0(ziekte,"_activity")) %>%
    separate(Date, into = c("year", "month","day"),convert = TRUE)
}
