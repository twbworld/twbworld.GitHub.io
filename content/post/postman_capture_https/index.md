---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Postman抓包https"
subtitle: ""
summary: "使用Postman抓取iOS的https流量"

# 标签
tags: 
- Network

#关键字
keywords:
- Postman
- Charles
- 证书
- https
- ssl

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
date: 2021-05-20T22:00:00+08:00
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
  image: "https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20210520215326.jpeg"
  caption: "图片来源: [**blog.qualys.com**](https://blog.qualys.com/product-tech/2019/10/07/enhanced-api-scanning-with-postman-support-in-qualys-was)"
  focal_point: "Center"
  preview_only: true
  alt_text: "Postman"


---



## 前言

> 虽然会使用 `Charles`(花瓶) , 但如果 `Postman` 也可以实相同的功能, 少用一个工具, 那谁能不爱呢, 借 `Postman` 强大的发包功能, 就更方便了

> 今天要展示的是, 抓取iOS的https包(Android7以后, 只能获取Root权限才能安装并信任CA证书, 所以就不以Android为例了)

## 安装并信任证书

1. 安装Postman后, 根据[文档](https://learning.postman.com/docs/sending-requests/capturing-request-data/capturing-http-requests/#macos)的指示, Postman的CA证书位于  
Mac: `~/Library/Application Support/Postman/proxy/postman-proxy-ca.crt`  
Windows: `C:\Users<user>\AppData\Roaming\Postman\proxy/postman-proxy-ca.crt`  
![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20210520225920.png)


1. 找到证书后,想办法把证书传到iOS, 并打开, iOS会识别并提示  
打开 `设置=>通用=>描述文件` , 可以看到一个 `已下载` 但未安装的证书, 安装就好  
![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20210520230353.jpeg)  
![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20210520230534.jpeg)

1. 安装完证书,还要让iOS信任该证书  
打开 `设置=>通用=>关于本机=>证书信任设置` 找到对应的Postman证书并开启信任  
![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20210520231655.png)

## 设置代理并抓包

到此,后面的步骤就也就不难了,网上也有不少教程,在此不详解

1. 在Mac或Windows上的Postman开启代理,设置端口
2. iOS与Mac或Windows连接同一个网络(WIFI)
3. 打开iOS的WiFI页, `配置手动代理`, 填写Mac或Windows的IP地址和前一步设置的端口
4. 不出意外, Postman就可以抓取到https的数据包了,位于左侧的 `History` 栏下

官方操作传送门 <https://learning.postman.com/docs/sending-requests/capturing-request-data/capturing-http-requests/#using-postmans-proxy-example>
