#### 演習課題2  ####
# Directors ごとの映画の作成数を算出, 作成数の降順(大き順)にソート
# 2以上の監督がいるばいは 1人として算出

# 読み込んで df にする
df_clean =
read_rds("exercise2/01_input/df_clean.rds")

# 監督毎に data を分ける : nest_by

# nrow : dfの行数を算出 -> 5000
nrow(df_clean)

# 解答 1 : 応用が効くのでこちらが良い
result_2 =
  df_clean %>% 
    nest_by(Directors) %>%        # rowwise & grouping
    mutate(
      n = nrow(data)              # Directors 毎の data = 行数算出
    ) %>% 
    arrange(desc(n))              # 昇順に変更 : desc()

# 解答 2
df_clean %>% 
  group_by(Directors) %>% 
  summarise(
    n = n()
  ) %>% 
  arrange(desc(n))

# result_2 を output dir に格納
result_2 %>% 
  write_rds("exercise2/03_output/result_2.rds")


