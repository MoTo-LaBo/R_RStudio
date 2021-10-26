#### 演習課題 3 ####

# dir 作成
make_dir("exercise3")

# df 読み込み
df_clean =
  read_rds("exercise3/01_input/df_clean.rds")

# 3, プラットフォームの配信パターン毎に IMDb と Rotten_Tomatoes の平均を算出
# df の上から１行目で試す
df_clean %>% 
  nest_by(Netflix, Hulu, Prime_Video, Disney) %>% 
  pluck("data", 1) %>%                   # df の上から1行目
  pull(IMDb) %>%                         # IMDb 列が vector で取得される
  mean()


# 上記を参考に 全体行に処理をして平均を求める
# IMDb の平均値
result_3 =
  df_clean %>% 
    nest_by(Netflix, Hulu, Prime_Video, Disney) %>% 
    mutate(
      avg_IMDb =                # 新たに列を追加
        data %>%                # nest_by で rowwise されているので各行も処理される
        pull(IMDb) %>%          # IMDb 列が vector で取得される
        mean(),
      avg_Rotten =                # 新たに列を追加
        data %>%                # nest_by で rowwise されているので各行も処理される
        pull(Rotten_Tomatoes) %>%          # IMDb 列が vector で取得される
        mean()
    ) %>% 
  ungroup()                   # rowwise を外す : 次の処理の時に意図しない挙動を防ぐ

# output dir に格納 : rds
result_3 %>% 
  write_rds("exercise3/03_output/result_3.rds")


# output dir に格納 : csv
# csv での扱いでは, 数値と文字以外は error になる -> list, tibble, df, etc...扱いえない
# error になる列は削除して保存
result_3 %>% 
  select(-data) %>% 
  write_csv("exercise3/03_output/result_3.csv")


# Rotten_Tomatoes の平均値
# resulut_3
# df_clean %>% 
#   nest_by(Netflix, Hulu, Prime_Video, Disney) %>% 
#   mutate(
#     avg_Rotten =                # 新たに列を追加
#       data %>%                # nest_by で rowwise されているので各行も処理される
#       pull(Rotten_Tomatoes) %>%          # IMDb 列が vector で取得される
#       mean()
#   ) %>% 
#   ungroup()                   # rowwise を外す : 次の処理の時に意図しない挙動を防ぐ


#### group_by での記述の仕方 :参考 ####
# df_clean %>% 
#   group_by(Netflix, Hulu, Prime_Video, Disney) %>% 
#   summarise(
#     avg_IMDb = mean(IMDb),
#     avg_Rotten = mean(Rotten_Tomatoes)
#   )





