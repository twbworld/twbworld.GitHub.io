---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "olaindex配置安装"
subtitle: ""
summary: "配置olaindex遇到了一些脑瓜疼的问题,记录下,希望能给帮助到有需要的人"

# 标签
tags:
- Note

#关键字
keywords:
- olaindex
- OneDrive

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
date: 2022-09-05T19:00:00+08:00
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
  image: "https://cdn.jsdelivr.net/gh/twbworld/hosting@main/img/20200517212749283437.jpg"
  caption: "图片来源: [**hub.docker.com**](https://hub.docker.com/r/80x86/olaindex)"
  focal_point: "Center"
  preview_only: true
  alt_text: "olaindex"


---



## 关于环境的安装,不做详细教程

### `olainde`隐藏后台地址
  因为olaindex默认是以`/admin`为默认地址的,我们需要做适当修改

#### 修改routes/web.php
``` php
Route::get('login', 'Auth\LoginController@showLoginForm')->name('login');
// 改为
Route::get('mylogin', 'Auth\LoginController@showLoginForm')->name('login');


Route::post('login', 'Auth\LoginController@login');
//改为
Route::post('mylogin', 'Auth\LoginController@login');

Route::prefix('admin')->middleware('auth')->group(function () {})
//改为
Route::prefix('myadmin')->middleware('auth')->group(function () {})

```
#### 修改nginx配置
``` json
    location /admin/account {
        rewrite ^/admin/(.*)$ /myadmin/$1 last;
    }
```


### 配置凭证
1. 如图按`申请`自动创建应用:
  ![](https://cdn.jsdelivr.net/gh/twbworld/hosting@main/img/202005172127497432198.png)
2. 登录[Microsoft Azure](https://www.azure.microsoft.com/)
3. 进入了`应用注册`,选择对应的应用(我的是"Graph PHP quick start")
4. 记录下`应用程序(客户端) ID`的编码,后面要用
5. 进入`证书和密码`, 创建`新客户端密码`, 记录下`值`的编码,后面要用
6. 进入`身份验证`,在`web`模块配置重定向的url, 如图所示:
   ![](https://cdn.jsdelivr.net/gh/twbworld/hosting@main/img/2020051721274936122.png)
7. 如图进入`API权限`,增加对应权限
  ![](https://cdn.jsdelivr.net/gh/twbworld/hosting@main/img/2020051721274930989089.png)
8. 把前面所记录下的`client_id`和`client_secret`填入, 保存
  ![](https://cdn.jsdelivr.net/gh/twbworld/hosting@main/img/20200517212749307398210.png)
