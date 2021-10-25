#### basic ####
1 + 2
2 * 3
4 / 2
a <- 5
a
変数 <- 10

b <- 4
c <- 10
d <- 20

b + c
c + d

#### function / array / vector ####
# vector
x <- c(10, 20, 30, 40, 50)

x[1]
x[4]

# 行列
y <- matrix(1:12, 3, 4)
y
# 行, 列
y[1, 2]

# 列だけ
y[, 3]

# 行だけ
y[2,]

# x vector の平均値
x
mean(x)

# y の行列 -> 3列目の平均
y[,3]
mean(y[,3])

#### glaph ####

x <-rnorm(100, mean = 0, sd = 1)
x

plot(x)
hist(x)
