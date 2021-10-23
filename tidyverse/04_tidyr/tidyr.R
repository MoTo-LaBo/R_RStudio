#### tidyr ####
# data 処理に特化した package

#### pivot系: 縦横変換 ###
# 縦型: long型
# 横型: wide型


# wide型の data frame を定義
df_wide = tibble(
  store = c("A", "B", "C"),
  orange = c(100, 70, 120),
  apple = c(150, 90, 80)
)

df_long = 
df_wide %>% 
  pivot_longer(
    cols =  c(orange, apple),
    names_to = "fruit",
    values_to = "price"
  )

df_wide =
df_long %>% 
  pivot_wider(
    names_from = fruit,
    values_from = price
  )

#### separate,  unite : 列の分割と結合 ####

df_unite =
  tibble(
    No. = 1:5,
    data = 
      c("2019-1", "2020-3", "2017-12", "2018-9", "2015-4")
  )

# column 分割 : separate
df_separate =
df_unite %>% 
  separate(
    col = data,
    into = c("year", "month"),
    sep = "-"
  )


# column 結合 : unite
# sep を何も指定しないと _ (アンダーバー)が default で入る
df_unite =
df_separate %>% 
  unite(
    col = data, year, month,
    sep = "-"
  )
