make_scatter = function(df, type){
  df_Species =
    df %>% 
    tibble() %>% 
    filter(Species == type)
  
  scatter = 
    df_Species %>% 
    ggplot(
      mapping = aes(x = Sepal.Length, y = Petal.Length)
    ) + 
    geom_point()　+
    geom_smooth(method = "lm", se = FALSE) + 
    theme(
      axis.text = element_text(size = 25),
      axis.title = element_text(size = 25)
    )
  
  return(scatter)
}