#### select ####

iris =
  iris %>% as_tibble()

iris %>% 
  select(Sepal.Length, Species)

# columns の index で抽出もできる
iris %>% 
  select(
    1, 5
  )

#### select 便利 function ####

# 直接指定
# Sepal.Length (column), Species (column) を抽出
iris %>% 
  select(Sepal.Length, Species)

# 範囲指定
# Sepal.Length (column) ~ Petal.Width (column) までを抽出
iris %>% 
  select(Sepal.Length : Petal.Width)

# 間接指定
# Sepl.Lenght (column) と Petal.Width (column) を除いて抽出
iris %>% 
  select(-Sepal.Length : -Petal.Width)

# 前方一致 starts_with
# 前方が Sepal の列名を抽出
iris %>% 
  select(
    starts_with("Sepal")
  )

# 後方一致 ends_with
# 後方が Width の列名を抽出
iris %>% 
  select(
    ends_with("Width")
  )

# 部分一致 contains
# l.L が含まれる列名を抽出
iris %>% 
  select(
    contains("l.L")
  )

#正規表現一致 matches
# 前方が Se で en が含まれる列名を抽出
iris %>% 
  select(
    matches("^Se.*en.*")
  )

# 文字列指定 all_of
# Sepal.Length, Petal.Length を文字列で指定
var = c("Sepal.Length", "Petal.Length")
iris %>% 
  select(
    Sepal.Length, Petal.Length
  )

iris %>% 
  select(
    all_of(var)
  )

#  Sepal.Length, Petal.Length を文字列で指定(all_ofを使用しない)
iris %>% 
  select(var)


# 全列指定 : everything
# 下記と組み合わせて使用する
iris %>% 
  select(
    everything()
  )

# Species を一番左にして, それ以外の列も選択
# everithing の正しい使い方
iris %>% 
  select(
    Species, everything()
  )

# data 型指定 where
# dbl型の列を抽出する
iris %>% 
  select(
    where(is.double)
  )
