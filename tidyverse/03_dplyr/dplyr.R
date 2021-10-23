#### {dplyr} (ディプライアー) ####
# data frame 処理


#### filter ####
# 条件を満たした行が抽出される

# carat が 0.25以上が削除される
diamonds %>% 
  filter(
    carat <= 0.25
  )

df =
  tibble(
    No = 1:7,
    gender =
      c("M", "F", "F", "M", "F", "M", "M"),
    height = 
      c(165, 150, 170, 175, 165, 195, 180)
  )

df %>% 
  filter(
    gender == "F"
  )

#### filter function ####

diamonds

# price (column) 337の row を filtering
diamonds %>% 
  filter(
    price == 337
  )

# depth (column) 62以上の row を filtering
diamonds %>% 
  filter(
    depth >= 62
  )

# carat (column) 0.23 ~ 0.27 の row を filtering
diamonds %>% 
  filter(
    carat >= 0.23 & carat <= 0.27
  )

# 上記の別回答
diamonds %>% 
  filter(
    between(carat, 0.23, 0.27)
  )

# cut (column) Good以上の row を filtering
diamonds %>% 
  filter(
    cut >= "Good"
  )

# 上記の水準確認
diamonds$cut %>%  levels()

# color (column) E以外の row を filtering
diamonds %>% 
  filter(
    color != "E"
  )

# color (column) I or j の row を filtering

diamonds %>% 
  filter(
    color == "I" | color == "J"
  )

# またわ系の時に活躍 -> %in%
diamonds %>% 
  filter(
    color %in% c("I", "J")
  )


# cut (column) NAの row を filtering
# NA = 欠損値
diamonds %>% 
  filter(is.na(cut))


# NAがある data frame を定義
df =
  tibble(
    col =
      c(1, NA, 3, 5, NA, 6, 9)
  )
df %>% 
  filter(is.na(col))


# depth (column) 62以上のかつ color (column) が H の row を filtering
diamonds %>% 
  filter(
    depth >= 62 & color == "H"
  )

# AND は以下でもOK
diamonds %>% 
  filter(
    depth >= 62, color == "H"
  )


# depth (column) 62以上 またわ color (column) が H の row を filtering
# 62 or H どちらかが TRUE の場合
diamonds %>% 
  filter(
    depth >= 62 | color == "H"
  )


# depth (column) 62以上, color (column) が H の排他的論理和の row を filtering
diamonds %>% 
  filter(
    xor(depth >= 62, color == "H")
  )

# depth (column) 62以上 かつ color (column) が H ではない row を filtering
diamonds %>% 
  filter(
    !(depth >= 62 & color == "H")
  )
