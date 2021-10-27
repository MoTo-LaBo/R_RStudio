#### tidy data  ####
# tidy data と呼ばれる列指向の data形式に整備する

# 雑然 data (messy data) sample
# 店舗名とフルーツの販売個数 data
store = c("A", "B", "C", "D", "E")
apple = c(3, 5, 5, 9, 2)
orange = c(0, 5, 6, 1, 2)
banana = c(2, 2, 5, 2, 3)
grape = c(1, 1, 0, 2, 1)

messy_d = 
  tibble(
    store, apple, orange, banana, grape
  )

messy_d

# messy_data をtidy data(整然:縦持ち) data へ変換
pivot_longer(
  messy_d,
  cols = c(apple:grape)
)

# key, value の名前指定
tidy_d =
pivot_longer(
  messy_d,
  cols = c(apple:grape),
  names_to = "fruits",
  values_to = "quantity"
)

tidy_d

# messy data(雑然)へ戻す
tidy_d %>% 
  pivot_wider(
    names_from = fruits,
    values_from = quantity
  )

#### パイプ演算子 ####
# data操作を扱う dplyr package 等では非常に役に立つ

# ISLR package の Default data を使用 
library(ISLR)

# default : 債務不履行
# student : 学生
# balance : 債務残高
# income  : 収入

# tibble に変換
Def =
  Default %>% 
  tibble()

# パイプ演算使用
Def_2 =
  Def %>% 
    select(default, balance) %>% 
    filter(default == "Yes") %>% 
    mutate(new_column = balance - mean(balance))
  
#### 列の抽出 ####
# dplyr package の select 関数で列を抽出

# ISLR package の Default data を使用 
library(ISLR)

Def =
  Default %>% 
  tibble()

Def2 =
Def %>% 
  select(default, student)
Def2


Def %>% 
  select(1:3)


Def %>% 
  select(default:income)


Def %>% 
  select(balance_new = balance)


Def %>% 
  rename(balance_new = balance)


Def %>% 
  select(starts_with("d"))


Def %>% 
  select(ends_with("t"))


Def %>% 
  select(contains("n"))


Def %>% 
  select(where(is.double))


#### 列の追加 ####
# mutate関数

Def %>% 
  mutate(
    default_copy = default
  )

Def %>% 
  mutate(
    default_copy = default,
    studant_copy = student
  )


Def %>% 
  mutate(
    default_copy = default,
    studant_copy = student,
    .after = student           # student の後ろに追加
  )

Def %>% 
  mutate(
    default_copy = default,
    studant_copy = student,
    .before = student          # 前に追加
  )


Def %>% 
  mutate(
    col_yes = "Yes"
  )


Def %>% 
  mutate(
    id = c(1:10000)
  )


Def %>% 
  mutate(
    id = length(default)
  )


Def %>% 
  mutate(
    random = rnorm(n = 10000, mean = 0, sd = 1)
  )

Def %>% 
  mutate(
    sum_bal_inc = balance + income
  )

Def %>% 
  mutate(
    income_floor = floor(income),        # 小数切り捨て
    income_ceiling = ceiling(income)     # 小数切り上げ
  )
