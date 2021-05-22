
**twbworld.github.io**
===========

[![](https://github.com/twbworld/twbworld.GitHub.io/workflows/ci/badge.svg?branch=master)](https://github.com/twbworld/twbworld.GitHub.io/actions)
[![](https://img.shields.io/github/tag/twbworld/twbworld.GitHub.io?logo=github)](https://github.com/twbworld/twbworld.GitHub.io)
![](https://img.shields.io/badge/language-Js/Html/Markdown-orange)
[![](https://img.shields.io/badge/blog-twbworld.github.io-blue)](https://twbworld.github.io)
[![](https://img.shields.io/badge/powered-hugo-ff4088?logo=hugo)](https://github.com/gohugoio/hugo)
[![](https://img.shields.io/badge/theme-wowchemy-00d1b2?logo=github)](https://github.com/wowchemy/wowchemy-hugo-modules)
[![](https://img.shields.io/badge/fork-starter%20academic-00d1b2?logo=github)](https://github.com/wowchemy/starter-academic)
[![](https://img.shields.io/github/license/twbworld/twbworld.GitHub.io)](https://github.com/twbworld/twbworld.GitHub.io/blob/master/LICENSE)


## 外部临时浏览本地
例: `hugo server -D --i18n-warnings --bind 127.0.0.1 -p 1314 --baseURL=http://127.0.0.1:1314`
> 在内网上访问`http://127.0.0.1:1314`浏览  
  1313端口,是hugo本地localhost默认的端口,所以这里另用了1314

## 生成本地;-D:草稿也强制生成页面;-d:指定生成文件的地方
例: `hugo -D -d dev`
> 运行`hugo -D -d dev`前,先删除dev下的文件`rm -rfv dev/*`

## 生成正式环境文件
例:`hugo`
> 运行`hugo`前,先删除public下的文件`rm -rfv public/*`

## 新建博客文章
例:`hugo new --kind post post/如何使用Hugo`
> `如何使用Hugo`是一个文件夹名,也默认了是文章标题,里面含有自动生成的`index.md`

## PS
- robots.txt等文件位于static下
- sitemap.xml会自动生成
- 在 `.github/workflows` 下存在 `CI/CD` 配置 , 可自动化发布
