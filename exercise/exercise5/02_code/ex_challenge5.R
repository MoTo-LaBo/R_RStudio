#### 演習 5 ####
# 各プラットフォームで放映されている作品のうち, それぞれの推奨年齢が
# 何割を占めているかを算出

### pivot を使いこなせるかどうかで data分析の処理効率が早くなり, 応用にも対応できる

# dir 作成 -> data copy -> 移動 : function 内で完結
make_dir("exercise5")

# file の読み込み
df_clean =
  read_rds("exercise5/01_input/df_clean.rds")

# 必要な columns を絞る
df_clean %>% 
  select(Title, Age, Netflix:Disney)


# pivot 変換 : 縦横変換により
# nest_by & rowwise の使用でかなり処理が簡単に早くできる
# 正攻法で1列づつするとかなりの労力がかかる

df_clean %>% 
  select(Title, Age, Netflix:Disney) %>% 
  pivot_longer(
    Netflix:Disney,
    names_to = "platforms"
  ) %>% 
  nest_by(platforms) %>% 
  pluck("data", 1)


# 放映している data だけを取得 = 1
result_5 =
  df_clean %>% 
    select(Title, Age, Netflix:Disney) %>% 
    pivot_longer(                            # 列名を行名に変換
      Netflix:Disney,
      names_to = "platforms"
    ) %>% 
    nest_by(platforms) %>%
    mutate(
      broadcast_data = 
        list(data %>% filter(value == 1)),     # df を入れ時は list化する : errorになる
      n_broadcast = nrow(broadcast_data)       # df の行数を算出
    ) %>% 
    ungroup() %>%                    # rowwise を外す : 次の処理の時に意図しない挙動を防ぐ
    select(-data) %>%                           # data 列を削除
    unnest(broadcast_data) %>%                  # list形式を元に戻す
    nest_by(platforms, Age, n_broadcast) %>%    # どこで nest_by するか考える
    mutate(
      prop =　nrow(data) / n_broadcast　　　　　# 行数を算出(年齢別放映) / 放映総数 = 割合
    ) %>% 
    ungroup() %>% 
    select(-n_broadcast, -data) %>%             # 不要な列を削除
    pivot_wider(                                # pivot wider で行を列に変換を変更
      names_from = Age,                         # columns(列)にしたいもの
      values_from = prop,                       # value(行)にしたいもの
      names_prefix = "prop_"                    # columns(列名)に追記
    )

# output に格納 : rds, csv
result_5 %>% 
  write_rds("exercise5/03_output/result_5.rds")

result_5 %>% 
  write_csv("exercise5/03_output/result_5.csv")



