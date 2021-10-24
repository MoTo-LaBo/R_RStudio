#### stringr : 文字列処理 ####
# stringr : 文字列処理に特化した package

#### 長さの取得 : 各文字数の取得 ####
str_length(c("a", "the", "apple"))

#### str_c : 連結 ####
str_c("nogi", "sakura", "hinata")

# 連結 _ でつなげる
str_c("nogi", "sakura", "hinata", sep = "_")

# 連結 2つの vector の同じ index の要素を繋げる
vec_1 = c("nogi", "sakura", "hinata")
vec_2 = c("mai", "ponpon", "sarina")

str_c(vec_1, vec_2, sep = "-")

# 連結 1つの vector の各要素を繋げて, 1つの文字列にする
str_c(vec_1, collapse = "...")


#### str_sub : 抽出 ####
# 抽出 : 2文字目から5文字目まで
str_sub("qwertyuiop", start = 2, end = 5)

# 後ろ8文字目から後ろ5文字目まで
str_sub("qwertyuiop", start = -8, end = -5)

# 文字列 vector を定義
# マッチの真偽 a が入っているか? : 判定 TRUE or FALSE
vec_group = c("nogi", "sakura", "hinata")
str_detect(vec_group, pattern = "a")

# マッチ文字列の抽出 a が入っている文字列を抽出
str_subset(vec_group, pattern = "a")

vec_group[str_detect(vec_group, pattern = "a")]

# マッチ先頭を抽出 a にマッチした先頭部分を抽出
str_extract(vec_group, pattern = "a")

# マッチ全抽出 a にマッチした全部を抽出
str_extract_all(vec_group, pattern = "a")

# マッチ全抽出 a にマッチした全部を行列形式で抽出
str_extract_all(vec_group, pattern = "a", simplify = TRUE)

# マッチの先頭置き換え a にマッチした先頭部分を - で置き換え
vec_name = c("asuka", "mizuki", "minami")

str_replace(vec_name, pattern = "a", rep = "-")

# マッチ全抽出 a にマッチした全部を - で置き換え
str_replace_all(vec_name, pattern = "a", replacement = "-")

# マッチ全抽出 a を A に, m を M に置き換え
str_replace_all(vec_name, c("a" = "A", "m" = "M"))

# マッチの分割 u にマッチした部分で分割 -> list形式で出力
str_split(vec_name, pattern = "u")

# マッチの分割 u にマッチした部分で分割 -> array形式で出力
str_split(vec_name, pattern = "u", simplify = TRUE)

