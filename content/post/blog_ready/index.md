---

# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "搭建博客的准备"
subtitle: ""
summary: "最近想建立自己的博客网站,面临了抉择的问题,到底选择那个平台,什么方式写技术博客"

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
  image: "https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200517231715.jpg"
  caption: "图片来源: [**courseit**](https://courseit.com.ar/blog/github-pages-subiendo-nuestro-portfolio/)"
  focal_point: "Center"
  preview_only: true
  alt_text: "Github-Pages"




---











> 最近想建立自己的博客网站,便于在开发过程中记录一些笔记;  
但是每次进入一个未知的领域,我的强迫症就会犯了,面临了抉择的问题;毕竟每个人都不想一开始就选择了不适合自己的,学到一半才后悔最初的选择;

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
* 因为工作原因,个人比较熟悉PHP

缺点: 
* 会浪费自己的大量精力和时间去维护网站(服务器的维护,域名,SEO,还有服务器安全方面的考虑,等等)

所有不好意思,程序员的时间非常宝贵,不要把时间浪费在这种无意义的事情上,我只想静静的写博客文章

### 知乎

优点:
* 网站设计比较前卫
* 平台的文章质量也很高,也有大量的程序员聚集在此
* 个人原因,平时也喜欢逛逛知乎的热榜,消磨时间,感情上挺适合我胃口的

缺点:
* 知乎这个平台信息有点杂,文章五花八门,而且这几年很多在知乎上带节奏,以及一些搞营销的,比较反感
* 听说知乎的MarkDown支持的不太好

所有,只能忍痛割爱了

### CSDN和博客园

优点:
* 很明显,CSDN和博客园的搜索引擎优化是做的非常不错的
* 程序员这个物种比较多
* 专注于技术博客,不像知乎给人的感觉很杂

缺点:
* 平台太难看,设计太老旧了,点名批评博客园,强迫症看着难受
* 在CSDN居然有下载收费的模式,反感
* 限制太严格,卖个广告收不行

### Github Pages
优点:
* 可以使用Git管理,这是必杀技啊
* 静态网站,比较好维护
* 搜索引擎优化,服务器的维护等等这些,全权交给github好了,咋们不需要浪费过多的精力
* 自由度比较高,可以使用各种各样的主题和插件,没有平台限制,可以卖个广告,放个收款码,放个看板娘啥的
* 可使用自己的域名,而且提供免费https证书
* 写博客,当然要使用MarkDown语法,而要很好的使用MarkDown,就要有自己的图床;正好可以使用Github仓库作为图床,托管自己的图片和静态资源;简直是完美的衔接
* Github代表了未来,Github代表了未来,Github代表了未来

缺点:
* Github Pages屏蔽了百度蜘蛛,用百度搜索引擎无法搜索出Github Pages的文章(但是,从另外一方面想,百度搜索出来的结果本来就是垃圾,也不必讨好你.只要不屏蔽Google就行),不过解决办法也不是没有,就是使用cdn,[zeit.co](https://vercel.com/) 可提供这样的服务


------



> 如果您也决定使用Github Pages搭建自己的个人博客,那么你就会面临着另外的一个选择(强迫症又要犯了)

## 博客框架的选择

> 我的理解博客框架就是:静态网站生成器;简单理解就是:按照它的规则,写MarkDown文章,它再把MarkDown格式的文章生成HTML

主流选择也就那么几个:
* Jekyll
* Hexo
* Hugo

先讲结论,经过一番思想斗争,我最终选择了Hugo

### Jekyll
Jekyll是使用Ruby写的,同时也是Github Pages默认的静态网站生成器  
被我pass了的原因主要是:看到网上的人说,Jekyll速度比较慢,特别是到后期

### Hexo
Hexo是js写的,因为这个原因,很多人使用Hexo也没压力,优点也很明显,
国内使用的人数比较多,中文文档比较齐全(当时看Hugo的文档,看得我头都疼)

### Hugo
Hugo是使用golang写的  
优点:
* 天下武功真的唯快不破,由于使用go开发的,go语言天生的速度优势,生成静态文件也就几秒的时间
* golang是Google推出的,"Google出品,必属精品",历史证明,golang也确实能当大任
* 由于在之前就想学golang了,Hugo正合我意
* 我用了一个笨方法(当"选择困难症"发作的时候,我经常使用,哈哈),利用了搜索引擎来对比了Hexo和Hugo关键词的搜索热度,结果发现,Hugo的相关文章数量是Hexo的一百多倍,Hugo使用的人更多,可能是代表未来
![](https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200517212636.png)





