---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "keepalived高可用配置"
subtitle: ""
summary: "实现Nginx和Redis高可用配置的简单思路"

# 标签
tags:
- Network

#关键字
keywords:
- keepalived
- 高可用
- HA
- Nginx高可用
- Redis高可用

# 文章分类,在列表页显示(暂时使用tags)
categories:

# 自定义url,如果为空则按配置选项"permalinks"
url: ""
# 文章排序权重
weight: 110
# 是否精选文章,显示在首页
featured: true
# 草稿开关,开启则文章不会打包
draft: false
# 是否显示目录
toc: true
# 类型,默认是目录名,所以"post",也可以写"widget_page","dosc"等
type: post
# 文章添加时间
date: 2022-10-02T17:00:00+08:00
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
  image: "https://cdn.jsdelivr.net/gh/twbworld/hosting@main/img/202210021224100.png"
  caption: "图片来源: [**geek-cookbook.funkypenguin.co.nz**](https://geek-cookbook.funkypenguin.co.nz/docker-swarm/keepalived/)"
  focal_point: "Center"
  preview_only: true
  alt_text: "keepalived"


---


> `keepalived`需要一个`vip`;如果用的是云服务,那么得在后台申请一个高可用ip,才能实现`vip飘移`;如果是自建服务器,那么一台服务器得使用两个网卡;只是为了测试,那么使用`docker容器`模拟集群是最合适的了

## Nginx+keepalived


`Nginx`一主(172.1.1.11)一备(172.1.1.12),那么备服务器也太浪费了,所以除了`keepalived高可用`还涉及到四层网络的负载均衡;一般主备都需要配置`haproxy`,它是Linux内核自带的;为了方便,`Nginx`的`stream模块`也能实现四层负载均衡

> 一备一主`Nginx`都需要类似配置 :

``` bash
stream {
    upstream web_server {
        server 172.1.1.11:8080 weight=1 max_fails=3 fail_timeout=10s;
        server 172.1.1.12:8080 weight=1 max_fails=3 fail_timeout=10s;
    }

    server {
        listen 80 reuseport;
        proxy_pass web_server;
    }

}

http {
    server {
        listen 172.1.1.11:8080; #使用本机ip;stream和http不能监听相同端口,所以另用端口,除非指定不同的ip:port
        # ...
    }
}

```

> 一备一主`keepalived`都需要相同配置`/etc/keepalived/keepalived.conf` :

``` bash
global_defs {
   router_id LVS_DEVEL
}

vrrp_script check_nginx {
    script "/etc/keepalived/check_nginx.sh"
    interval 2 #检测时间
    fall 2 #检测失败次数
    rise 1 #检测成功次数
    weight -20 #sh脚本执行了"exit 1"后的权重变化
}

vrrp_instance VI_1 {
    state BACKUP

    interface eth0 #网卡
    virtual_router_id 70 #组唯一id
    priority 100 #权重
    #nopreempt #非抢占模式,对BACKUP生效,宕机恢复后,不会抢占vip
    advert_int 1 #MASTER与BACKUP之间检查的时间
    virtual_ipaddress {
        #飘移的vip
        172.1.1.100/24
    }
    track_script {
        check_nginx
    }
}
```

> 一备一主都需要添加 检测nginx状态 的脚本`/etc/keepalived/check_nginx.sh` :

``` bash
#!/bin/bash
A=`ps -C nginx --no-header | wc -l`

if [ $A -eq 0 ];then
    #/usr/sbin/nginx #重启nginx
    sleep 1
    if [ $A -eq 0 ];then
        #pkill keepalived
        exit 1
    fi
fi
exit 0
```




## Redis+keepalived

Redis不同于Nginx,Redis需要实现多个服务器的redis数据同步,所以配置分为三步:
1. 配置Redis集群主从库复制
2. 配置Redis的集群哨兵模式,用于检测Redis状态,宕机及时切换主数据库,数据恢复
3. 配置keepalived,负责Redis切换主库后的飘移vip



> 添加配置到从库的`redis.conf`,实现复制主库(172.1.1.11)的数据

``` bash
replicaof 172.1.1.11 6379
```


> 一备一主的哨兵都需要相同配置`sentinel.conf` :

``` bash
port 26379

daemonize yes
protected-mode no

pidfile "/var/run/sentinel/redis-sentinel.pid"
logfile "/var/log/redis/redis-sentinel.log"
dir "/tmp"

sentinel myid db1f6c96877303e3aa393481d00359abae6b2e7d

sentinel deny-scripts-reconfig yes

sentinel monitor mymaster 172.1.1.11 6379 1
```

``` bash
#查看主从状态
redis-cli -p 26379
    >sentinel master mymaster
    >SENTINEL get-master-addr-by-name mymaster
```


> 一备一主`keepalived`都需要相同配置,添加到[上文](#Nginx+keepalived)的同一份配置文件`/etc/keepalived/keepalived.conf` :

``` bash
vrrp_script check_redis {
    script "/etc/keepalived/check_redis.sh"
    interval 2
    weight -30
}

vrrp_instance VI_2 {
    state BACKUP

    interface eth0
    virtual_router_id 80
    priority 100
    advert_int 1
    virtual_ipaddress {
        172.1.1.101/24
    }
    track_script {
        check_redis
    }
}

```


> 一备一主都需要添加 检测Redis状态 的脚本`/etc/keepalived/check_redis.sh` :

``` bash
#!/bin/bash
#检测是否master主库(redis-sentinel推举出主库)
A=`redis-cli info|grep role:master`
if [ -z $A ]; then
    sleep 1
    if [ -z $A ]; then
        exit 1
    fi
fi
exit 0

```
