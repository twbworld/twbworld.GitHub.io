---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "golang编译并创建镜像"
subtitle: ""
summary: "最近创建go镜像,因gcc所引发的问题"

# 标签
tags:
- Note

#关键字
keywords:
- golang编译
- golng容器
- gcc
- go-sqlite3

# 文章分类,在列表页显示(暂时使用tags)
categories:

# 自定义url
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
date: 2024-01-12T15:18:13+08:00
# 文章更新时间,可开启 自动使用git时间
# lastmod: 2020-05-03T19:54:10+08:00
# 定时发布时间
# publishDate: 2020-05-03T00:00:00+08:00
# markdown文档
markup: "md"
# 显示"阅读时长"(params.toml也有统一的设置)
reading_time: true
# 底部显示社交链接
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

# Markdown Slides (optional).
#   Associate this talk with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
#slides: example
#links:
#  - icon_pack: fab
#    icon: twitter
#    name: 这里显示外链显示在详情页
#    url: 'https://twitter.com/twbworld'
#  - icon_pack: fab
#    icon: twitter
#    name: 也可以链接pdf文件,对现场讲解很有用
#    url: 'demo.pdf'

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
# 关联项目
projects: []

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Placement options: 1 = Full column width, 2 = Out-set, 3 = Screen-width
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
# 控文章列表页图片,也可以在当前目录下放置featured.jpg/png文件
image:
  placement: 3
  image: "https://cdn.jsdelivr.net/gh/twbworld/hosting@main/img/202401141349701.png"
  caption: "图片来源: [**guoshaohe**](https://www.guoshaohe.com/all-articles/1498)"
  focal_point: "Center"
  preview_only: true
  alt_text: "golang"

# 文章页最头部的图片,如果当前目录下没有featured.jpg/png文件,且,三方image没设置image,则列表页也会显示这图片(image如设置了image,此处无效)
#header:
#  placement: 3
#  image: ""
#  caption: ""
#  focal_point: "Center"
#  preview_only: false
#  alt_text: ""


---

<details>
<summary>Dockerfile</summary>

```dockerfile
FROM golang:alpine AS builder
WORKDIR /app
ENV GO111MODULE=on
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -ldflags "-s -w" -o server .

FROM alpine
WORKDIR /app
COPY --from=builder /app/server /app/server
RUN set -xe && \
    chmod +x server && \
    apk add -U --no-cache tzdata ca-certificates && \
    apk cache clean && \
    rm -rf /var/cache/apk/*
ENTRYPOINT ["./server"]
```
</details>

## 一次报错

#### 最近项目用到了`go-sqlite3`, 导致在`golang:alpine`编译成功且生成镜像, 但镜像启动过程中, 容器内运行go编译文件会报错, 导致镜像无法启动


#### 报错如下 :

> Binary was compiled with 'CGO_ENABLED=0', go-sqlite3 requires cgo to work. This is a stub

### 原因
`go-sqlite3`在golang代码内, 用到`cgo`命令, 所以必须开启`cgo编译开关`,编译时设置`CGO_ENABLED=1`


#### 解决

于是, 把编译命令改成 :

```sh
CGO_ENABLED=1 go build -ldflags "-s -w" -o server .
```

## 二次报错

#### 然而这次在编译阶段就报错了, 镜像生成失败, 报错如下:

> cgo: C compiler "gcc" not found

### 原因
golang使用cgo, 需要 `gcc` 环境; 然而`golang:alpine`镜像为了最小化默认的C库却是 `musl`

#### 解决
> 在`golang:alpine`内安装`gcc`觉得是多此一举了, 干脆改用`golang:latest`镜像, 虽然其镜像大导致生成镜像慢, 但不影响最终生成镜像的大小; 

Dockerfile修改为 :

```dockerfile
FROM golang:latest AS builder
```


## 三次报错

#### 这次跟[一次报错](#一次报错)一样, 生成镜像成功了; 然而镜像启动失败, 报错如下:
> ./server: not found

#### 排查
./server 正是编译后的文件, 明明存在的, 却执行失败
于是使用`docker run --tty=true`的形式进入容器, 执行:

```sh
ldd ./server
```
报错:
> Error relocating server: fcntl64: symbol not found

### 原因

编译后的二进制文件需要依赖`glibc`, 也就是`gcc`环境; 而运行文件的环境是`alpine`而不是基于`golang:latest`, 并没有`gcc`;

很疑惑, 这不是编译成功了嘛? 怎么还需要依赖外部系统环境?

原来golang编译有 `静态编译` 和 `动态编译` 的区别, 默认后者;

前者是把外部依赖的相关程序(如`glibc`)打包进编译文件; 后者需要动态链接到外部环境, 换句话讲, 就是需要特定环境

#### 解决

真相大白, 如果默认golang`动态编译`, 需要`alpine`镜像内安装`gcc`,这也是多此一举了; 因此改用 `静态编译`

于是, 把编译命令改成 :
```sh
CGO_ENABLED=1 go build -ldflags "-s -w --extldflags '-static -fpic'" -o server .
```

## 最终

<details>
<summary>Dockerfile</summary>

```dockerfile
FROM golang:latest AS builder
WORKDIR /app
ENV GO111MODULE=on
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=1 GOOS=linux GOARCH=amd64 go build -ldflags "-s -w --extldflags '-static -fpic'" -o server .

FROM alpine
LABEL org.opencontainers.image.vendor="忐忑"
WORKDIR /app
COPY --from=builder /app/server /app/server
RUN set -xe && \
    chmod +x server && \
    apk add -U --no-cache tzdata ca-certificates && \
    apk cache clean && \
    rm -rf /var/cache/apk/*
ENTRYPOINT ["./server"]
```
</details>
