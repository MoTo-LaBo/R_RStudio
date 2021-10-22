# R/RStudio 環境構築
### 1. docker pull
    docker pull rocker/tidyverse:4.0.3
### 2. images
    docker images
- rocker/tidyverse があるか確認
### 3. docker run
    docker run -p <portは個人で指定>:8787 -v ~/udemy/R_RStudio:/home/rstudio/r_rstudio -e PASSWORD=<password入力> rocker/tidyverse:4.0.3
### 4. browser へ
    # 入力 Enter
    localhost:port入力

    # Username (default -> rstudio)
    rstudio

    # Password
    上記の run で記述した password
### 5. RStudio IDE が立ち上がる

# Docker image の更新
1. 更新内容を Docker image にする
2. Docker Hub に Repository を作成する
3. 更新した Docker image を作成した repo に push する

### 1. docker 一覧表示
    docker ps -a
- container ID を記録
### 2. docker commit
    # terminal 入力 Enter
    docker commit <container ID> <docker hub account>/r_rstudio
### 3. Docker Hub に repo 作成
1. Docker Hub browser へ移動
2. Create Repository
### 4. repository に push
    docker push <docker hub account>/r_rstudio
- 上記で作成した repo に更新した docker image を push してくれる

## 更新した docker image の再現
    docker run -p <port自由指定>:8787 -v ~/udemy/R_RStudio:/home/rstudio/r_rstudio -e PASSWORD=<password入力> <docker hub account>/r_rstudio
- **8787** は RStudio の port なので変更はしない
### 元のimageは不要なので削除
    docker rmi <REPOSITORY名:TAG名>
- 普通の削除だと　`image has dependent child images`　と error message が出るので上記の command　で削除する

    - ※ (イメージには依存する子イメージがある)

## Global Options の設定
  - **Tools　>　Global Options**　で　RStudioのさまざまな設定を行う
    - 実際にやっておかないと本当に困る項目だけを記述

  - **General**
    - Save workspace to .RData on exit　のチェック外す
    - `「Never」`　とする　>　自動で余計なものが読み込まれなくなる

  - **Code**
    - Savingタブは　`Default text encoding`　を　`UTF-8`

  - **Packages**
    - `CRAN Mirror`　を　`Japan（Tokyo）[https]`　にする

## .Rprofile 作成
    例)
    library(package名)
    library(tidyverse)

- Rprofile を作成する事により一番最初に自動で package を読み込んでくれる














