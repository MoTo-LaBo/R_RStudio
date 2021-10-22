#### logical vector ####

# x : 1 ~ 10 vector
x = 1:10

# y : vector
y = c(1, 3, 6, 5, 9)

# x と y は等しいか?
x == y

# x と y　は等しくないか? : 上記の逆
x != y

# x は y 以上か?
x >= y

# x は y より小さいか?
x < y

# x は yの vector の中にありますか?
x %in% y

#### logical vector 計算 ####

# キャベツのsize vecotr 定義

size_vec =
  c(7, 13, 5, 25, 38, 57, 18, 9, 32, 28)

# size 10 <= vec

lgl_vec_1 =
size_vec >= 10

# size 30 >= vec

lgl_vec_2 =
size_vec <= 30

# AND

lgl_vec_1 & lgl_vec_2

# OR

lgl_vec_1 | lgl_vec_2

# XOR : 排他的論理和

xor(lgl_vec_1, lgl_vec_2)

# NOT : vector TRUE or FALSE の反転 
!lgl_vec_1

# any : 1つ以上が TRUE であれば TRUE
any(lgl_vec_1)

# all : 全部 TRUE または FALSE
all(lgl_vec_1)



