#### ------ exercise1 : answer ----- ####

##### ① info_movies, info_platforms を縦に結合 ####
# working dir
getwd()

#### dir -> file 一覧 ####
file_m =
  list.files("exercise1/01_input/info_movies/", full.names = TRUE)

read_csv(file_m[1])
read_csv(file_m[2])

#### info_movies file row 結合  ####
bind_rows(
  read_csv(file_m[1]),
  read_csv(file_m[2]),
  read_csv(file_m[3]),
  read_csv(file_m[4]),
  read_csv(file_m[5])
)

#### 上記でも間違いないが, もっと効率が良い記述がある ####
#### 1, dir path -> file 取得 ####
path_m <- "exercise1/01_input/info_movies/"
dir(path_m, full.names = TRUE)

path_p <- "exercise1/01_input/info_platforms/"
dir(path_p, full.names = TRUE)

##### 2, tibble に入れてあげる : tibble ####
tibble(
  path = 
    dir(path_m, full.names = TRUE)
)

#### 3, path を使って df を tibble に入れる : rowwise & mutate -> csv列作成 ####
df_info_movies =
  tibble(
    path = 
      dir(path_m, full.names = TRUE)
  ) %>% 
    rowwise() %>% 
    mutate(
      csv = 
        list(read_csv(path))
    )

df_info_movies

df_info_platforms = 
  tibble(
    path =
      dir(path_p, full.names = TRUE)
  ) %>% 
  rowwise() %>% 
  mutate(
    csv =
      list(read_csv(path))
  )

df_info_platforms

##### 4, bind_rows で file 結合 ####
df_movies = bind_rows(df_info_movies$csv)

df_platforms = bind_rows(df_info_platforms$csv)


#### ② 上記を info_movies, info_platforms をinner join  ####

df_merge = inner_join(df_movies, df_platforms)


#### ③ 2の df に以下の処理を施す ####
#### 1, 欠損値(NA)行を削除 ####
df_merge %>% 
  drop_na()


#### 2,  Netflix, Hulu, Prime_Video, Disney に対し, 0, 1以外の行を削除 ####
#### 1 : 放映している, 0 : 放映していない ####
df_merge %>% 
  drop_na() %>% 
  filter(
    Netflix %in% c(0, 1), # TRUE の所だけ取得できる = 0,1 の所だけ
    Hulu %in% c(0, 1),
    Prime_Video %in% c(0, 1),
    Disney %in% c(0, 1)
  )

# 各要素に対して 0 か 1 が含まれているか? 含まれていたら TRUE, 含まれていない FALSE
df_merge$Netflix

# TRUE or FALSE 表示
df_merge %>% 
  drop_na() %>% 
  pull(Netflix) %in% c(0, 1)


##### 3, Age 列を factor に変換 level は 7+, 13+, 16+, 18+, all の順 ####
df_merge %>% 
  drop_na() %>% 
  filter(
    Netflix %in% c(0, 1),            # TRUE の所だけ取得できる = 0,1 の所だけ
    Hulu %in% c(0, 1),
    Prime_Video %in% c(0, 1),
    Disney %in% c(0, 1)
  ) %>% 
  mutate(                            # mutate はすでにある列に対しての更新にも使用可
    Age = Age %>% fct_relevel("7+")
  )

##### 4, IMDb列を 10倍 ####
# 5, Rotten_Tomatoes列の % を削除して -> 数値に変換 ####
df_clean =
  df_merge %>% 
    drop_na() %>% 
    filter(
      Netflix %in% c(0, 1),            # TRUE の所だけ取得できる = 0,1 の所だけ
      Hulu %in% c(0, 1),
      Prime_Video %in% c(0, 1),
      Disney %in% c(0, 1)
    ) %>% 
    mutate(                            # mutate はすでにある列に対しての更新にも使用可
      Age = Age %>% fct_relevel("7+"),
      IMDb = IMDb * 10,
      Rotten_Tomatoes = 
        Rotten_Tomatoes %>% str_replace("%", "") %>% 
        as.numeric()
    )

#### 6, RDS にして保存 ####

df_clean %>% 
  write_rds("exercise1/03_output/df_clean.rds")


