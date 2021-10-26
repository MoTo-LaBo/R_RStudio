#### 演習 6 ####
# IMDb列の大きさにより以下の条件で分類し, それぞれについて
# Runtime のヒストグラムを作成する

# 70以上          : high
# 50以上 ~ 70未満 : middle
# 50未満          : low

# IMDb(レビュー)と Runtime(上映時間)の関係性を可視化


# dir 作成
make_dir("exercise6")

# file の読み込み
df_clean =
  read_rds("exercise6/01_input/df_clean.rds")

# columns 絞り込み
df_clean =
  df_clean %>% 
    select(Title, IMDb, Runtime)

#### 条件分岐 -> sample_frac で確認 ####
df_clean %>% 
  mutate(
    evaluate =
      case_when(               # 複数条件の分岐
        IMDb >= 70 ~ "high",
        IMDb < 50 ~ "low",
        TRUE ~ "middle"
      )
  ) %>% 
  sample_frac(0.1)


#### factor型に変換 -> 水準変換 ####
df_clean %>% 
  mutate(
    evaluate =
      case_when(               # 複数条件の分岐
        IMDb >= 70 ~ "high",
        IMDb < 50 ~ "low",
        TRUE ~ "middle"
      ) %>% 
      fct_relevel("high", "middle", "low")
  ) %>% 
  pull()


#### それぞれの data について分割 -> １行でhist作成してみる ####
df_clean %>% 
  mutate(
    evaluate =
      case_when(               # 複数条件の分岐
        IMDb >= 70 ~ "high",
        IMDb < 50 ~ "low",
        TRUE ~ "middle"
      ) %>% 
      fct_relevel("high", "middle", "low")
  ) %>% 
  nest_by(evaluate) %>% 
  pluck("data", 3) %>% 
  ggplot(
    aes(x = Runtime, y = ..density..)
  ) +
  geom_histogram() +                               # ヒストグラム
  geom_density() +                                 # 密度曲線
  ggtitle("evaluate:low") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlim(0, 255) +
  ylim(0, 0.045)


# 上記を関数にする
# make_hist = function(df, flag){
#   df %>% 
#   ggplot(
#     aes(x = Runtime, y = ..density..)
#   ) +
#     geom_histogram() +                               # ヒストグラム
#     geom_density() +                                 # 密度曲線
#     ggtitle(str_c("evaluate : ", flag)) +
#     theme(plot.title = element_text(hjust = 0.5)) +
#     xlim(0, 255) +
#     ylim(0, 0.045)
# }

# 分類した後に nest_gy した df + make_hist()
df_fig =
  df_clean %>% 
    mutate(
      evaluate =
        case_when(                        # 複数条件の分岐
          IMDb >= 70 ~ "high",
          IMDb < 50 ~ "low",
          TRUE ~ "middle"
        ) %>% 
        fct_relevel("high", "middle", "low")
    ) %>% 
    nest_by(evaluate) %>% 
    mutate(                                # hist column 追加
      hist = 
        list(make_hist(data, evaluate))
    )

# ヒストグラムを横に並べて表示する
result_6 =
  df_fig$hist %>% wrap_plots(ncol = 3)

# ヒストグラムを縦に並べて表示する
df_fig$hist %>% wrap_plots(nrow = 3)

# .png file で保存する : ggsave (glaph とかを保存する関数)
?ggsave
ggsave(
  "exercise6/03_output/result_6.png",
  result_6,
  width = 5,
  height = 3
)

