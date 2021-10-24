#### purrr : 繰り返し処理 ####
# 行ごとに同じ処理を繰り返す
# dplyr rowwise と出力は同じ 違いは code の記述の仕方


#### map :行毎の処理（引数 1 つ） ####
diamonds

# cut nest, 散布図を作成 引数 : cut
diamonds %>% 
  group_nest(cut) %>% 
  mutate(
    fig =
      data %>% 
       map(
         ~
           .x %>% 
           ggplot(aes(x = carat, y = price)) +
           geom_point(color = "orange")
       )
  ) %>% 
  pluck("fig", 5)

#### pmap : 行処理(引数複数) ####
# cut nest ,　撒布図を作成　引数 : cut & data
diamonds %>% 
  group_nest(cut) %>% 
  mutate(
    fig =
      list(cut, data) %>% 
      pmap(
        ~
          ..2 %>% 
          ggplot(aes(x = carat, y = price)) +
          geom_point(color = "orange") +
          labs(title = ..1)
      )
  ) %>% 
  pluck("fig", 5)


#### pwalk : 行処理(保存) ####

# cut nest, 系列毎の data frame を csv にして出力
# data frame の中にではなく外に(csv) に保存する
