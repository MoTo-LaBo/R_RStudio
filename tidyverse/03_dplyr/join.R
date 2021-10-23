#### join系 ####

df_name =
  tibble(
    key = c(1, 1, 3, 2, 5),
    name = c("asuka", "yuuki", "siho", "rina", "manaka")
  )

df_group =
  tibble(
    key = 1:4,
    group = c("nogi", "sakura", "hinata", "yosimoto")
  )

# inner_join
inner_join(df_name, df_group)

# left_join
left_join(df_name, df_group)

# right_join
right_join(df_name, df_group)

#full_join
full_join(df_name, df_group)

df_name %>% 
  left_join(df_group)


#### bind系 ####

df_name_1 =
  tibble(
    key = 1:2,
    name = c("asuka", "rina")
  )

df_name_2 = 
  tibble(
    key = 1:3,
    name = c("hinako", "yui", "kyouko")
  )

df_group =
  tibble(
    group = c("nogi", "sakura", "nogi", "sakura", "hinata")
  )

df_name_3 =
bind_rows(df_name_1, df_name_2)

df_name_group =
bind_cols(df_group, df_name_3)

#### group_by  ####

df =
  tibble(
    class = c("a", "b", "c", "c", "a", "c", "b", "a", "c", "b", "a"),
    gender = c("M", "F", "F", "M", "F", "M", "M", "F", "M", "M", "F"),
    height = c(162, 150, 168, 173, 162, 198, 182, 154, 175, 160, 172)
  )

# class の平均
df %>% 
  group_by(class) %>% 
  summarise(
    mean = mean(height)
  )

# classの 男女別の平均身長
df %>% 
  group_by(class, gender) %>% 
  summarise(
    avg = mean(height)
  ) %>% 
  ungroup()


#### 基本統計量 ####
df %>% 
  group_by(class) %>% 
  summarise(
    Max = max(height),
    Q3 = quantile(height, 0.75),
    Mean = mean(height),
    Median = median(height),
    Q1 = quantile(height, 0.25),
    Min = min(height),
    Sd = sd(height),
    N = n()
  )