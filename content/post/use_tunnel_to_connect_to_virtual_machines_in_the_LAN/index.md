---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "SSH隧道连接局域网下的虚拟机"
subtitle: ""
summary: "使用SSH隧道技术,连接局域网下的VMware linux虚拟机"

# 标签
tags: 
- Tunnel

#关键字
keywords:
- 隧道
- SSH
- SSH隧道
- tunnel
- VMware
- putty
- 端口转发
- SSH端口转发

# 文章分类,在列表页显示(暂时使用tags)
categories: 

# 自定义url
url: ""
# 分类排序权重
tags_weight: 100
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
date: 2020-07-12T18:18:13+08:00
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
  image: "https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200712191744.png"
  caption: ""
  focal_point: "Center"
  preview_only: true
  alt_text: "tunnel"

# 文章页最头部的图片,如果当前目录下没有featured.jpg/png文件,且,三方image没设置image,则列表页也会显示这图片(image如设置了image,此处无效)
#header:
#  placement: 3
#  image: ""
#  caption: ""
#  focal_point: "Center"
#  preview_only: false
#  alt_text: ""


---











> 连接局域网下的虚拟机,在网上找到的做法通常是:在VMware配置端口转发  
> 最近了解隧道技术,突发奇想:能不能使用SSH隧道连接局域网下的虚拟机呢?  
> 在网上找到的相关资料不多,经过自己摸索,终于实现了  
> 使用SSH隧道连接局域网下的虚拟机,主要有两种方式可以实现  
> 1: 本地端口转发; 2: 动态端口转发

首先,假设网络图如下,A和B在同一局域网下,我们的目的是: 实现 A 连接到 C 的SSH服务
![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200712191744.png)






## 方法一 : 本地端口转发

> 大体思路: 在A下创建 `A --> C` 的SSH隧道,就可以访问A下的指定端口,通过隧道转发,访问到C的22端口了  
> 具体实现如下 :


### 1#B安装SSH服务
> 参考文章 <https://www.cnblogs.com/sparkdev/p/10166061.html>

* 这是非常关键的一步(作为小白,我刚开始就异想天开,直接就想通过A连接到C,直到多次尝试失败并且想通了)

* 我的电脑 B 的系统是`windows10 1909`,自带了`OpenSSH Server`软件;如果版本是`wondows10 1809`以下或`wondows7`的同学,可以网上搜索windows怎么安装`openSSH`服务

(1) Win10打开 设置(`Win + I`) ==> 应用 ==> 应用和功能 ==> 可选功能 => 添加功能 => OpenSSH服务器(点击安装)

![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200712195856.png)

(2) 打开 任务管理器(`Shift + Ctrl + Esc`) ==> 任务 ==> 左下角点击"打开服务"; 找到两个OpenSSH服务,右键开启

![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200712200951.png)

(3) 打开 控制面板 ==> 系统和安全  ==> `Windows Defender` 防火墙 ==> 启用或关闭`windows defender`防火墙;选择关闭防火墙; (或者在入站规则添加允许22端口)

![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200712202126.png)

> 到此, B已经配置完成


### 2#A建立 `A --> C` 的隧道

* 本人使用的是`PuTTY`的工具, 使用其他工具或`PowerShell`也是可以的

* 首先保证 C 关闭`iptables`或`nftables`防火墙 (或配置允许22端口)

* 通过"中间人" B ; 在 A 电脑上使用`PuTTY`建立起与 C 的SSH隧道 (本地端口转发)

在 A 上配置(基于文章开头假设的网络图) :

![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200712204730.png)

* 点击open,会出现登录,注意:这里登录的是 B 电脑,也就是要输入B的windows的用户名和密码;

* 到这里,你已经建立起 `A --> C` 的隧道了, 注意: 请不要关闭`PuTTY`窗口, 否则隧道会被关闭

> `PuTTY`如上设置,相当于使用命令 `ssh -L 127.0.0.1:6666:192.168.2.2:22 192.168.1.107`


### 3#A通过隧道连接 C 电脑

* 终于到最后一步了, 很简单, 在 A 电脑开启新的`PuTTY`窗口, 请求 A 本地的 刚才自定义的 6666端口就可以啦

![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200712210036.png)


* 恭喜你, 成功通过SSH隧道连接到 C ;因为隧道是 `A --> C` 的且加密的, B 不会监听到流量






## 方法二 : 动态端口转发


> 大体思路: 在A下创建 `A --> B` 的SSH隧道,把 B 作为代理(Proxy), 就可以实现 : A 使用`SOCKS5`协议通过 B 来访问到 C 的22端口   
> 具体实现如下 :


### 1#B安装SSH服务
(在 `方法一` 中有具体实现, 略)


### 2#A建立 `A --> B` 的隧道

* 本人使用的是`PuTTY`的工具, 使用其他工具或PowerShell也是可以的

* 在 A 电脑上使用`PuTTY`建立起与 B 的SSH隧道 (动态端口转发)

在 A 上配置(基于文章开头假设的网络图) :

![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200712215702.png)

* 点击open,会出现登录,注意:这里登录的是 B 电脑,也就是要输入B的windows的用户名和密码;

* 到这里,你已经建立起 `A --> B` 的隧道了, 注意: 请不要关闭`PuTTY`窗口, 否则隧道会被关闭

> `PuTTY`如上设置,相当于使用命令 `ssh -D 127.0.0.1:6666 192.168.1.107`


### 3#A通过代理连接 C 电脑

* 终于到最后一步了, 很简单, 在 A 电脑上开启新的`PuTTY`窗口, 设置 A 本地的 刚才自定义的 6666端口为代理端口, 请求 C 就可以啦

![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200712214629.png)







## 方法三 : VMware配置端口转发

> 这是一个比较普遍的做法, 在网上也容易找到相关文章  
> 大体思路: 在`VMware`上配置 监听父windows的端口X,把A端口转发到VMware下的虚拟机端口Y, 局域网的电脑只有访问windows的端口X就相当于访问虚拟机的端口Y啦, 是不是很容易  
> 具体实现如下 :


### 1#B配置VMware

![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200712220946.png)

### 2#B配置防火墙

* 打开 控制面板 ==> 系统和安全  ==> `Windows Defender` 防火墙 ==> 启用或关闭`windows defender`防火墙;选择关闭防火墙; (或者在 入站规则 添加允许 上一步自定义的6666端口)

![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200712202126.png)


### 3#A通过 B 连接 C 电脑

* 终于到最后一步了, 很简单, 在 A 电脑直接用`PuTTY`请求 B 的 6666端口, 就可以登录 C 啦

![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200712222247.png)


**... 以上**
