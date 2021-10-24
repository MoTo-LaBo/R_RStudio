#### ggplot2 可視化 ####
# ggplot2 : 可視化に特化した package
# 1. キャンパス : 紙を用意
# 2. glaph1     : グラフ 1
# 3. glaph2.    : グラフ 2
# 4. 体裁       : 

# 1. 線形回帰
ggplot(
  data = iris,
  mapping = 
    aes(x = Sepal.Length, y = Petal.Length)
) +
  geom_point() +
  geom_smooth(method = "lm", se =FALSE)

# 信頼区間・予測区間あり
ggplot(
  data = iris,
  mapping = 
    aes(x = Sepal.Length, y = Petal.Length)
) +
  geom_point() +
  geom_smooth()


# 体裁を整える
ggplot(
  data = iris,
  mapping = 
    aes(x = Sepal.Length, y = Petal.Length)
) +
  geom_point() +
  geom_smooth(method = "lm", se =FALSE) +
  theme(
    panel.background = 
      element_rect(fill = "pink", colour = "orange", size = 5),
    axis.text = element_text(size =15),
    axis.title = element_text(size = 15)
  )

#### histogram : ヒストグラム ####
# data frame 定義 NA がある行は削除
df = nycflights13::weather %>% 
  drop_na()

# histogram : default bin = 30個
df %>% 
  ggplot(
    aes(x = humid)
  ) +
  geom_histogram()

# bins を増やす
df %>% 
  ggplot(
    aes(x = humid)
  ) +
  geom_histogram(bins = 100)

# binwidth : 幅を広げる
df %>% 
  ggplot(
    aes(x = humid)
  ) +
  geom_histogram(binwidth = 10)

# 3つの傾向を確認
df %>% 
  distinct(origin)

df %>% 
  ggplot(
    aes(x = humid, fill = origin)
  ) +
  geom_histogram()

# 密度でみる : 各種の確率分布を予想してくれる -> どれくらい出やすいか
df %>% 
  ggplot(
    aes(x = humid, fill = origin)
  ) +
  geom_density(alpha = 0.6)


#### scatter : 散布図 ####
# data frame 定義 NA がある行は削除
df = nycflights13::weather %>% 
  drop_na()
# 系列毎にみる : color = origin
df %>% 
  ggplot(
    aes(x =temp, y = humid, color = origin)
  ) +
  geom_point()

GGally::ggpairs()

df %>% 
  select(temp:wind_dir, origin) %>% 
  ggpairs(aes(color = origin))

#### トレンドグラフ ####
# 株価チャートなど
# data frame 定義 NA がある行は削除
df = nycflights13::weather %>% 
  drop_na()

df %>% 
  select(time_hour, temp) %>% 
  ggplot(
    aes(x = time_hour, y = temp)
  ) +
    geom_line() +
  scale_x_datetime(date_labels = "%Y-%m")
