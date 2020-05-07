---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "这是标题"
subtitle: "这是副标题,详情页显示"
summary: "这是标题的简介,在文章列表页的文章标题下显示(如果为空,将会自动摘取)"

authors: 
- admin

tags: 
- 这是文章的tag
- 在详情页显示

keywords:
- 这是关键字
- 用于SEO,在头部的meta显示

# 文章分类,在列表页显示
categories: 

# 文章添加时间
date: 2020-05-03T19:54:10+08:00

# 文章更新时间,可开启 自动使用git时间
lastmod: 2020-05-03T19:54:10+08:00
# 定时发布时间
publishDate: 2020-05-03T00:00:00+08:00

featured: false

# 草稿开关,开启则文章不会打包
draft: false
# cjk语言,用于兼容特殊的文章,一般没用
isCJKLanguage: true
# markdown文档
markup: "md"
# 文章排序权重
weight: 100
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

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Placement options: 1 = Full column width, 2 = Out-set, 3 = Screen-width
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
# 控制详情页文章开头图片,列表页也会显示这图片,文件路径是当前的目录的featured.jpg/png
image:
  placement: 3
  image: ""
  caption: "图片来源: [**Weibo**](http://weibo.com/u/2646212535)"
  focal_point: "Center"
  preview_only: true
  alt_text: "这是图片的alt属性"

# 文章页最头部的图片,列表页 不会 显示这图片(如设置了image,此处无效)
header:
  placement: 3
  image: "https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200503220558.jpg"
  caption: "图片来源: [**Weibo**](http://weibo.com/u/2646212535)"
  focal_point: "Center"
  preview_only: false
  alt_text: "这是图片的alt属性"

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
# 关联项目
projects: []


links:
  - icon_pack: fab
    icon: twitter
    name: 这里显示外链显示在详情页
    url: 'https://twitter.com/twbworld'
  - icon_pack: fab
    icon: twitter
    name: 也可以链接pdf文件,对现场讲解很有用
    url: 'demo.pdf'



---


:smile:
<i class="fas fa-camera"></i>


- [x] Write math example
- [x] Write diagram example
- [ ] Do something else


![alt 返还](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200503220558.jpg)
