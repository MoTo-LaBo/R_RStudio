#### 演習 7 ####
# Age 毎に IMDb, Rotten_Tomatoes, Runtime の散布図行列を作成
# GGally の関数を ggpairs を使用すると楽にできる

# dir 作成
make_dir("exercise7")

# file 読み込み
df_clean =
  read_rds("exercise7/01_input/df_clean.rds")

# columns 絞る
df_clean =
  df_clean %>% 
  select(Age, IMDb, Rotten_Tomatoes, Runtime)

# ggpairs
result_7 =
  df_clean %>% 
  ggpairs(mapping = aes(color = Age, alpha = 0.5))

# .png で保存
ggsave(
  "exercise7/03_output/result_7.png",
  result_7
)

