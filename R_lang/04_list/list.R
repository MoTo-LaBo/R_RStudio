#### list ####
list_sample =
list(
  c(1, 3, 4, 7, 2),
  c("d", "a", "t", "a"),
  c(8),
  list(
    c(2, 0, 2, 0),
    c("c", "a", "t")
  ),
  c(TRUE, FALSE, TRUE)
)

#### list 抽出 ####

# vector 型 vector
list_sample[[2]]

# list 型 vector
list_sample[2]

# 上記の2つの内部構造は全く違うので注意


#### name list ####

list_sample_name =
  list(
    "one" = c(1, 3, 4, 7, 2),
    "two" = c("d", "a", "t", "a"),
    "three" = c(8),
    "four" = list(
      c(2, 0, 2, 0),
      c("c", "a", "t")
    ),
    "five" = c(TRUE, FALSE, TRUE)
  )

list_sample_name[["one"]]
list_sample_name[[1]]

# [[]] 2重括弧をつけないで access できる
list_sample_name$one
