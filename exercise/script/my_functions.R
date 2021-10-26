#### directory 構造作成 function ####

#dir.create("exercise2/01_input")
#dir.create("exercise2/02_code")
#dir.create("exercise2/03_output")
#file.copy(
#  "exercise1/03_output/df_clean.rds",
#  "exercise2/01_input/df_clean.rds"
#)

#### directory 構造構築 ####
make_dir = function(dir_name){
  dir.create(dir_name)
  dir.create(str_c(dir_name, "/01_input"))
  dir.create(str_c(dir_name, "/02_code"))
  dir.create(str_c(dir_name, "/03_output"))
  file.copy(
    "exercise1/03_output/df_clean.rds",
    str_c(dir_name, "/01_input/df_clean.rds")
  ) 
}


#### ヒストグラム作成関数 ####
make_hist = function(df, flag){
  df %>% 
    ggplot(
      aes(x = Runtime, y = ..density..)
    ) +
    geom_histogram() +                               # ヒストグラム
    geom_density() +                                 # 密度曲線
    ggtitle(str_c("evaluate : ", flag)) +
    theme(plot.title = element_text(hjust = 0.5)) +
    xlim(0, 255) +
    ylim(0, 0.045)
}