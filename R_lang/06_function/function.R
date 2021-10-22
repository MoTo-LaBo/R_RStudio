 #### function ####

add_1 = function(x){
  y = x + 1
  return(y)
}

add_1(3)

add_1(8)

#### function を使う理由 ####

iris_setosa = 
  iris %>%
  tibble() %>%
  filter(Species == "setosa")


iris_versicolor = 
  iris %>%
  tibble() %>%
  filter(Species == "versicolor")


iris_virginica = 
  iris %>%
  tibble() %>%
  filter(Species == "virginica")

# 散布図 function を使用しなかった場合
# 冗長的な code を何回も記述している
iris_setosa %>%
  ggplot(
    mapping = aes(x = Sepal.Length, y = Petal.Length)
  ) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  theme(
    axis.text = element_text(size = 20),
    axis.title = element_text(size = 25)
  )

iris_versicolor %>%
  ggplot(
    mapping = aes(x = Sepal.Length, y = Petal.Length)
  ) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  theme(
    axis.text = element_text(size = 20),
    axis.title = element_text(size = 25)
  )

iris_virginica %>%
  ggplot(
    mapping = aes(x = Sepal.Length, y = Petal.Length)
  ) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  theme(
    axis.text = element_text(size = 20),
    axis.title = element_text(size = 25)
  )
iris

# function を使用した plot
# 引数を変えるだけで plot を変更できる

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


make_scatter(df = iris, type= "setosa")

make_scatter(df = iris, type= "versicolor")

make_scatter(df = iris, type= "virginica")








