#### パイプ処理 ####

# ctrl + shift + M -> %>% 

txhousing

filter(
  select(txhousing, city, year, month, sales),
  sales >= 100
)

txhousing %>%
  select(city, year, month, sales) %>%
  filter(sales >= 100)



filter(
  select(txhousing, city, year, month, sales),
  sales >= 100
)


filter(
  txhousing %>% 
    select(city, year, month, sales),
  sales >= 100
)


txhousing %>% 
  select(city, year, month, sales) %>% 
  filter(sales >= 100)
