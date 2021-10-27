#### Data の用意 ####
# working dircotry の設定
# setwd("設定したいdir path")

# working dir 確認
getwd()

# csv file の読み込み : default -> UTF-8
read_csv("test_data/testdata.csv")

# encoding 確認 : UTF-8
guess_encoding("test_data/testdata.csv")

# locale引数で encoding 指定
read_csv("test_data/testdata.csv",
         locale = locale(encoding = "UTF-8"))

# shift_JIS : 文字化けになってしまう
read_csv("test_data/testdata.csv",
         locale = locale(encoding = "Shift-JIS"))

#### data の格納 ####
# R では <- で代入, dataを object に格納
test_d <-
read_csv("test_data/testdata.csv",
         locale = locale(encoding = "UTF-8"))

test_d

#### Execl file の読み込み ####
# 呼び出し
library(readxl)

test_d_ex =
  read_excel("test_data/testdata.xlsx")

test_d_ex

# sheet の番号, 名前を指定できる
test_d_ex =
  read_excel("test_data/testdata.xlsx",
             sheet = 1)

#### sample data 生成 ####
sample =
  sample(x = c("Yes", "No"), size = 10, replace = TRUE)

sample

# prob = 重みづけ : Yes, No を選ぶ確率の比率を指定
sample_1 =
  sample(x = c("Yes", "No"), size = 10, replace = TRUE, prob = c(0.2, 0.8))

sample_1


#### 正規分布 data 生成 ####

normal =
  rnorm(100, 167, 6)

normal =
  rnorm(n = 100, mean = 167, st = 6)

normal

# 最初の10人分だけ
head(normal,10)


#### csv file 書き出し ####
height_data =
  rnorm(100, 167, 5)

SHINCHO =
  rnorm(100, 167, 5)

# df に変換
SHINCHO =
  tibble(SHINCHO)

SHINCHO

height =
height_data %>% 
  tibble %>% 
  mutate(
    身長 = height_data
  ) %>% 
  select("身長")
  
height

# data 格納
write_csv(height,
          "test_data/height.csv")

