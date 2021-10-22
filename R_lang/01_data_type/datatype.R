#### data type ####

#### integer / double ####
# int型 : L で区別する
typeof(1L)

# double型
typeof(1)

typeof(3.14)


#### character型 ####
typeof("apple")

typeof("10")

typeof(10)


#### factor型 ####

# character : 文字列として認識される
vec_season_chr =
  c("spring", "summer", "autumn", "winter")

# factor : 数値として認識される
# "(w quotation)がない, levels = 水準 1, 2, 3, 4

vec_season_factor =
  factor(vec_season_chr)

#### Data Frame ####
df = 
    tibble(
    season = vec_season_chr,
    avg_temp = c(22, 30, 18, 9)
  )

# 可視化
df %>%
  ggplot(aes(x = season, y = avg_temp)) +
  geom_bar(stat = "identity")

# x軸の順番変更
vec_season_fct_rev =
vec_season_factor %>%
  fct_relevel("spring", "summer", "autumn", "winter")

df_rev =
  tibble(
    season = vec_season_fct_rev,
    avg_temp = c(22, 30, 18, 9)
  )

df_rev %>%
  ggplot(aes(x = season, y = avg_temp)) +
  geom_bar(stat = "identity")


#### order型 ####
# 水準に大小関係がついている

vec_season_ord =
factor(vec_season_chr, ordered = TRUE)

df_order =
  tibble(
    season =
      vec_season_ord %>%
      fct_relevel("spring", "summer", "autumn", "winter"),
    avg_temp = c(22, 30, 18, 9)
  )

df_order %>%
  filter(
    season >= "autumn"
  )

df_rev %>%
  filter(
    season >= "autumn"
  )


#### logical型 ####

typeof(TRUE)

typeof(FALSE)

























