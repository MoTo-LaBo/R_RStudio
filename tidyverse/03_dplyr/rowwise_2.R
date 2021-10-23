#### rowwise 応用 ####
# 1. 散布図を作成する関数を設定
# 2. 1. で作成した関数をし使用し, グラフを作成
# 3. 単回帰モデルを作成

make_fig = 
  function(df, class){
    fig = 
      df %>% 
      ggplot(aes(x = carat, y = price)) +
      geom_point(color = "orange") +
      labs(title = class) +
      theme(
        axis.text = element_text(size = 15),
        axis.title = element_text(size = 15),
        plot.title = element_text(hjust = 0.5)
      )
    
    return(fig)
  }

# 1. data frame 作成 diamonds -> nest -> functionを追加
diamonds_1 =
diamonds %>% 
  nest_by(cut) %>% 
  mutate(
    func = list(make_fig)
  )


# 2. 1. で作成した関数をし使用し, グラフを作成
diamonds_2 =
diamonds_1 %>% 
  mutate(
    fig = 
      list(
        func(df = data, class = cut)
        )
  )

# patchwork : package 
# {patchwork} -> fig (グラフ)を複数描画をしてくれる

diamonds_2 %>% 
  pull(fig) %>% 
  wrap_plots()


# 3. 単回帰モデルを作成
diamonds_3 = 
diamonds_2 %>% 
  mutate(
    model = 
      list(
        lm(
          formula = price ~ carat,
          data = data
        )
      )
  )
