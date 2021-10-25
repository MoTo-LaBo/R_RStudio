#### ------ exercise1 ----- ####
# ① info_movies, info_platforms を縦に結合

# working dir 確認 : "/home/rstudio/r_rstudio/exercise"
getwd()

# directory 内のfile 一覧確認 : list.files()
file_m = 
list.files("exercise1/01_input/info_movies/", full.names = TRUE)

file_p = 
list.files("exercise1/01_input/info_platforms/", full.names = TRUE)

# dir 内のfile path & file(csv) 格納
file_m
file_p

# file 数取得
len_m <- length(file_m)
len_m
len_p <- length(file_p)
len_p

#### 各 file 読み込み ####

m_df1 =
  read_csv(file_m[1])

p_df1 =
  read_csv(file_p[1])

m_df2 =
  read_csv(file_m[2])

p_df2 =
  read_csv(file_p[2])

m_df3 =
  read_csv(file_m[3])

p_df3 =
  read_csv(file_p[3])

m_df4 =
  read_csv(file_m[4])

p_df4 =
  read_csv(file_p[4])

m_df5 =
  read_csv(file_m[5])

p_df5 =
  read_csv(file_p[5])



#### info_movies, info_platforms 全 file row 結合  ####
mv_df =
  bind_rows(m_df1, m_df2, m_df3, m_df4, m_df5)

pl_df =
  bind_rows(p_df1, p_df2, p_df3, p_df4, p_df5)


#### ② 上記を info_movies, info_platforms をinner join  ####
mp_df =
  inner_join(mv_df, pl_df)

mp_df %>% 
  select(Netflix:Disney)

#### ③ 2の df に以下の処理を施す
# 1, 欠損値(NA)行を削除
# 2,  Netflix, Hulu, Prime_Video, Disney に対し, 0, 1以外の行を削除
# 3, Age 列を factor に変換 level は 7+, 13+, 16+, 18+, all の順
# 4, IMDb列を 10倍
# 5, Rotten_Tomatoes列の % を削除して -> 数値に変換


### 1, 欠損値(NA)行を削除
mp_df_na =
  mp_df %>%
    drop_na()

### 2, Netflix, Hulu, Prime_Video, Disney に対し, 0, 1以外の行を削除

mp_df_na %>% 
  select(Netflix:Disney) %>% 
  filter(
    Netflix != TRUE & Netflix != FALSE,
  )

mp_df_na %>% 
  select(Netflix:Disney) %>% 
  filter(
    Hulu != TRUE & Hulu != FALSE,
  )

mp_df_na %>% 
  select(Netflix:Disney) %>% 
  filter(
    Prime_Video != TRUE & Prime_Video != FALSE,
  )

mp_df_na %>% 
  select(Netflix:Disney) %>% 
  filter(
    Disney != TRUE & Disney != FALSE,
  )

### 3, Age 列を factor に変換 
mp_df_na_fac =
mp_df_na %>% 
  type.convert("Age", factor)


# Levels (水準)確認 : default は辞書順になっている
# 水準変更 : level は 7+, 13+, 16+, 18+, all の順

mp_df_na_fac_fct =
mp_df_na_fac %>% 
  mutate(
    Age = 
      fct_inorder(Age)
  )

mp_df_na_fac_fct$Age


### 4, IMDb列を 10倍
mp_df_na_fac_fct_10 =
mp_df_na_fac_fct %>%
  mutate(
    IMDb = 
      IMDb * 10
  )

# 5, Rotten_Tomatoes列の % を削除して -> 数値に変換
mp_df_na_fac_fct_10 =
mp_df_na_fac_fct_10 %>% 
  mutate(
    Rotten_Tomatoes = 
      str_replace_all(Rotten_Tomatoes, pattern = "%", replacement = "")
  )

mp_df_na_fac_fct_10_int =
mp_df_na_fac_fct_10 %>% 
  type.convert("Rotten_Tomatoes", integer)


mp_df_na_fac_fct_10_int







