#### arrange, distinct, across ####

# arrange : ソート
# distinct : 重複削除
# across : 列処理

#### arrange ####
diamonds

# depth 列を昇順に変換
diamonds %>% 
  arrange(depth)

# depth 列を降順に変換 : desc
diamonds %>% 
  arrange(desc(depth))

# 複数列(depth列, table列)でソート
diamonds %>% 
  arrange(depth, table)

# cut列の重複削除
diamonds %>% 
  distinct(cut)

diamonds %>% 
  distinct(cut, .keep_all = FALSE)

# cut列の重複削除, 他の列も残す
diamonds %>% 
  distinct(cut,
           .keep_all = TRUE)

# cut列, color列の重複削除
diamonds %>% 
  distinct(cut, color)


#### across : 列処理 ####
diamonds

# color毎の depth, table, price の平均
diamonds %>% 
  distinct(color)

# group_by, summarise 使用
diamonds %>% 
  group_by(color) %>%
  summarise(across(depth:price, mean))

diamonds %>% 
  group_by(color) %>% 
  summarise(
    depth = mean(depth),
    table = mean(table),
    price = mean(price)
  )


# 列: numeric型
# 処理内容: color毎に numeric型の平均を標準偏差で割る
# ~ の後に処理内容を記載
# .x は, 指定した列を表している

diamonds %>% 
  group_by(color) %>% 
  summarise(across(where(is.numeric),
                   ~ mean(.x) / sd(.x)
                   ))

# 処理内容: numeric型 - 平均を標準偏差で割る
diamonds %>% 
  mutate(
    across(where(is.numeric),
    ~ (.x - mean(.x) / sd(.x))
    )
  )
