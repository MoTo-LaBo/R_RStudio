#### data frame ####
df =
data.frame(
  season = c("spring", "summer", "autumn", "winter"),
  ave_temp = c(22, 30, 18, 9)
)

#### data frame 要素の抽出 ####

df$season

df$ave_temp


#### tibble ####
# tibble を使用する事により data frame がいらなくなる

tibble(
  season = c("spring", "summer", "autumn", "winter"),
  ave_temp = c(22, 30, 18, 9)
)
