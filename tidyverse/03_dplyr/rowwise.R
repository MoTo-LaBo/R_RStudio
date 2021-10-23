#### rowwise ####
# 行処理

diamonds %>% 
  rowwise() %>% 
  mutate(
    Mean = mean(c(x, y, z))
  ) %>% 
  select(x, y, z, Mean)

#### rowwise Nest ####
df =
  tibble(
    class = c("a", "b", "c", "c", "a", "c", "b", "a", "c", "b", "a"),
    gender = c("M", "F", "F", "M", "F", "M", "M", "F", "M", "M", "F"),
    height = c(162, 150, 168, 173, 162, 198, 182, 154, 175, 160, 172)
  )

# nest_by : a class
df %>% 
  nest_by(class) %>% 
  pluck("data", 1)

# nest_by : b class
df %>% 
  nest_by(class) %>% 
  pluck("data", 2)

# nest_by : c class
df %>% 
  nest_by(class) %>% 
  pluck("data", 3)

# group_by : height -> mean
df %>% 
  group_by(class) %>% 
  summarise(
    Mean = mean(height)
  )

# nest_by : height -> mean

df %>% 
  nest_by(class) %>% 
  mutate(
    Mean = 
      mean(data$height)
  )
