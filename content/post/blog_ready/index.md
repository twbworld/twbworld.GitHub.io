---

# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "搭建博客的准备"
subtitle: ""
summary: "最近想建立自己的博客网站,面临了抉择的问题,到底选择那个平台,用什么方式写技术博客"

# 标签
tags: 
- Hugo
- Github-Pages

#关键字
keywords:
- hugo
- Github-Pages
- 搭建博客
- 搭建博客准备

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
date: 2020-05-17T19:06:47+08:00
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


image:
  placement: 3
  image: "https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20210120180315.jpg"
  caption: "图片来源: [**courseit**](https://courseit.com.ar/blog/github-pages-subiendo-nuestro-portfolio/)"
  focal_point: "Center"
  preview_only: true
  alt_text: "Github-Pages"




---











> 最近想建立自己的博客网站,便于在开发过程中写一些笔记;  
但进入了未知领域,面临了怎么抉择的问题; 毕竟谁也不情愿一开始就因选择了自己不适合的,最后半途而悔

## 平台的选择

进入我的备选名单的有:
* CSDN
* 博客园
* WordPress
* Github Pages
* 知乎

先讲结论,我最终选择了Github Pages


### WordPress

优点: 
* 自己搭建的博客,自由度非常高
* 历经多年,插件丰富
* 对phper友好PHP

缺点: 
* 浪费大量 时间 / 精力 / 金钱 去维护网站(服务器的维护,域名,SEO,还有服务器安全方面的考虑,等等)

> 时间宝贵,老子只想静静的写文章,不愿在无意义的事上浪费有限的时间

### 知乎

优点:
* 前端界面较前卫
* 平台的文章质量也很高,也有大量的程序猿聚集在此
* 平台流量大,本人平时也喜欢逛知乎,有些许个人感情

缺点:
* 平台信息有点杂,文章五花八门,而且这几年很多在知乎上带节奏,以及一些搞营销的,比较反感
* 知乎对MarkDown的支持不友好

### CSDN/博客园

优点:
* CSDN/博客园 的搜索引擎优化是做的不错
* 程序猿社区,专注于技术博客,不像知乎给人的感觉很杂

缺点:
* 平台界面老旧(点名批评博客园,强迫症看着难受)
* CSDN的下载文件有收费模式
* 内容限制于平台,插广告都困难

### Github Pages
优点:
* 使用Git管理
* 静态网站,比较好维护
* 搜索引擎优化,服务器的维护等等这些,全权交给github好了,不需要浪费过多的精力
* 自由度较高,可以使用各种主题和插件,没有平台限制,插广告放个"看板娘"啥的
* 可使用自己的域名,且免费支持https
* 写博客使用MarkDown,就要有图床;可使用Github仓库作为图床,托管图片和静态资源
* 如果搭配GitHub Actions的免费CI/CD服务(即push代码即可实现部署代码等工作), 那么 Git仓库 + 图床 + CI/CD 都在GitHub的生态下, 体验一级棒
* Github是未来[呐喊], Github是未来[呐喊], Github是未来[呐喊]

缺点:
* gh-pages屏蔽了百度蜘蛛,用百度搜索引擎无法搜索出Github Pages的文章(但另一方面,百度相比Google的搜索质量差太多了;有"条件"的程序猿都善用Google吧?)解决办法并不是没有,[zeit.co](https://vercel.com/) 可提供CDN服务




------



> 如果您也决定使用gh-pages搭建博客,那就会面临着一个选择, 博客框架/静态网站生成器 的选择(强迫症又要犯了!)

## 博客框架的选择

> 我所理解的静态网站生成器: 在生成器框架下写MarkDown文章,使用生成器把MarkDown文章编译成生成HTML

主流选择也就那么几个:
* Jekyll
* Hexo
* VuePress
* Hugo

先讲结论,经一番思想斗争,本人选择了Hugo

### Jekyll
Jekyll是GitHub创始人使用Ruby写的,同时也是gh-Pages默认的静态网站生成器  
但其速度较慢,特别是文章多的时候,特别明显

### Hexo
Hexo是js写的,js的用户群体较大,Hexo中文文档比较齐全,国内获得了较大的使用人群

### VuePress
较新的静态网站生成器,热度也不低,但同时也不太稳定; 其名可知,对熟悉Vue的同学较为友好,且Vue在交互性上有巨大的优势

### Hugo
优点:
* 天下武功唯快不破,使用golang开发; 即使应对庞大的文章生成量,速度是用秒来计算的,简直秒杀对手
* "Google出品,必属精品",相信Hugo会随着go的影响力在国内越走越远(本人也正有学go的想法)
* 一个技巧(专治"选择困难症"),利用了搜索引擎来对比了Hexo和Hugo的搜索热度,Hugo的相关文章数是Hexo的100多倍,全球用户量庞大,Hugo所可选的博客模板也不少
![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200517212636.png)

缺点:
* 虽然全球用户量庞大,但缺乏中文文档, 国内用户群体少, Hugo的相关中文文章也就少; Hugo会不会是在国内的一支"潜力股" ?
