---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "使用Github Actions发布docker镜像到仓库"
subtitle: "Docker Hub / ghcr.io / docker.pkg.github.com"
summary: "使用GitHub Actions实现对docker包的自动化构建及发布"

# 标签
tags:
- Github

#关键字
keywords:
- Docker Hub
- ghcr.io
- docker.pkg.github.com
- github Packages

# 文章分类,在列表页显示(暂时使用tags)
categories:

# 自定义url,如果为空则按配置选项"permalinks"
url: ""
# 文章排序权重
weight: 100
# 是否精选文章,显示在首页
featured: true
# 草稿开关,开启则文章不会打包
draft: false
# 是否显示目录
toc: true
# 类型,默认是目录名,所以"post",也可以写"widget_page","dosc"等
type: post
# 文章添加时间
date: 2021-03-13T14:00:00+08:00
# 文章更新时间,可开启 自动使用git时间
# lastmod: 2020-05-03T19:54:10+08:00
# 定时发布时间
# publishDate: 2020-05-03T00:00:00+08:00
# 显示"阅读时长"(params.toml也有统一的设置)
reading_time: true
# 底部显示社交链接(params.toml总开关post_share)
share: true
# 底部显示作者资料
profile: false
# 是否允许评论(总开关在params.toml,comments=>engine)
commentable: true
# 是否允许编辑(跳到github,前提是github有权限)
editable: false
# 作者
authors:
- admin

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Placement options: 1 = Full column width, 2 = Out-set, 3 = Screen-width
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
# 控文章列表页图片,也可以在当前目录下放置featured.jpg/png文件
image:
  placement: 3
  image: "https://cdn.jsdelivr.net/gh/twbworld/hosting@main/img/20210313140218.png"
  caption: "图片来源: [**medium.com**](https://andersro93.medium.com/using-github-actions-with-docker-9ba1cc481ae1)"
  focal_point: "Center"
  preview_only: true
  alt_text: "github-actions"


---




