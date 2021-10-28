#### group 集計 ####
# group 別に集計し, group別の特徴を確認する

# ISLR data Default を使用
library(ISLR)

Def = 
  as_tibble(Default)

Def_g =
Def %>% 
  group_by(default, student)

Def_g

#### grouping ####
# 新たな変数を追加して group化

Def %>% 
  group_by(income)

# 条件分岐により category化した列で group化

Def %>% 
  mutate(
    income_category = if_else(
      income >= 30000, "3万ドル以上", "3万ドル未満"
    )
  ) %>% 
  group_by(income_category)

# case_when を用いた場合
Def %>% 
  mutate(
    income_category = 
      case_when(
        income >= 40000 ~ "4万ドル以上",
        income >= 30000 ~ "3万ドル~4万ドル",
        income >= 20000 ~ "2万ドル~3万ドル",
        TRUE            ~ "~2万ドル"
      )
  ) %>% 
  group_by(income_category)

#### 基本的な group 集計  ####
# summarise : 集計値を格納することが出来る

Def %>% 
  summarise(
    balance_mean = mean(balance),
    balance_median = median(balance),
    balance_max = max(balance),
    balance_min = min(balance),
    balance_var = var(balance),
    balance_sd = sd(balance)
  )


# group化したモノに適用 : group別に集計結果を返してくれる
Def_g =
  Def %>% 
  group_by(default)

Def_g %>% 
  summarise(balance_mean = mean(balance))

# group 別の　count数
Def_g %>% 
  summarise(count = n())


Def_g %>% 
  summarise(
    balance_mean = mean(balance),
    balance_median = median(balance),
    balance_max = max(balance),
    balance_min = min(balance)
  )

Def_g =
  Def %>% 
    group_by(default) %>% 
    summarise(
      count = n(),
      balance_mean = mean(balance),
      income_mean = mean(income)
    )

#### group 集計 ####
Def_dg =
  Def %>% 
  group_by(default)

# across で簡単に集計をまとめることが出来る
Def_dg %>% 
  summarise(
    across(
      .cols = c(balance, income),
      .fns = list(mean = mean, median = median)
    )
  )


# 変数型で指定することができる : 上記と同じ結果になる
Def_dg %>% 
  summarise(
    across(
      .cols = where(is.double),
      .fns = list(mean = mean, median = median)
    )
  )


#### group (順位付け) ####
# rank 関数によって確認
x = c(120, 145, 145, 180)
x
rank(x)
rank(x, ties.method = "average")
rank(x, ties.method = "min")
rank(x, ties.method = "max")
rank(-x, ties.method = "max")

# ISLR : Hitters を使用
Hit =
  as_tibble(Hitters)

# Hit 数が多い順にランク付け
Hit %>% 
  summarise(
    Hits_rank = rank(-Hits, ties.method = "min"),
    Hits
  ) %>% 
  arrange(Hits_rank)         # 昇順 1 ~ 

# リーグとヒット数順位で並べ替え
Hit %>% 
  group_by(League) %>% 
  summarise(
    Hits_rank = rank(-Hits, ties.method = "min"),
    Hits
  ) %>% 
  arrange(League, Hits_rank) %>% 
  filter(Hits_rank <= 3)


#### group 集計(累積和) ####
# summarise -> cumsum : 前から順に累積の和を計算

x = c(1:5) 
x
cumsum(x)

# ホームラン数, 累積和 (多い順 = 降順)
Hit %>% 
  arrange(desc(HmRun)) %>% 
  summarise(HmRun, HmRun_cumsum = cumsum(HmRun))

# 上位何人で全体の % を占めているか?
Hit %>% 
  arrange(desc(HmRun)) %>% 
  summarise(
    rank = rank(-HmRun, ties.method = "min"),
    HmRun,
    HmRun_cumsum = cumsum(HmRun),
    HmRun_cumprob = HmRun_cumsum / sum(HmRun)
  )

# グループ別の累積和を集計 (上位３位まで)
Hit %>% 
  group_by(League) %>% 
  arrange(desc(HmRun)) %>% 
  summarise(
    rank = rank(-HmRun, ties.method = "min"),
    HmRun,
    HmRun_cumsum = cumsum(HmRun),
    HmRun_cumprob = HmRun_cumsum / sum(HmRun)
  ) %>% 
  filter(rank <= 3)


#### 累積の最小値・最大値 ####

# sample data -> ISLR : Smarket (株価data)

SK = 
  as_tibble(Smarket)

SK

x = c(10:13, 9:6)
x

cummax(x)
cummin(x)

SK %>% 
  summarise(
    Today,
    Today_cummin = cummin(Today),
    Today_cummax = cummax(Today)
  )


# grouping 
SK_g =
  SK %>% 
  group_by(Year) %>% 
  summarise(
    Today,
    Today_cummin = cummin(Today),
    Today_cummax = cummax(Today)
  )

SK_g


#### group 集計の graph化 ####
# ggplot -> stat

# default の balance(債務残高)の平均
Def %>% 
  group_by(default) %>% 
  summarise(
    balance_mean = mean(balance)) %>% 
  ggplot(aes(x = default, y = balance_mean)) +
  geom_bar(stat = "identity")

# default の income(収入)の平均
Def %>% 
  group_by(default) %>% 
  summarise(
    income_mean = mean(income)) %>% 
  ggplot(aes(x = default, y = income_mean)) +
  geom_bar(stat = "identity")


# income(収入)の group 別の balance(債務残高)
Def %>% 
  mutate(
    income_category = case_when(
      income >= 40000 ~ "40000$~",
      income >= 30000 ~ "30000~40000$",
      income >= 20000 ~ "20000~30000$",
      TRUE            ~ "~20000$"
    )
  ) %>% 
  group_by(income_category) %>% 
  summarise(balance_mean = mean(balance)) %>% 
  ggplot(aes(x = income_category, y = balance_mean)) +
  geom_bar(
    stat = "identity",
    fill = "steelblue",
    width = 0.6
    )







