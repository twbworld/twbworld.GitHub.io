---

# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "nginx开启stream模块获取真实ip"
subtitle: ""
summary: "如何正确获取用户真实ip,开启stream模块,使用proxy_protocol,解决ip为127.0.0.1的问题"

# 标签
tags:
- Network

#关键字
keywords:
- 获取真实ip
- proxy_protocol
- 代理
- nginx-stream
- remote_addr

# 文章分类,在列表页显示(暂时使用tags)
categories:

# 自定义url
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
date: 2022-03-14T21:00:00+08:00
# 文章更新时间,可开启 自动使用git时间
# lastmod: 2020-05-03T19:54:10+08:00
# 定时发布时间
# publishDate: 2020-05-03T00:00:00+08:00
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
  image: "https://cdn.jsdelivr.net/gh/twbworld/hosting@main/img/202303142131777.jpeg"
  caption: "图片来源: [**virtono**](https://www.virtono.com/community/tutorial-how-to/how-to-install-nginx-on-ubuntu-20-04/)"
  focal_point: "Center"
  preview_only: true
  alt_text: "Nginx"




---




> nginx开了stream模块,无法获取想要的客户端ip,最近学习了相关知识, 顺带做笔记

## 几个重要知识点

1. `X-Forwarded-For` 和 `X-Real-IP` 是http的请求头,属于第七层网络;意味两者的数据都可伪造篡改
2. `remote_addr` 是tcp发起端的ip地址, 属于第四层网络(`Ip-Port`), 意味着无法伪造也不为空(否则服务器与客户端就无法传输数据了)
3. 默认情况下, 发起http请求的客户端, 是不会把 本机的ip 写到 `X-Forwarded-For` 和 `X-Real-IP` 请求头里的, 而是把 `remote_addr`(上一节点的客户端的ip地址, 没节点就为空)替换掉`X-Real-IP` 和拼接到 `X-Forwarded-For`后, 再发起http请求
4. 根据 `3` 知识点, 可看出 `X-Real-IP` 是单个ip地址, `X-Forwarded-For`是一串ip(","相隔)
5. 服务器收到的 `X-Forwarded-For` 和 `X-Real-IP`, 在没有代理的情况下,值一般为空;

---


## 上机测试

### 测试一
假设由A发起http请求, 直接访问服务器 B; 如下 :

A(1.1.1.1) -> B(2.2.2.2)

> B nginx为什么要开启stream模块? 因为可以做四层负载均衡 和 对tls流量进行分流, 这方面相关知识不细讲了, 这里简化了配置,去掉四层负载均衡和tls分流相关配置

B的nginx配置如下:

``` nginx
#四层网络
stream {
    server {
        listen 2.2.2.2:443;
        proxy_pass 127.0.0.1:443; #代理给http层
        ssl_preread on;
    }
}

#七层网络
http {
    log_format httplog '$remote_addr|$http_x_real_ip|$http_x_forwarded_for';
    server {
        listen 127.0.0.1:443 ssl;
        server_name test.com;
        access_log access.log httplog;
        ......
    }
    ......
}
```

A发起http请求, nginx日志:

``` text
127.0.0.1|-|-
```

> `X-Real-IP`和`X-Forwarded-For`为空很好理解,因为中间没有代理; 但为何`remote_addr`不是预想中的`1.1.1.1`呢?

* 是因为stream配置的关系, 根据[`知识点2`](#几个重要知识点), remote_addr是上一节点的tcp真实ip, 而stream正是处理四层网络数据的, 换而言之`stream`就相当于一层"代理", 所以http获取到的remote_addr地址其实是`stream`模块的ip, 即"127.0.0.1"
* 如果在stream模块下记录remote_addr日志,得到的正是"1.1.1.1", 不信你试试
* 根据[`知识点1`](#几个重要知识点) `X-Real-IP`和`X-Forwarded-For`是http请求头,那就是下阶段的http流了, stream管不着, 自然这俩像预想中一样为空了

那么怎么解决这个问题呢? 获取的remote_addr"127.0.0.1"而不是真实ip

#### 解决

配置改为如下:

``` nginx
#四层网络
stream {
    server {
        listen 2.2.2.2:443;
        proxy_pass 127.0.0.1:443; #代理给http层
        ssl_preread on;
        proxy_protocol on; #开启protocol
    }
}

#七层网络
http {
    log_format httplog '$remote_addr|$http_x_real_ip|$http_x_forwarded_for|$proxy_protocol_addr';

    server {
        listen 127.0.0.1:443 ssl proxy_protocol; #接收protocol数据
        server_name test.com;


        #以下三行用于修改$remote_addr变量(remote_addr是不能被上一节点修改,但获得remote_addr后是可在本机(nginx)内部修改的,注意两者概念哟)
        #别看配置名其中有"real_ip",实质作用于remote_addr
        real_ip_recursive on;
        real_ip_header proxy_protocol; #基于stream层传来protocol数据进行后续修改
        set_real_ip_from 127.0.0.0/24; #从real_ip_header中删除这个ip段的ip,也可直接写具体ip;

        access_log access.log httplog;
        location / {
            proxy_pass http://3.3.3.3:443;
            proxy_set_header X-Real-IP $remote_addr; #把处理后的$remote_addr赋值给http请求头X-Real-IP, 便于下一级服务获取真实ip
            proxy_set_header X-Forwarded-For $remote_addr;
            proxy_set_header Host $host;
            ......
        }
        ......
    }
    ......
}
```

A发起http请求, nginx日志:

``` text
1.1.1.1|-|-|1.1.1.1
```

>成功获取真实ip; 可以看到$proxy_protocol_addr也能获取到A真实ip,使用`proxy_set_header X-Real-IP $proxy_protocol_addr`也是可以的

### 测试二
假设由A发起http请求, B作为代理, 到达服务器C; 如下 :

A(1.1.1.1) -> B(2.2.2.2) -> C(3.3.3.3)

> [测试一](#测试一)的B服务nginx配置不变; 以下测试服务C,同样开启stream(与 `测试一` 配置大体不变)


C的nginx配置如下:

``` nginx
#四层网络
stream {
    server {
        listen 3.3.3.3:443;
        proxy_pass 127.0.0.1:443; #代理给http层
        ssl_preread on;
        proxy_protocol on; #开启protocol
    }
}

#七层网络
http {
    log_format httplog '$remote_addr|$http_x_real_ip|$http_x_forwarded_for|$proxy_protocol_addr';

    server {
        listen 127.0.0.1:443 ssl proxy_protocol;
        server_name test.com;

        real_ip_recursive on;
        real_ip_header proxy_protocol; #可选值: proxy_protocol/X-Forwarded-For/CF-Connecting-IP(如用了cloudflare代理)等
        set_real_ip_from 127.0.0.0/24;
        set_real_ip_from 172.1.0.0/16;
        #还可添加代理商的ip列表(官网查); 如cloudflare: https://www.cloudflare.com/ips/

        access_log access.log httplog;
        location / {
            proxy_pass http://4.4.4.4:443;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $remote_addr;
            proxy_set_header Host $host;
            ......
        }
        ......
    }
    ......
}
```


A发起http请求, C的nginx日志:

``` text
2.2.2.2|1.1.1.1|1.1.1.1|2.2.2.2
```

>毫无疑问, C成功获取到A的真实ip; 其中$remote_addr为上级ip; 而$http_x_real_ip和$http_x_forwarded_for是代理B发起的http请求头传过来的; 一切预料之中



***举一反三, 就算后边有再多的代理节点, 也可以正常获取真实ip的***
