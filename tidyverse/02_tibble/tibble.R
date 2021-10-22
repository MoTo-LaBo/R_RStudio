#### tibble ####

# 1つ目の作成の仕方
iris %>% 
  as_tibble()

# 2つ目の作成の仕方
tibble(
  No. = 1:3,
  language = c("R", "Python", "Julia")
)

# 3つ目の作成の仕方
tribble(
  ~No., ~language,
  1, "R",
  2, "Python",
  3, "Julia"
)


#### tibble の便利機能 ####
# どんな object でも tibble に格納できる
df =
tibble(
  int = c(5, 10, 76),
  dbl = c(3.124, 8.425, 5.32),
  chr = c("a", "b", "c"),
)

iris %>% 
  as_tibble() %>%
  distinct(Species)

data_1 = 
  iris %>% 
  as_tibble() %>% 
  filter(Species == "setosa")

data_2 = 
  iris %>% 
  as_tibble() %>% 
  filter(Species == "versicolor")

data_3 = 
  iris %>% 
  as_tibble() %>% 
  filter(Species == "virginica")

df_rev_1 =
df %>% 
  mutate(
    data = 
      list(
        data_1, data_2, data_3
      )
  )

df_rev_1 %>% 
  pluck("data", 1)


fig_1 = make_scatter(iris, "setosa")
fig_2 = make_scatter(iris, "versicolor")
fig_3 = make_scatter(iris, "virginica")

df_rev_2 =
df_rev_1 %>% 
  mutate(
    fig =
    list(
      fig_1, fig_2, fig_3
    )
  )

df_rev_2 %>% 
  pluck("fig", 1)

df_rev_2 %>% 
  pluck("fig", 2)

df_rev_2 %>% 
  pluck("fig", 3)





