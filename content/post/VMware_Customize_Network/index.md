---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "VMware自定义虚拟网卡(添加网络)"
subtitle: ""
summary: "VMware创建设置虚拟网卡,可更好的了解和定制虚拟机的网络"

# 标签
tags: 
- VMware

#关键字
keywords:
- VMware
- VMware添加网络
- VMware自定义虚拟网卡
- VMware创建设置虚拟网卡

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
date: 2020-05-31T14:07:40+08:00
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
  image: "https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200531142646.jpg"
  caption: "图片来源: [**youtube**](https://www.youtube.com/watch?v=Bj_pkYJoro0)"
  focal_point: "Center"
  preview_only: true
  alt_text: "VMware"

# 文章页最头部的图片,如果当前目录下没有featured.jpg/png文件,且,三方image没设置image,则列表页也会显示这图片(image如设置了image,此处无效)
#header:
#  placement: 3
#  image: ""
#  caption: ""
#  focal_point: "Center"
#  preview_only: false
#  alt_text: ""


---
















> 我的VMware版本: 15.5.2

## 一 创建虚拟网络


1. VMware菜单==>编辑==>虚拟网络编辑器

![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200531154440.png)

2. (这一步可略过)移除所有默认的"网络"

![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200531154849.png)

3. 点击"添加网络", 选择"VMnet8"

![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200531155509.png)

4. * 上方列表点击选择刚才添加的网络"VMnet8";
   * 选择NAT模式;
   * 设置子网IP;一般设置"192.168.xxx.0",我这设置为"192.168.2.0"
   * 设置子网掩码"255.255.255.0",一般子网掩码固定;

![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200531155727.png)

5. 点击"NAT设置";设置"网关IP", 一般为"192.168.xxx.1", 所以我这设置网关为"192.168.2.1";点击"确定" (还有端口转发,一般用于局域网PC链接VMware里的虚拟机所使用)

![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200531160526.png)

6. 点击"DHCP设置"; 这里可以设置网关分配给VMware下的虚拟机的起始IP和结束IP; 因为网关已经占用了192.168.xxx.1,所以这自定义起始IP可以为"192.168.xxx.2", 结束IP为"192.168.xxx.254", 点击"确认", 回到上一层, 再次点击"确认";

![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200531161155.png)



## 二 使用虚拟网络

1. 查看 控制面板==>网络和Internet==>网络和共享中心==>更改适配器设置; 可看到, 虚拟网卡已创建成功;

![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200531162022.png)

2. 选择新添加的网卡;右键选择"属性";双击"协议版本4";设置IP;我这里设置了100;也可以设大一点,点击"确认"
> 如果缺少这一步,可能会出现宿主机SSH链接不上虚拟机的情况(或者出现需要长时间才连通,连上后,短时间内又断开的情况);原因可能是因为网卡的IP占用了网关IP"192.168.xxx.1", 导致虚拟机的数据到不了在外一层的宿主机

![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200531163409.png)

3. 虚拟网卡已创建成功,最后还要选择使用新创建的网卡;选择你要使用刚才新建网卡的虚拟机, 右键选择"设置", "硬件"==>"网络适配器" ,右侧点击"自定义:特定虚拟网络", 选择新建的"VMnet8(NAT 模式)", 点击"确定"
> 这一步非常关键,我曾经缺少这一步,导致虚拟机连不上网

![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200531165342.png)

![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200531165906.png)

4. 到此,虚拟机应该就可以上网了,如果不行;请重启虚拟机的network; 或者VMware最右下角的"网络适配器"重新连接

![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200531171518.png)

5. 同时还可以在虚拟机里设置固定的IP,IP地址要根据"起始IP"和结束"IP"设置; 例如,我在Centos8系统上, 设置了IP:"192.168.2.2"

![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200531171957.png)








