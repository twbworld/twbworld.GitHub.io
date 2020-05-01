
hugo-blog - 基于[academic-kickstart](https://github.com/sourcethemes/academic-kickstart.git)
===========

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

## PS
- robots.txt等文件位于static下