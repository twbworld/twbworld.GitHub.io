---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Postman无法抓包Chrome"
subtitle: ""
summary: "Mac在Chrome安装了Interceptor插件, 奈何Postman无法与Interceptor连接,也就无法抓包"

# 标签
tags:
- Network

#关键字
keywords:
- Postman
- Chrome
- 抓包
- Interceptor

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
date: 2021-05-20T23:00:00+08:00
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
  image: "https://cdn.jsdelivr.net/gh/twbworld/hosting@main/img/20210520215326.jpeg"
  caption: "图片来源: [**blog.qualys.com**](https://blog.qualys.com/product-tech/2019/10/07/enhanced-api-scanning-with-postman-support-in-qualys-was)"
  focal_point: "Center"
  preview_only: true
  alt_text: "Postman"


---



## 原因

Mac安装了两个版本(我的是正式版和`Dev`版)的 `Chrome` ,一个正常, 另一个版本无法与 `Postman` 连接, 无法被抓包(Windows不会出现这样的情况)
原因是不正常的版本缺少了一个 `Interceptor` 插件的配置文件, 据官方[文档](https://learning.postman.com/docs/sending-requests/capturing-request-data/interceptor/#how-it-works)所述,文件位于
`/Users/<username>/Library/Application Support/Google/Chrome/NativeMessagingHosts/com.postman.postmanapp.json`

## 解决

也简单,配置文件位于 正式版的 `Chrome` 下, 解决方法就是复制一份到对应的版本的 `Chrome` 的对应目录下
如复制文件到Dev版的 `Chrome`对应目录: `/Users/<username>/Library/Application Support/Google/Chrome Dev/NativeMessagingHosts/com.postman.postmanapp.json`