**!!!现在官方已出教程了, 请到[github-action官网](https://docs.github.com/zh/actions/publishing-packages/publishing-docker-images)学习; 此过期文章只作为参考!!!**


## 前文

关于发布Docker镜像到仓库, 思路有不少, 比如:
1. 本地生成Docker镜像后, 使用 `docker login` 登录, 然后再 `docker push` 发布到仓库(Docker Hub等)
2. Docker仓库平台(Docker Hub等) 关联 `Github项目` , `git push` 后, 仓库平台会获取 `Github项目` 下的 `Dockerfile` 等相关文件, 自动构建Docker镜像

本文要讲的是第3种思路, 利用 `Github Actions` 自动化构建和发布, 与 `Github` 更高度的结合

## 仓库平台区别
`Docker Hub` 再熟悉不过, 它是Docker的官方平台, 不作多介绍

对于 `Github` 下却有两个发布Docker镜像的平台, `ghcr.io` 和 `docker.pkg.github.com`

#### 区别1
前者发布的镜像在 `用户` 之下, 地址格式 : `https://ghcr.io/[用户名]/[镜像名]`

后者发布的镜像在 `项目` 之下, 地址格式 : `https://docker.pkg.github.com/[用户名]/[项目名]/[镜像名]`

#### 区别2
前者下的镜像可选择公开, 任何人都可 `docker pull`

后者却只能用户授权才能 `docker pull`

***本文重点讲如何发布到 `ghcr.io`***

## 发布到ghcr.io

### 步骤一
想要在 `GitHub` 使用 `ghcr.io` , 首先要 [启用改进的容器支持](https://docs.github.com/cn/packages/guides/enabling-improved-container-support)

### 步骤二(可选)
添加一些机密数据到您的GitHub项目 `secrets`(或Variables) 下 ; 找到项目下 `Setting > secrets` , 右上角点击 `New repository secret` , 如图
![](https://cdn.jsdelivr.net/gh/twbworld/hosting@main/img/20210313153743.png)

用于下一步编写的文件,使用 `${{ secrets.xxx }}` 或 `${{ vars.xxx }}`

### 步骤三
如何使用 `GitHub-Actions` 在此不过多简释, 直接贴出代码 :
``` yml
name: ci
on:
  workflow_dispatch: #github页面手动触发
  push:
    tags:
      - "v*.*"
env:
  IMAGE_NAME: test #这是您的镜像名
jobs:
  get-tags:
    runs-on: ubuntu-latest
    env:
      TZ: Asia/Shanghai
    outputs:
      tags: ${{ steps.output-id.outputs.v }}
    steps:
      - uses: actions/checkout@v3
      - id: output-id
        run: |
          VERSION=edge
          if [[ $GITHUB_REF == refs/tags/* ]]; then
            VERSION=${GITHUB_REF#refs/tags/v}
          fi
          echo "v=${VERSION}" >> $GITHUB_OUTPUT
  push-ghcr:
    runs-on: ubuntu-latest
    env:
      TZ: Asia/Shanghai
      REGISTRY: ghcr.io
    steps:
      - uses: actions/checkout@v3
      - name: Login
        uses: docker/login-action@v1
        with:
          registry: ${{ env.REGISTRY }}
          username: ${{ github.repository_owner }}
          password: ${{ secrets.GITHUB_TOKEN }} #此值是github专为Action提供的,这就是上一步没有手动添加的原因
      - name: Build && Push
        uses: docker/build-push-action@v2
        with:
          context: .
          file: ./Dockerfile
          push: true
          tags: |
            ${{ env.REGISTRY }}/${{ github.repository_owner }}/${{ env.IMAGE_NAME }}:${{ needs.get-tags.outputs.tags }}
            ${{ env.REGISTRY }}/${{ github.repository_owner }}/${{ env.IMAGE_NAME }}:latest
```
> [借鉴代码](https://github.com/metcalfc/docker-action-examples/blob/main/.github/workflows/release.yml)

如图, `GitHub-Actions` 运行成功后, 在用户首页下的 `Packages` 模块下, 新增了一个 `Packages`
![](https://cdn.jsdelivr.net/gh/twbworld/hosting@main/img/20210313162701.png)
但是, 可看到 `Private` 标签, 也就是说, 这个Docker镜像默认不公开的 ; 如需要公开, 请往下看

### 步骤四

公开 `Packages` 下的Docker镜像 ; 进入需要公开的镜像后, 点击右上角 `Package Settings` , 进入配置页面
![](https://cdn.jsdelivr.net/gh/twbworld/hosting@main/img/20210313163101.png)
拉到低, 点击 `Change visibility` , 就可设置为公开 ;
在任何地方, 都可以下载镜像: `docker pull ghcr.io/[用户名]/[镜像名]:[标签]`
![](https://cdn.jsdelivr.net/gh/twbworld/hosting@main/img/20210313163237.png)

### 步骤五
虽然这个镜像是通过您的GitHub项目发布的, 但默认是不会关联到对应GitHub项目的 ;
在上文 [仓库平台区别](#仓库平台区别) 已经知道, `ghcr.io` 下的镜像是对应账号, 而不是 `项目` 的 ;
如果需要将该镜像关联到对应项目, 也很简单 :
如图 , 进入该镜像的页面, 在页面下就可以看到 `Connect Repository` 按钮, 点击关联对应的项目 ; 项目下的 `README.md` 也会加载进来
![](https://cdn.jsdelivr.net/gh/twbworld/hosting@main/img/20210313164825.png)

来到对应的GitHub项目下, 也可以看到关联的Docker镜像, 如图 :
![](https://cdn.jsdelivr.net/gh/twbworld/hosting@main/img/20210313165559.png)


## 发布到其他仓库
给出全部代码, 同时发布到 `Docker Hub` / `ghcr.io` / `docker.pkg.github.com`

``` yml
name: ci
on:
  workflow_dispatch: #github页面手动触发
  push:
    tags:
      - "v*.*"
env:
  IMAGE_NAME: test #这是您的镜像名
jobs:
  get-tags:
    runs-on: ubuntu-latest
    env:
      TZ: Asia/Shanghai
    outputs:
      tags: ${{ steps.output-id.outputs.v }}
    steps:
      - uses: actions/checkout@v3
      - id: output-id
        run: |
          VERSION=edge
          if [[ $GITHUB_REF == refs/tags/* ]]; then
            VERSION=${GITHUB_REF#refs/tags/v}
          fi
          echo "v=${VERSION}" >> $GITHUB_OUTPUT
  push-ghcr:
    needs: get-tags
    runs-on: ubuntu-latest
    env:
      TZ: Asia/Shanghai
      REGISTRY: ghcr.io
    steps:
      - uses: actions/checkout@v3
      - name: Login
        uses: docker/login-action@v1
        with:
          registry: ${{ env.REGISTRY }}
          username: ${{ github.repository_owner }}
          password: ${{ secrets.GITHUB_TOKEN }}
      - name: Build && Push
        uses: docker/build-push-action@v2
        with:
          context: .
          file: ./Dockerfile
          push: true
          tags: |
            ${{ env.REGISTRY }}/${{ github.repository_owner }}/${{ env.IMAGE_NAME }}:${{ needs.get-tags.outputs.tags }}
            ${{ env.REGISTRY }}/${{ github.repository_owner }}/${{ env.IMAGE_NAME }}:latest
  push-docker-hub:
    needs: get-tags
    runs-on: ubuntu-latest
    env:
      TZ: Asia/Shanghai
    steps:
      - uses: actions/checkout@v3
      - name: Login
        uses: docker/login-action@v1
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
      - name: Build && Push
        uses: docker/build-push-action@v2
        with:
          context: .
          file: ./Dockerfile
          push: true
          tags: |
            ${{ secrets.DOCKERHUB_USERNAME }}/${{ env.IMAGE_NAME }}:${{ needs.get-tags.outputs.tags }}
            ${{ secrets.DOCKERHUB_USERNAME }}/${{ env.IMAGE_NAME }}:latest
  push-docker-pkg-github:
    needs: get-tags
    runs-on: ubuntu-latest
    env:
      REGISTRY: docker.pkg.github.com
      TZ: Asia/Shanghai
    steps:
      - uses: actions/checkout@v3
      - name: Login
        uses: docker/login-action@v1
        with:
          registry: ${{ env.REGISTRY }}
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}
      - name: Build && Push
        uses: docker/build-push-action@v2
        with:
          context: .
          file: ./Dockerfile
          push: true
          tags: |
            ${{ env.REGISTRY }}/${{ github.repository }}/${{ env.IMAGE_NAME }}:${{ needs.get-tags.outputs.tags }}
            ${{ env.REGISTRY }}/${{ github.repository }}/${{ env.IMAGE_NAME }}:latest
      - name: Delete Package
        uses: actions/delete-package-versions@v1
        with:
          package-name: ${{ env.IMAGE_NAME }}
          num-old-versions-to-delete: 1 #删除最旧的一个包

```


> GitHub-Actions 真香 !
