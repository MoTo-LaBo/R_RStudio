#### lubridate : 時間処理 ####

# y : year(年)
# m : month(月)
# d : day(日)
# h : hour(時)
# m : minute(分)
# s : second(秒)

# 文字列を date型に変換 これらは全て同じ出力になる
"2020/12/17" %>% class()
"2020/12/17" %>% typeof()

ymd("2020/12/17") %>% class()
ymd("2020/12/17") %>% typeof()
mdy("12-17-2020")
ymd("2020-2-2")
dmy("18-Dec-2020")

# 文字列を datetime型に変換 これらは全て同じ出力になる
ymd_hms("2020/12/17/ 10:04:59")
ymd_hms("2020-10-15 10:29:34")
mdy_hms("12/14/2020 20/32/29")
dmy_hms("18-Dec-2020 10-19-30")


#### make_date,datetime ####
# 要素から時間型を作成
make_date(2020, 12, 17)

make_datetime(2020, 12, 12, 10, 19, 34)

# data frame の定義
df =
tibble(
  year = 2020,
  month = 12,
  day = 1:31,
  hour = 12
)

# df に datetime 列を追加
df %>% 
  mutate(
    ymdhms = make_datetime(year, month, day, hour)
  )


#### as_date, as_datetime  ####
# 時間型の変換

# data型変数を定義
date =
ymd("20200530")

# data型 -> datetime
datetime =
as_datetime(date)

datetime %>% class()

# datetime -> date
as_date(datetime) %>% class()


#### date, yday ####
# 要素を取得
# y : year(年)
# m : month(月)
# d : day(日)
# h : hour(時)
# m : minute(分)
# s : second(秒)

datetime = ymd_hms("2020/5/24/ 23/44/22")

# date : "2020-05-24"
date(datetime)

# year : 2020年
year(datetime)

# day : 24日
day(datetime)

# minute : 44秒
minute(datetime)

# yday : 年初 ~ 何日目か？ : 145日目
yday(datetime)

# wday : 今週何日目か？ : 1日(日曜日から数えて)
wday(datetime)
# lagel = TRUE : 何曜日か？を factor で取得 : Sun
wday(datetime, label = TRUE)

# month(label = TRUE) : 何月か?を factor で取得 : May 5月
month(datetime, label = TRUE)


#### 時間型の丸め処理をする ####
# "2020-05-24 23:44:22 UTC"
datetime 

# minute が残るように切り捨て : "2020-05-24 23:44:00 UTC"
floor_date(datetime, "minute")

# minute が残るように四捨五入 : "2020-05-24 23:44:00 UTC"
round_date(datetime, "minute")

# minute が残るように切り上げ : "2020-05-24 23:45:00 UTC"
ceiling_date(datetime, "minute")

# hour が残るように切り捨て : "2020-05-25 UTC"
ceiling_date(datetime, "hour")

# hour が残るように四捨五入 : "2020-05-25 UTC"
round_date(datetime, 'hour')

#### dseconds, seconds ####
# 時間型の計算

# 128年の duration (デュレーション) : 4039372800s (~128 years)
dyears(128)

# 128年の duration (デュレーション)


# 128年の period (ピリオド) :  "128y 0m 0d 0H 0M 0S"
years(128)

# うるう年である2016年の1年後 : "2017-01-01"
ymd("20160101") + years(1)

# うるう年である2016年の 31557600s (~1 years)後  : "2016-12-31 06:00:00 UTC"
ymd("20160101") + dyears(1)

# 普通の年である2017年の 1年後 : "2018-01-01"
ymd("20170101") + years(1)

# 普通の年である2017年の 31557600s (~1 years)後 :  "2018-01-01 06:00:00 UTC"
ymd("20170101") + dyears(1)

# 1年 = 365日と5h48m46s 太陽の周りを一周している

