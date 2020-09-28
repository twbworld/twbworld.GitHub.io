---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "制作多分区启动盘"
subtitle: ""
summary: "一般制作启动盘后,只有一个大分区?如何制作多个分区的启动盘"

# 标签
tags: 
- System

#关键字
keywords:
- 多分区启动盘
- 启动盘制作
- 多个分区的启动盘
- 启动盘
- 启动U盘
- 启动硬盘

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
date: 2020-09-28T22:20:13+08:00
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
  image: "https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200928224804.png"
  caption: "图片来源: [**第三方**](https://m.shanyhs.com/article/2048)"
  focal_point: "Center"
  preview_only: true
  alt_text: "硬盘"

# 文章页最头部的图片,如果当前目录下没有featured.jpg/png文件,且,三方image没设置image,则列表页也会显示这图片(image如设置了image,此处无效)
#header:
#  placement: 3
#  image: "https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200503220558.jpg"
#  caption: "图片来源: [**Weibo**](http://weibo.com/u/2646212535)"
#  focal_point: "Center"
#  preview_only: false
#  alt_text: "这是图片的alt属性"


---







> 有些小伙伴手里有上百G甚至上T移动硬盘  
> 平时制作启动硬盘,除了启动分区,都是只剩一个分区提供自己使用的  
> 那么问题来了:怎么保留启动盘的功能,又能把硬盘分成多个分区呢?  
> 搜索引擎也很少有相关文章  
> 那么,今天就带大家制作一个多分区启动盘  
> 作者尝试了无数次才成功的,呕心沥血之作


所使用到的:

* 硬盘(本文章使用U盘展示,建议硬盘,毕竟日常生活中的十几或几十G的U盘,也没必要进行分区了)

* 微PE(作者使用的版本是`2.1`;也可以使用"大白菜"或"老毛桃",有广告植入,不建议)
> 微PE下载(不需要安装): <http://www.wepe.com.cn/download.html>

* UltraISO(作者使用的版本是`9.7`)
> UltraISO下载: <https://cn.ultraiso.net/xiazai.html>

* DiskGenius(作者使用的版本是`5.1`)
> DiskGenius下载: <https://www.diskgenius.cn/download.php>


## 1#获取`微PE`的系统ISO

(1) 双击打开下载好的 `微PE` 安装包,看到以下界面,单击右下角的光盘图标
![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200929001640.png)

(2) 接下来,要把 `微PE` 自带的ISO镜像保存到电脑,选择保存的位置, `光盘卷标` 也就是盘符的名称,也建议改成喜欢的名称,如"pe盘",最后点击 `立即生成ISO`
![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200929003752.png)

## 2#写入ISO到硬盘

(1) 插入硬盘,准备格式化

> PS: 备份数据!!!!!备份数据!!!!!备份数据!!!!!

(2) 打开安装好的 `UltraISO` ,菜单栏依次点击 `文件->打开` ; 选择上一步保存好的ISO文件

![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200929003225.png)

(3) 可以看到,左侧栏出现的ISO文件

![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200929003656.png)

(4) 接着,菜单栏依次点击 `启动->写入硬盘映像`
![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200929003959.png)

(5) 出现一个弹窗, `硬盘驱动器` 选择正确的硬盘,首先,需要把硬盘格式化,点击`格式化`
![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200929004608.png)

(6) 最后,正式把ISO文件写入硬盘,点击 `写入`
![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200929004749.png)


## 3#备份启动分区

(1) 打开安装好的 `DiskGenius` ,在左侧栏找到对应的硬盘,单击选中上一步生成的盘
![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200929010004.png)

(2) 菜单栏依次点击 `工具->备份分区到镜像文件`
![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200929010254.png)

(3) 出现一个弹窗, 点击 `选择文件路径` ,选择一个目录,输入自定义的`pmf`文件的名称,点击 `打开`
![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200929010619.png)

(4) 点击 `开始` ,成功后,会生成一个`.pmf`后缀文件,这个文件就是你的启动盘备份文件
![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200929011108.png)

## 4#硬盘分区

(1) `DiskGenius` 左侧栏选中对应的硬盘,点击 `快速分区`
![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200929011443.png)

(2) 可以看到一个弹窗;这一步是成功的关键,要严格按照以下的规定(作者经过无数次的尝试,得出来的结论) :
> 1. `分区表类型` 一定为 `MBR` ; 不要问为什么,我也不知道
> 2. `分区数目` 最多为3个; 不要问为什么,我也不知道
> 3. `高级设置` 以第一个作为启动分区,所以第一个分区选择 `FAT32`, 其余为 `NTFS` ; 不要问为什么,我也不知道
> 4. `高级设置` 把所有的 `主分区` 勾上; 不要问为什么,我也不知道
> 5. 至于各分区的容量,卷标名称等,请自定义
![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200929013018.png)

(3) 分区后,可以看到作为启动分区已经显示 `活动` 了
![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200929013528.png)


## 5#恢复启动分区

(1) `DiskGenius` ,在左侧栏找到对应的硬盘,单击选中上一步作为启动的分区
![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200929013709.png)

(2) 菜单栏依次点击 `工具->从镜像文件还原分区`
![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200929014447.png)

(3) 出现弹窗, 点击 `选择文件` , 选择在 `第三步` 生成的 `pmf` 文件
![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200929014834.png)

(4) 到此为止,成功制作了一个 多分区启动硬盘
> 但是,这样制作的多分区启动硬盘, `BIOS` 只能使用 `Legacy` 启动模式来启动硬盘(新型的 `UEFI` 无法启动PE), 如下图例子(华硕的BIOS)

![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200929015346.png)

**... 以上**
