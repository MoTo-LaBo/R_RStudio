#### vector ####
# 同じdata type を一まとめにしたモノ
# c(data type) -> vector

# vector int type
c(1, 5, 8, 13, 4)

# vector char type
c("a", "b", "c", "PYTHON", "R")

# vector logical
c(TRUE, TRUE, FALSE, FALSE)

#### vector 四則演算 ####

int_a = c(1, 4, 5, 8, 9)
int_b = c(5, 0, 8, 6, 7)

int_a + int_b

# charactor では演算はできない
chr_a = c("a", "b", "c", "b")
chr_b = c("1", "2", "3", "4")

chr_a + chr_b


# logical : TRUE = 1, FALSE = 0
lgl_a = c(TRUE, TRUE, FALSE, TRUE)
lgl_b = c(FALSE, FALSE, TRUE, FALSE)

lgl_a + lgl_b

#### vector リサイクル ####
# vector の length(長さ)を自動調整(補完)して演算

# 上手くおさまる場合
c(1, 5, 8, 3) + c(2, 3)

# おさまらない場合
c(1, 5, 8, 13) + c(2, 3, 9)


#### vector 要素抽出 ####
# 1 index 指定
# 2 name 指定
# 3 logical 指定

# R は index 1~ なので注意
vec = c(1, 5, 8, 13, 4)
vec[3]

# 複数指定
vec[c(2, 4)]

# -(マイナス)をつけると抽出されない
vec[-1]


# name vector
vec = c("one" = 1, "two" =  5, "three" =  8, "four" = 13, "five" = 4)

# 1, 3
vec[c(1, 3)]

# name
vec["one"]

vec[c("one", "three")]

# logical vector
# TRUE が抽出される
vec =c(1, 5, 8, 13, 4)
vec[c(TRUE, FALSE, TRUE, TRUE, FALSE)]

# vector が 5以上を抽出
vec >= 5

vec[vec >= 5]


#### 便利 function ####

# sum : 総和
sum(vec)

# mean : 平均
mean(vec)

# median : 中央値
median(vec)

# max : 最大値
max(vec)

# min : 最小値
min(vec)

# quantile : %
quantile(vec)

# var : 分散(不偏分散)
var(vec)

# sd : 標準偏差(不偏分散のsqrt)
sd(vec)


# logical : 凄くよく使用する
lgl_vec = c(TRUE, TRUE, FALSE, FALSE, TRUE)

sum(lgl_vec)

mean(lgl_vec)


#### 規則的な vector ####

# 1 ~ 10 まで等差が 1 の等差 vector

1:10

# 1.5 ~ 10.1 までの長さが 8 の等差 vector

seq(1.5, 10.1, length= 8)

# 1.5 ~ 10.1 までの長さが 2.5 の等差 vector
# おさまりきらない数値はカットされる
seq(1.5, 10.1, by = 2.5)

# c("red", "blue", "black") を 3回繰り返す vector
vec_color = c("red", "blue", "black")

rep(vec_color, times = 3)

# c("red", "blue", "black") を長さ 10 になるまで繰り返す vector

rep(vec_color, length = 10)

# c("red", "blue", "black") の要素毎に 3回繰り返す vector

rep(vec_color, each = 3)

