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

#### 列の追加 ####
# ISLR package の Default data を使用 
library(ISLR)

Def = 
  Default %>% 
  tibble()

# 列を追加(条件分岐と組み合わせて)
Def %>% 
  mutate(
    default_locale = if_else(default == "Yes", TRUE, FALSE)
  )

Def %>% 
  mutate(
    income_category = if_else(
      income >= 30000,
      "3万ドル以上",
      "3万ドル未満"
    )
  )

# mutate -> 列を追加 : case_when 3つ以上の値に条件分岐
Def %>% 
  mutate(
    income_category = 
      case_when(
        income >= 40000 ~ "4万ドル ~",
        income >= 30000 ~ "3万ドル ~ 4万ドル",
        income >= 20000 ~ "2万ドル ~ 3万ドル",
        TRUE            ~ "~ 2万ドル"
      )
  )

#### 行の抽出 ####
# dplyr package の filter 関数で行を抽出(保持)

Def %>% 
  filter(default == "Yes")

Def %>% 
  filter(default == "Yes", student == "Yes")

Def %>% 
  filter(default == "Yes" | student == "Yes")


Def %>% 
  filter(default != "Yes")


Def %>% 
  filter(balance >= 2000)


Def %>% 
  filter(between(balance, 1500, 2000))


Def_case =
  Def %>% 
  mutate(
    balance_category = 
      case_when(
        balance >= 1000 ~ "1000ドル~",
        balance >= 900 ~ "900 ~ 1000ドル",
        balance >= 800 ~ "800 ~ 900ドル",
        TRUE           ~ "~ 800ドル"
      )
  )

# %in% で行の抽出
Def_case %>% 
  filter(balance_category %in% c("1000ドル~", "~ 800ドル"))

# NA ありの列を作成
Def_na =
  Def %>% 
  mutate(
    sample_na = sample(
      x = c("Yes", "No", NA),
      size = 10000,
      replace = TRUE
    )
  )

# NA 列を省く
Def_na %>% 
  filter(!is.na(sample_na))



#### 行の並べ替え ####
# dplyr package の arrange 関数で行を並べ替え

Def %>% 
  arrange(balance)

Def %>% 
  arrange(balance, income)

Def %>% 
  arrange(desc(balance))

Def %>% 
  arrange(desc(balance), desc(income)) %>% 
  filter(balance == 0)


#### 文字列の処理 ####
# stringr package を用いて文字列を処理する

# sample data 用意

myoji =
  c(
    "鈴木", "木田", "木村", "林田",
    "川村", "森田", "山川", "山田"
  )

name =
  c(
    "一郎", "二郎", "三郎", "四郎",
    "春子", "夏子", "秋子", "冬子"
  )

token =
  c(
    "東京都", "東京都", "神奈川県", "神奈川県",
    "埼玉県", "埼玉県", "千葉県", "千葉県"
  )

shiku =
  c(
    "世田谷区", "大田区", "川崎市", "横浜市",
    "さいたま市", "大宮市", "千葉市", "市川市"
  )

Shozai =
  tibble(myoji, name, token, shiku)


Shozai
str_c(myoji, name, sep = "")
str_c(myoji, "さん", sep = "")
str_c(Shozai$myoji, Shozai$name, sep = "")
str_c(Shozai$myoji, "さん", sep = "")

str_c(
  Shozai$myoji,
  Shozai$name,
  Shozai$token,
  Shozai$shiku,
  sep = " "
)

# str_detect : 特定の文字が含まれるか判定
str_detect(
  string = Shozai$myoji,
  pattern = "木"
)

Shozai$myoji

# str_subset : 特定の文字(pattern) が含まれる値の行を抽出
str_subset(
  Shozai$myoji, pattern = "木"
)

# str_replace : 別の文字に置き換え
str_replace(
  Shozai$token,
  pattern = "都",
  replacement = ""
)

Shozai$token


# 複数 pattern 置き換え
str_replace_all(
  Shozai$token,
  pattern = c("都" = "", "県" = ""),
)


# 文字列の空白を除去(置き換え)
myoji_name =
  str_c(
    Shozai$myoji,
    Shozai$name,
    sep = " "
  )

str_replace(
  myoji_name,
  pattern = " ",
  replacement = ""
)


# はじめと終わりの空白を削除
myoji_name =
  str_c(
    " ",
    Shozai$myoji,
    Shozai$name,
    " ",
    sep = " "
  )
myoji_name

str_trim(
  myoji_name
)


#### 文字列処理 ####
# stringr で文字列を処理しながら dplyr で行・列を操作

# 文字列を追加する
Shozai %>% 
  mutate(
    myoji_names = str_c(myoji, name, sep = " "),
    .after = name
  )

# 空白を除去した列を追加
Shozai %>% 
  mutate(
    myoji_name = str_c(" ", myoji, name, " ", sep = " " ),
    myoji_name_trim = str_trim(myoji_name)
  )

# 特定の文字列を含む行を抽出
Shozai %>% 
  filter(
    str_detect(
      token,
      pattern = "都"
    )
  )

#### 欠損値補完 ####
# 変数の欠損値を補完する tidyr package 関数

# sample data

kigyo = c(
  "一番商事", NA, NA,
  "二番物産", NA, NA,
  "三番商事", NA, NA
)

kigyo

komoku = rep(
  x = c("売上", "費用", "利益"),
  times = 3
  )

komoku

kingaku = c(
  1000, 800, 200,
  1200, 1100, 100,
  900, 850, 50
)

kingaku

# 上記の項目を tibble -> df

Gyoseki =
  tibble(kigyo, komoku, kingaku)

Gyoseki

# NA (欠損値補完) fill : 一つ前の項目で埋められる
fill(
  Gyoseki,
  kigyo
)

Gyoseki %>% 
  fill(kigyo)


# replace_na : list を欠損値を埋める
Gyoseki %>% 
  replace_na(
    replace = list(kigyo = "同上")
  )


#### Data の結合 ####
# ２つの data set に共通の列を key として結合する

# sample data

jugyoin_di = c(1:8)
myoji = c("鈴木", "木田", "木村", "林田", "川村", "森田", "山川", "山田")
nyusya = c(2017, 2019, 2015, 2017, 2014, 2018, 2016, 2020)
bumon_id = c(1, 3, 6, 7, 3, 2, 0, 9)
Jugyoin =
  tibble(jugyoin_di, myoji, nyusya, bumon_id)

Jugyoin

bumon_id = c(1:4)
bumons = c("営業", "経理", "人事", "開発")
jusyo = c("第一ビル", "第二ビル", "第三ビル", "第二ビル")
Bumon =
  tibble(bumon_id, bumons, jusyo)

Bumon


# inner join : 共通するものだけ
inner_join(Jugyoin, Bumon, by = "bumon_id")


# left join : 左にあるものだけ -> NA で補う
left_join(Jugyoin, Bumon, by = "bumon_id")


# right join : 右にあるものだけ -> NA で補う
right_join(Jugyoin, Bumon, by = "bumon_id")


# full join : 全てがっちゃんこ
full_join(Jugyoin, Bumon, by = "bumon_id")


# inner
Jugyoin_Bumon_inner =
  Jugyoin %>% 
  inner_join(Bumon, by = "bumon_id")

Jugyoin_Bumon_inner

