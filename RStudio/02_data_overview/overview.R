#### data の概観 ####
# sample data -> ISLR package : クレジットカード顧客の責務不履行 data

# ISLR install
install.packages("ISLR")
library(ISLR)

# ISL package の Default data を確認
Default

# default : 債務不履行
# student : 学生
# balance : 債務残高
# income  : 収入

# 最初の10人分だけ
head(Default, 10)

# df -> tibble 形式で格納（変更）
Def =
  as_tibble(Default)

Def

#### 変数: 変化しうる値(df columns) ####
Def

# columns name 確認
colnames(Def)

# dfの構造を返す
str(Def)

# df columns name 変更
colnames(Def) =
  c("d", "s", "b", "i")

Def

# dplyr package の rename() で列名変更
Def =
  rename(
    Def, 
    default = d,
    student = s,
    balance = b,
    income = i
  )

Def

#### 変数の型 ####
num = c(1, 2, 3, 4)
chr = c("A", "B", "C")
fct = as.factor(chr)

# 変数確認(判定)
num
is.numeric(num)

chr
is.character(chr)

fct
is.factor(fct)

#### 変数の型変換 ####

# 変数型を気にせず読み込む : 自動でいい感じの型に変換
test_d =
  read_csv("test_data/testdata.csv")


# 型を指定して読み込む : col_types
# integer   -> i
# dobule    -> d
# charactor -> c
# factor    -> f
# lojical   -> l
# data      -> D

test_d =
  read_csv("test_data/testdata.csv",
           locale = locale(encoding = "UTF-8"),
           col_types = "cccc")                   # 変数指定
test_d

# as.xxx 関数で型変換

# df の指定列を抽出
head(test_d$番号, 10)

test_d$番号 =
  as.integer(test_d$番号)

test_d

#### 行数・列数 ####
Def

# 行数・列数確認
dim(Def)
length(Def$student)

#### 変数の代表値 ####
# mean   : 平均
# median : 中央値
# min    : 最小値
# max    : 最大値
# sum    : 合計
# table  : 集計 (変数の集計, 男:43, 女性: 58 のように)
table(Def$default)

# summary: 各変数の要約(上記のような代表値をまとめて表示)
summary(Def)


#### 変数の散布度 ####
# その変数(列:columns)の散布度(ばらつき度合い)

# var( ) : 不偏分散 = （R では : 標本分散 - 1 したもの）
# sd( )  : 標準偏差 = （分散の平方根をとる）

var(Def$income)
sd(Def$income)

# 不偏分散を手計算
n = length(Def$income)
n
# 平均
m = mean(Def$income)
m

# 不偏分散を計算 : (集計 - 平均) x 2乗 / (集計 - 1) 
var_1 =
  sum((Def$income - m) ^ 2) / (n - 1)
var_1

# var 関数と同じ結果になる
var(Def$income)
