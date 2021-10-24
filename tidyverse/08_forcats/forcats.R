#### forcats : ファクター処理####
# 水準の変更・修正
# data frame 定義
df =
  tibble(
    name =
      c("nanami", "rina", "kumi", "mizu", "rika", "hiyori", "yuna", "hina", "risa", "yui", "hikaru", "karin") %>% factor(),
    group =
      c("nogi", "sakura", "hinata", "sakura", "sakura", "hinata", "nogi", "hinata", "sakura", "sakura", "sakura", "sakura") %>% factor(),
    age =
      c(27, 23, 24, 23, 25, 18, 17, 19, 22, 21, 19, 19)
  )

# アルファベット順 a, b, c, ... の若い順になっている
df$name

df$group

# fct_inorder : 出現順にする
df$group %>% 
  fct_inorder()

# fct_infreq : 度数順にする : 出現回数が多い順
df$group %>% 
  fct_infreq()

df %>% 
  group_by(group) %>% 
  count()

# fct_rev : 逆順にする
df$group %>% 
  fct_rev()

# fct_shift : 左に2, シフトする
df$group %>% 
  fct_shift(n = 2)

# fct_shift : 右に1, シフトする
df$group %>% 
  fct_shift(n = -1)

# fct_relevel: 水準を手動で指定する
df$group %>% 
  fct_relevel("nogi", "hinata", "sakura")

# fct_relevel: 水準を手動で指定する : 途中まででもok
df$group %>% 
  fct_relevel("nogi")

# fct_reorder: 水準を age の順番にする(age列の昇順)
df$name %>% 
  fct_reorder(df$age)

df %>% 
  arrange(age)

# x:name , y:age の散布図
df %>% 
  ggplot(aes(x = name, y = age)) +
  geom_point()

# x:name , y:age の散布図 -> 水準を age 順番に変更
df %>% 
  ggplot(aes(x = fct_reorder(name, age), y = age)) +
  geom_point()

#### 水準の値を変更する ####

# fct_recode : 水準の値を大文字に変更する
df$group %>% 
  fct_recode(
    "NOGI" = "nogi",
    "SAKURA" = "sakura",
    "HINATA" = "hinata"
  )

# fct_collapse : 別々の水準 (sukura, hinata) を1つ水準(keyaki)にまとめる
df$group %>% 
  fct_collapse(
    keyaki = c("sakura", "hinata")
  )

# groupの度数
df %>% 
  count(group)

# fct_lump : 度数の少ない水準 (nogi, hinata) を
# 1つの水準 (noginata) にまとめる
df$group %>% 
  fct_lump(other_level = "noginata")
