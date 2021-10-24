#### NA処理 ####
# 欠損値処理

#### dorp_na : NA削除 ####
df = 
  tibble(
    x = c(1, 3, 2, 8, 10),
    y = c(10, 4, NA, 6, NA),
    z = c(NA, 8, 7, 8, NA)
  )


# NAがある行を削除する
df %>% 
  drop_na()

# z列にNAがある行を削除
df %>% 
  drop_na(z)

#### replace_na : NAを置換 ####
df

# y列のNAを 5に, z列のNAを 3に置き換え
df %>% 
  replace_na(list(y = 5, z = 3))

# y列, z列のNAを各列のNA以外の平均値に置き換え
df %>% 
  replace_na(list(
    y = mean(df$y, na.rm = TRUE),
    z = mean(df$z, na.rm = TRUE)
  )
  )

#### fill : NA をパディング ####
df 
# y列, z列のNAを直前の値を下げることで置換
# .direction = "down" は default なので記述しなくても良い
df %>% 
  fill(y, z, .direction = "down")

# y列, z列のNAを直前の値を上げることで置換
df %>% 
  fill(y, z, .direction = "up")