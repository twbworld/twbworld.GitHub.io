
**Hugo-Blog**
===========

[![](https://img.shields.io/github/tag/twbworld/hugo-blog?logo=github)](https://github.com/twbworld/hugo-blog)
[![](https://img.shields.io/github/tag/twbworld/twbworld.GitHub.io?label=GitHub-pages&logo=github)](https://github.com/twbworld/twbworld.GitHub.io)
![](https://img.shields.io/badge/language-Js/Html-orange)
[![](https://img.shields.io/badge/powered-hugo-ff4088?logo=github)](https://github.com/gohugoio/hugo)
[![](https://img.shields.io/badge/theme-hugo_academic-00d1b2?logo=github)](https://github.com/gcushen/hugo-academic)
[![](https://img.shields.io/badge/fork-academic_kickstart-00d1b2?logo=github)](https://github.com/sourcethemes/academic-kickstart)


## 外部临时浏览本地
例: `hugo --i18n-warnings server -D --bind 192.168.2.2 -p 1314 --baseURL=http://192.168.2.2:1314`
> 在内网上访问`http://192.168.2.2:1314`浏览  
  1313端口,是hugo本地localhost默认的端口,所以这里另用了1314

## 生成本地;-D:草稿也强制生成页面;-d:指定生成文件的地方
例: `hugo -D -d dev`
> 运行`hugo -D -d dev`前,先删除dev下的文件`rm -rfv dev/*`

## 生成正式环境文件
例:`hugo`
> 运行`hugo`前,先删除public下的文件`rm -rfv public/*`

## 新建博客文章
例:`hugo new --kind post post/使用linux时遇到的一个坑`
> `使用linux时遇到的一个坑`是一个文件夹名,也默认了是文章标题,里面含有自动生成的`index.md`

## PS
- robots.txt等文件位于static下