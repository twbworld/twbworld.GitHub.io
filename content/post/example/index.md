---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "这是标题"
subtitle: "这是副标题,详情页显示"
summary: "这是标题的简介,在文章列表页的文章标题下显示(如果为空,将会自动摘取)"

# 标签
tags: 
- 这是文章的tag
- 在详情页显示

#关键字
keywords:
- 这是关键字
- 用于SEO,在头部的meta显示

# 文章分类,在列表页显示(暂时使用tags)
categories: 

# 自定义url
url: "/example"
# 分类排序权重
tags_weight: 100
# 文章排序权重
weight: 100
# 是否精选文章,显示在首页
featured: true
# 草稿开关,开启则文章不会打包
draft: true
# 是否显示目录
toc: true
# 类型,默认是目录名,所以"post",也可以写"widget_page","dosc"等
type: post
# 文章添加时间
date: 2020-05-03T19:54:10+08:00
# 文章更新时间,可开启 自动使用git时间
# lastmod: 2020-05-03T19:54:10+08:00
# 定时发布时间
# publishDate: 2020-05-03T00:00:00+08:00
# cjk语言,用于兼容特殊的文章,一般没用(config.toml有类似设置"hasCJKLanguage")
isCJKLanguage: true
# markdown文档
markup: "md"
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

# Markdown Slides (optional).
#   Associate this talk with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
slides: example
links:
  - icon_pack: fab
    icon: twitter
    name: 这里显示外链显示在详情页
    url: 'https://twitter.com/twbworld'
  - icon_pack: fab
    icon: twitter
    name: 也可以链接pdf文件,对现场讲解很有用
    url: 'demo.pdf'

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
  image: ""
  caption: "图片来源: [**Weibo**](http://weibo.com/u/2646212535)"
  focal_point: "Center"
  preview_only: true
  alt_text: "这是图片的alt属性"

# 文章页最头部的图片,如果当前目录下没有featured.jpg/png文件,且,三方image没设置image,则列表页也会显示这图片(image如设置了image,此处无效)
header:
  placement: 3
  image: "https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200503220558.jpg"
  caption: "图片来源: [**Weibo**](http://weibo.com/u/2646212535)"
  focal_point: "Center"
  preview_only: false
  alt_text: "这是图片的alt属性"


---








## 1#第一

### 11
### 12


:smile:
<i class="fas fa-camera"></i>


## 2#第二

### 13
### 14
- [x] Write math example
- [x] Write diagram example
- [ ] Do something else



## 3#第三


![alt 返还](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200503220558.jpg)
