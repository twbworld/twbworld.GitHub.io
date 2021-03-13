---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "GitHub Actions无法触发"
subtitle: ""
summary: "刚刚接触GitHub Actions实现CI/CD, 遇到了一个yml文件触发失败的问题"

# 标签
tags: 
- Github

#关键字
keywords:
- github-actions
- CI/CD
- pull_request
- github

# 文章分类,在列表页显示(暂时使用tags)
categories: 

# 自定义url,如果为空则按配置选项"permalinks"
url: ""
# 文章排序权重
weight: 100
# 是否精选文章,显示在首页
featured: false
# 草稿开关,开启则文章不会打包
draft: false
# 是否显示目录
toc: true
# 类型,默认是目录名,所以"post",也可以写"widget_page","dosc"等
type: post
# 文章添加时间
date: 2021-01-23T19:00:00+08:00
# 文章更新时间,可开启 自动使用git时间
# lastmod: 2020-05-03T19:54:10+08:00
# 定时发布时间
# publishDate: 2020-05-03T00:00:00+08:00
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

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Placement options: 1 = Full column width, 2 = Out-set, 3 = Screen-width
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
# 控文章列表页图片,也可以在当前目录下放置featured.jpg/png文件
image:
  placement: 3
  image: "https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20210123192853.jpg"
  caption: "图片来源: [**devato.com**](https://devato.com/post/github-actions-for-phoenix)"
  focal_point: "Center"
  preview_only: true
  alt_text: "github-actions"


---








## 问题

> 刚刚接触github actions实现CI/CD, 遇到了一个yml文件触发失败的问题

yml文件配置如下 :
``` yml
name: ci-test
on:
    pull_request:
        branches:
          - dev
jobs:
  ssh-login:
    runs-on: ubuntu-latest
    steps:

      - uses: appleboy/ssh-action@master
        with:
          host: ${{ secrets.HOST }}
          username: ${{ secrets.USERNAME }}
          key: ${{ secrets.KEY }}
          port: ${{ secrets.PORT }}
          script: |
            ls ./
```
当使用 `git pull` 时, 却没有触发该yml文件(在github项目的Actions的选项卡下不存在任务)  
但是,当把触发条件 `pull_request` 改成 `push` , 再push到Github 却意外的成功了触发了Actions

## 解决

最后多次尝试,才发现问题 :

***`pull_request` 触发条件只能在默认分支上使用, 也就是说我的配置项 `branches` 下的 `dev` 不是项目的默认分支, 所以触发Actions失败, 除此之外还有 `workflow_run` | `issue`***

> 都怪没认真看[文档](https://docs.github.com/cn/actions/reference/events-that-trigger-workflows)

另外再做个笔记 :  
如果 `workflows` 目录下有多个yml, GitHub-Actions默认是并行触发的, 如果想实现按顺序触发, 请使用 [`workflow_run`](https://docs.github.com/cn/actions/reference/events-that-trigger-workflows#workflow_run)

> GitHub-Actions 真香 !
