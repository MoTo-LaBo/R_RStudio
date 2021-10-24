#### readr : 入出力処理 ####
# readr : dataの入出力に特化した package

# data -> economics_long を csv に変換
economics_long

#### write_csv ####
# working directory を調べる
getwd()

# working directory に出力 -> utf-8
economics_long %>% 
  write_csv("tidyverse/07_readr/df_economics_long.csv")

# economics_long -> Shift-JIS で encoding して出力
# 日本語が入っている時に有効, Shift-JIS ではないと文字化けになる
economics_long %>% 
  write.csv("tidyverse/07_readr/df_economics_long_sjis.csv",
            fileEncoding = "shift-jis",
            row.names = FALSE)


#### read_csv  ####
# csv の読み込み
read_csv("tidyverse/07_readr/df_economics_long.csv")

# csv 読み込み : 引数col_tyoes で date列を chr 型に変換
# 両者, 同じ出力になる
read_csv("tidyverse/07_readr/df_economics_long.csv", 
         col_types = cols(date = col_character()
                          )
         )

# 上記と同じ 
read_csv("tidyverse/07_readr/df_economics_long.csv", 
         col_types = cols(date = "c"
         )
)

# csv の読み込み : 一番変換しやす！役に立つ
# 引数 col_types で全列を chr 型に変換 -> type_convert で変換

read_csv("tidyverse/07_readr/df_economics_long.csv", 
         col_types = cols(.default = "c")) %>% 
  type_convert()


# 引数localeで encoding -> Shift-JIS にする : 日本語がある場合
read_csv("tidyverse/07_readr/df_economics_long.csv",
         locale = locale(encoding = "shift-jis")) 


#### write_rds, read_rds ####
# RDS出力, 入力 : csv で扱えない data を扱える
economics_long

# 下記のような特殊なものは csv に変換できない
df_economics_long_nest =
economics_long %>% 
  nest_by(variable)

# なので RDS で出力
df_economics_long_nest %>% 
  write_rds("tidyverse/07_readr/df_economics_long_nest.rds")

# 時間がかかる処理の時に RDS を使用する
# 読み込みが終わった所を object にして nest -> 次の開始はそこから読み込むだけ
# RDS 入力
read_rds("tidyverse/07_readr/df_economics_long_nest.rds")
