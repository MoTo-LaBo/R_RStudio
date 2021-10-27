#### graph  ####
# グラフ化の論点は「変数タイプ」と「軸」と「グループ」

# ISLR install
library(ISLR)

# ISL package の Default data を確認
Default

# default : 債務不履行
# student : 学生
# balance : 債務残高
# income  : 収入

# tibble 形式に変換
Def =
  as_tibble(Default)

Def

#### ggplot2 ####

#### 棒グラフ<bar> ####
# 離散変数の値(カテゴリ)別の count 数を可視化する
# x: 連続変数 Y: count数

# 離散(category)変数の count数を棒グラフで可視化
# default : 債務不履行に陥ったか?否か
ggplot(
  Def, aes(x = default)
  ) +
  geom_bar() +
  theme_grey(base_size = 15)            # 文字の基本サイズ調整


# 棒グラフの調整
ggplot(
  Def, aes(x = default)
) +
  geom_bar(
    width = 0.5,                        # グラフの幅
    fill = "steelblue"                  # 色
  ) +
  theme_grey(base_size = 15)            # 文字の基本サイズ調整



#### ヒストグラム <histogram> ####
# 連続変数の値別 count数を確認する
# X : balance, Y : count数

# 連続変数の count数を histogram で可視化
# balance : 債務残高
ggplot(
  Def, aes(x = balance)
  ) +
  geom_histogram() +
  theme_grey(base_size = 15)

# histogram 調整
ggplot(
  Def, aes(x = balance)
) +
  geom_histogram(
    bins = 50,                        # 棒の数, default: 30
    fill = "steelblue",               # 色
    color = "black"                   # 棒の枠色
  ) +
  theme_grey(base_size = 15)

# 棒の幅で指定
ggplot(
  Def, aes(x = balance)
) +
  geom_histogram(
    binwidth = 100,                   # 棒の幅
    fill = "steelblue",               # 色
    color = "black"                   # 棒の枠色
  ) +
  theme_grey(base_size = 15)

#### 散布図 1 <scatter> ####
# ２つの連続変数の分布を同時に確認する
# X : income(収入), Y : balance(債務残高)
ggplot(
  Def,
  aes(x = income, y = balance)) +
  geom_point(colour = "steelblue", size = 0.6)   # 点の大きさ


# 回帰直線を加えることが出来る, graph の調整
ggplot(
  Def,
  aes(x = income, y = balance)) +
  geom_point(colour = "steelblue", size = 0.6, alpha = 0.6) +     # 点の大きさ
  geom_smooth(colour = "blue", method = "lm")     # 線形近似線(lm : linear model)


#### 散布図 2 <scatter> ####
# 連続変数と離散変数の分布を同時に確認する
# X : balance(債務残高), Y : default(債務不履行)

# y軸が離散的な値を取るので, 重なってしまう
ggplot(
  Def,
  aes(x = balance, y = default)) +
  geom_point(colour = "steelblue", size = 0.5)

# 撒布図の描画方法の調整 : jitter でずらして表示
ggplot(
  Def,
  aes(x = balance, y = default)) +
  geom_point(colour = "steelblue", size = 0.5,
             position = position_jitter()) # position : 配置指定, jitter : ランダム配置

# jitter の幅を調整
ggplot(
  Def,
  aes(x = balance, y = default)) +
  geom_point(colour = "steelblue", size = 0.5,
             position = position_jitter(height = 0.3)) # position : 配置指定
                                                       # jitter : ランダム配置
                                                       # height : 高さ

#### 箱ひげ図 <boxplot> ####
# 離散変数の値別に連続変数の分布を確認する
# X : default(債務不履行), Y : balance(債務残高)

ggplot(
  Def,
  aes(x = default, y = balance)) +
  geom_boxplot()

# 色を変更 
ggplot(
  Def,
  aes(x = default, y = balance)) +
  geom_boxplot(fill = "steelblue")


#### 棒グラフ (grouping) ####
# grouping なし
ggplot(
  Def,
  aes(x = default)) +
  geom_bar(
    width = 0.9,
    fill = "steelblue"
  )


# X : default, Y : count数 -> student で grouping
ggplot(
  Def,
  aes(x = default, fill = student)) +
  geom_bar(width = 0.9)

# 横配置に変更
ggplot(
  Def,
  aes(x = default, fill = student)) +
  geom_bar(
    width = 0.9,
    position = position_dodge()
    )   # position : 配置指定
        # dodge : 横に配置

# dodge は略記も可能
ggplot(
  Def,
  aes(x = default, fill = student)) +
  geom_bar(
    width = 0.9,
    position = "dodge")


#### histogram (grouping) ####
# 別の category 変数で grouping して histogram を確認
# X : balance(債務残高), Y : count数 -> default で grouping

# grouping なし
hist =
ggplot(
  Def,
  aes(x = balance)) +
  geom_histogram(
    bins = 50,
    colour = "black",
    fill = "steelblue"
  )

# default で grouping -> default で塗り分け
ggplot(
  Def,
  aes(x = balance, fill = default)) +
  geom_histogram(
    bins = 50,
    colour = "black"
  )

# 積み上げずに重ねて表示する
g_hist =
ggplot(
  Def,
  aes(x = balance, fill = default)) +
  geom_histogram(
    bins = 50,
    colour = "black",
    position = position_identity(),     # identity : 配置調整なし(独立表示)
    alpha = 0.6
  )


#### 散布図 (grouping) ####
# 別の category 変数で grouping して 散布図を確認
# X : income(収入), Y : balance(債務残高) -> default で grouping

# grouping なし
scatter =
  ggplot(
    Def,
    aes(x = income, y = balance)) +
    geom_point(colour = "steelblue", size = 0.5, alpha = 0.5) +
    geom_smooth(method = "lm")

# default で grouping
g_scatter =
  ggplot(
    Def,
    aes(x = income, y = balance, colour = default)) +
    geom_point(size = 0.5, alpha = 0.2) +
    geom_smooth(method = "lm")


#### 箱ひげ図 (grouping) ####
# 別の離散変数で grouping して箱ひげ図を確認する
# X : default(債務不履行), Y : balance(債務残高) -> sudent で grouping

# grouping なし
box_plot =
  ggplot(
    Def,
    aes(x = default, y = balance)) +
    geom_boxplot(fill = "steelblue")

# student (学生) で grouping ->　色分け
g_box_plot =
  ggplot(
    Def,
    aes(x = default, y = balance, fill = student)) +
    geom_boxplot()


#### graph の保存  ####
getwd()

ggsave(
  plot = hist,
  filename = "02_data_overview/hist.png",
  height = 5,
  width = 7,
  units = "cm"
)

ggsave(
  plot = g_hist,
  filename = "02_data_overview/hist_g.png",
  height = 5,
  width = 10,
  units = "cm"
)

ggsave(
  plot = scatter,
  filename = "02_data_overview/scatter.png",
  height = 5,
  width = 7,
  units = "cm"
)

ggsave(
  plot = g_scatter,
  filename = "02_data_overview/scatter_g.png",
  height = 6,
  width = 10,
  units = "cm"
)

ggsave(
  plot = box_plot,
  filename = "02_data_overview/box_plot.png",
  height = 5,
  width = 7,
  units = "cm"
)

ggsave(
  plot = g_box_plot,
  filename = "02_data_overview/box_plot_g.png",
  height = 5,
  width = 10,
  units = "cm"
)
