#### 演習4 ####
make_dir("exercise4")

df_clean =
  read_rds("exercise4/01_input/df_clean.rds")

# str_split で , (カンマ)を境に文字列を分ける
df_clean$Country %>% str_split(",")

# df_clean を必要な列だけに絞る
df_clean %>% 
  select(ID, Title, Country)


# 上記をもとに code 記述
result_4 =
  df_clean %>%
  select(ID, Title, Country) %>% 
  rowwise() %>%          # 行毎に処理をしたいので rowwise する
  mutate(
    list_split = 
      Country %>% str_split(","),
    n_country = 
      list_split %>%      # 各業の data 
      length()
  ) %>% 
  ungroup()                 # rowwise を外す : 次の処理の時に意図しない挙動を防ぐ

# output dir に格納 : rds
result_4 %>% 
  write_rds("exercise4/03_output/result_4.rds")


