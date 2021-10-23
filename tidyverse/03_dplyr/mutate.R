#### mutate ####
# 条件で指定した df が右側に挿入される

df =
  tibble(
    No. = 1:5,
    chr = c("one", "two", "three", "four","five")
  )

df %>% 
  mutate(
    a = 10:14,
    b = 15:19,
    c = 20:24,
    d = 1111:1115
  )

#### mutate 便利 function ####
diamonds

# new列に定数"test"を追加
diamonds %>% 
  mutate(
    new = 
      "test"
  ) %>% 
  select(new, everything())

# new列に 2 * depth + 5 * table を追加
diamonds %>% 
  mutate(
    new = 
      2 * depth + 5 * table
  ) %>% 
  select(new, everything())

# color 列の重複を取り除く
diamonds %>% 
  distinct(color)

# color 列が "E" -> "E" を "new" 列に追加
# それ以外 -> "not E" を "new" 列に追加
diamonds %>%
  mutate(
    new = 
      if_else(
        color == "E",
        "E",
        "not E"
      )
  ) %>% 
  select(new, everything())

# 条件が２つ以上の場合
# color 列が "E" -> "E" を "new" 列に追加
# color 列が "I" -> "I" を "new" 列に追加
# それ以外 -> "not_E_I" を "new" 列に追加

diamonds %>% 
  mutate(
    new = 
      case_when(
        color == "E" ~ "E",
        color == "I" ~ "I",
        TRUE ~ "not_E_I"
      )
  ) %>% 
  select(new, everything())
