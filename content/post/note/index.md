---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "学习笔记"
subtitle: ""
summary: "平时学习中,比较重要的知识点,记下来备忘"

# 标签
tags:
- Note

#关键字
keywords:
- 学习笔记
- 笔记
- Linux

# 文章分类,在列表页显示(暂时使用tags)
categories:

# 自定义url
url: "/note"
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
date: 2020-10-04
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
  image: "https://cdn.jsdelivr.net/gh/twbworld/hosting@main/img/20201004235821.jpg"
  caption: "图片来源: [**wikihow**](https://www.wikihow.com/)"
  focal_point: "Center"
  preview_only: true
  alt_text: "Note"

# 文章页最头部的图片,如果当前目录下没有featured.jpg/png文件,且,三方image没设置image,则列表页也会显示这图片(image如设置了image,此处无效)
#header:
#  placement: 3
#  image: ""
#  caption: ""
#  focal_point: "Center"
#  preview_only: false
#  alt_text: ""


---



## 扩展知识

### 双系统制作
> <https://blog.csdn.net/mengxiangjia_linxi/article/details/78965103>

1. 电脑已有 `Windows系统` 的前提下,用 `UltraISO` 把 `centos系统` 刻入U盘
2. 启动系统U盘(新机用 `uefi启动` ),在系统选择页面,按下 `tab健` 修改启动项,把 `LABEL=CentOS\x207\x20x86_64` 改为 `/dev/sdb4` (不一定是 `sdb4` ,可能是 `sda4` , `sdc4` 等等,具体百度)
3. 安装系统界面,选择硬盘,自动分配分区得以回收空间
4. 重做 `PE启动盘` ,启动盘用 `NTBOOT` 软件做 `双系统引导修复`






## 常用 命令&&快捷键


### Linux

| 命令 | 描述 |
| ---- | ---- |
| ..                                | 上一级目录 |
| cd -                              | 上一次目录 |
| ctrl+U                            | 清除输入命令 |
| !v                                | 执行上一条以'v'开头的命令 |
| 2>&1                              | 输出错误到标准输出 |
| \|grep                             | 过滤结果 |
| \| xargs                           | 结果作为下个命令的参数,通常用作批量操作 |
| ctrl+a/e                          | 命令最前/后 |
| clear                             | 清屏(或ctrl+L) |
| pwd                               | 当前目录 |
| mkdir/mv/cp/rm                    | 文件名操作 |
| \cp                               | 当有同名文件,不需要输"Y"即可覆盖 |
| useradd                           | 创建新用户 |
| which                             | 查找命令的位置 |
| chown                             | 设置文件拥有者 |
| chmod 775                              | 设置u/g/o权限 |
| setfacl -R -m u:www-data:rwx /var   | 设置单独用户的权限(getfacl查看) |
| chattr                            | 设置文件属性,如设置成禁止删除文件 |
| ps -ef(ps aux)                    | 查看所有进程 |
| pstree -p                         | 查看进程树 |
| pkill httpd                       | 关闭某进程(或killall) |
| uptime                            | 计算机负载 |
| top                               | 实时负载(可安装htop加强版) |
| df -h                             | 磁盘占用 |
| du -sh \*                          | 目录下各个文件大小(或 du -h --max-depth=0 \*) |
| pkill -kill -t pts/1              | 强退指定用户 |
| who                               | 在线用户(或缩写w) |
| last                              | 用户登录历史记录 |
| id                                | 查看用户所在的组 |
| lsof -i:80                        | 查看端口 |
| netstat -antup \| grep nginx       | 查看进程或端口等 |
| man                               | 命令帮助(可安装中文软件) |
| curl ifconfig.me                  | 查看公网ip |
| pkill -HUP nginx                  | 系统级别重载配置文件 |
| systemctl status nginx.service    | 查看状态(或service nginx status) |
| ln -s                                | 软连接 |
| nohup <shell\> &                     | 在后台运行shell命令 |
| tree -LNFC 2                       | tree软件常用命令 |
| tar -xaf -C ./folder             | 识别压缩文件类型,进行解压(-caf) |
| unzip -O cp936                  | zip文件解压避免乱码 |
| tail -f <filename\>                  | 查看文件变化 |
| scp -r /var root@192.168.1.1:/var/ | 目录传输 |
| find / -type f -name "*.txt" \| xargs grep "hello" | 查找文件内容 |
| cat <filename\> \| openssl dgst -sha256 -binary \| openssl enc -base64 -A | 计算文件sha256校验值(css校验方法:`<link href="filename.css" integrity="sha256-h20CPZ0QyXlBuAw7A+KluUYx/3pK+c7lYEpqLTlxjYQ=">`) |
| sha256sum <filename\> | 计算文件md5校验值 |
| iptables -L -t nat | 查看流量去向和端口占用 |
| netstat -lntp | 查看流量去向和端口占用 |
| watch -n 1 xxx | 实时查看命令结果 |


### k8s

| 命令 | 描述 |
| ---- | ---- |
| kubectl get -n kube-system -o wide all/po/node/deploy/svc/ep/np/plan/job/cj |  获取资源 |
| kubectl logs pod-name    |  查看pod日志 |
| kubectl api-resources    |  查看所有api |
| kubectl top po/no         |  资源占用 |
| kubectl rollout history deploy/pod-deploy --revision=1 |  镜像历史 |
| kubectl rollout undo deploy/pod-deploy --to-revision=1  |  回滚镜像历史 |
| kubectl port-forward mysql-sts-0 33060:3306 --address=192.168.111.111  |  端口映射 |
| helm show values traefik/traefik > traefik_values.yml  |  导出配置 |
| helm upgrade -f traefik_values.yml traefik traefik/traefik  |  更新配置 |


### Git

| 命令 | 描述 |
| ---- | ---- |
| `git diff <file>`                             | 工作区版本库对比 |
| `git diff <commit-id> <commit-id> --stat`    | 比较两个版本变化了的文件 |
| `git commit --amend`                          | 修改已commit的备注 |
| `git commit –am <备注>`                       | 直接跳过add命令 |
| `git reset --hard HEAD`                       | 还原最新版 |
| `git reset --hard <commit-id>`                | 还原指定版 |
| `git reset HEAD <file>`                       | 放弃暂存区的修改 |
| `git checkout -- <file>`                      | 放弃工作区的修改 |
| `git checkout . && git clean -df`             | 清除所有新增的文件目录 |
| `git checkout –b <name>`                      | 创建并切换分支 |
| `git branch -D <name>`                        | 丢弃未合并的分支 |
| `git branch -r -d origin/<name> && git push origin :<name>`     | 删除远程分支 |
| `git mergetool`                               | 解决冲突的合并工具 |
| `git tag -a <name> -m <备注> <commit-id>`     | 创建并指定标签信息 |
| `git show <name>`                             | 查看标签信息 |
| `git stash`                                   | 保存当前工作现场 |
| `git stash pop`                               | 恢复并删除工作现场 |
| `git stash list`                              | 查看工作现场 |
| `git stash apply <stash@{0}>`                 | 恢复工作现场 |
| `git stash drop <stash@{0}>`                  | 删除工作现场 |
| `git reflog <file>`                           | 命令历史 |
| `git revert <commit-id>`                      | 撤销某个版本 |
| `git cherry-pick <commit-id>`                 | 提取某个分支的某个版本到当前分支 |
| `git check-ignore -v <file>`                  | 检查哪个规则忽略了文件 |
| `git rm -rf --cached . && git add -A`        | 清徐缓存,用于更新gitignore |
| `git submodule add <远程项目地址> <路径>`      | 添加子模块 |
| `git submodule update --init --recursive`     | 下载所有子模块 |
| `git submodule update --remote`               | 更新所有子模块 |
| `git worktree add ../folder master`           | 关联某分支到目录 |
| `git remote show origin`                      | 详细的远程分支的信息 |
| `git log --oneline --graph --decorate --all -9`   | 可视化显示版本树 |
| `git branch --set-upstream-to=origin/main main`            | 设置默认分支 |
| `git config --global alias.lg "log --color --graph --all --oneline  --decorate --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"` | 可视化显示版本树配置别名 |
| `git config --global credential.helper store`            | http免密 |
| `git config --global color.ui true`               | 彩色显示 |
| `git config --global core.filemode false`            | 关闭git对文件权限的监视 |
| `git config --global core.quotepath false`        | 正常显示中文文件名 |
| `git config --global core.autocrlf input`               | add时转换为LF |
| `git config --global core.safecrlf true`               | 发现多种换行符拒绝add |


### Vim

| 命令 | 效果|
| ---- | ---- |
| !<shell\>             | 执行系统命令 |
| u                     | 后退 |
| Ctrl + r              | 前进 |
| i/I/a/A/o/O           | 前/行首/后/行尾/上行/下行 插入 |
| b/e/^/$/H/M/L/gg/G    | 移动光标到 跳前/跳后/行首/行尾/窗头/窗中/窗尾/头部/尾部 |
| Ctrl + b/f/d/u             | 翻一页/半页 |
| D                     | 删除到行尾 |
| dG                    | 向下删除 |
| dd                    | 删除当前行 |
| yy                    | 复制 |
| p                     | 粘贴 |
| ddp                   | 与下行互换位置 |
| yyp                   | 新增一行 |
| ggvG                  | 全选 |
| set number            | 显示行数 |
| vim +X <filename\>       | 文件加密 |
|:<number\>             | 跳到指定行 |
|/<name\>               | 搜索(按 n/N 向 下/上 查找) |


### Sublime

| 快捷键 | 描述 |
| ---- | ---- |
| Ctrl+Shift+L      | 所有选中的行,在行后后出现光标 |
| Ctrl+Shift+M      | 选中括号里的内容 |
| Ctrl+M            | 光标在括号前后跳 |
| Ctrl+Shift+[ / ]  | 隐藏/显示 内容 |
| Ctrl+J            | 多行成一行 |
| Ctrl+KK           | 删除行后的内容 |
| Ctrl+K+U / L      | 选中的内容 大写/小写 |
| Ctrl+F2           | 标记行 |
| F6                | 检错 |
| Alt+.             | 补充标签 |
| Alt+数字          | 跳转tag |
| shift+pgup        | 向下选择 |


### Vimium

| 快捷键 | 描述 |
| ---- | ---- |
| o       | 搜索 |
| j/k     | 滚动 |
| gg/G    | 头/底部 |
| d/u     | 翻页 |
| f       | 打开连接 |
| x/X     | 关闭/恢复标签页 |
| J/K     | 上/下一个标签页 |
| yy      | 复制链接 |
| H/L     | 后退/前进记录 |
| p       | 刷新 |
| t       | 新建标签页 |


### chrome

| 快捷键 | 描述 |
| ---- | ---- |
| Ctrl+0 | 恢复100% |
| Ctrl+j | 下载页 |
| Ctrl+Shift+Delete | 清除数据 |
| Ctrl+u |  html源码 |
| chrome://net-internals/#dns | 清除DNS |


### windows

| 快捷键 | 描述 |
| ---- | ---- |
| Win+←                  |  小化 |
| win+v                  |  粘贴板 |
| Win+i                  |  设置页 |
| Shift+Ctrl+Esc         |  任务管理器 |
| Alt+F4                 | 关机 |
| Alt+1/Enter/双击       |  查看文件属性 |
| Alt+↑                  |  上一级目录 |
| Alt+2(Shift+Ctrl+n)    |  新建文件夹 |
| 右击+v+d               |    隐藏图标(等等操作) |
| ctrl+win+D             |   新建桌面 |
| ctrl+win+←             |  返回桌面(老板键) |









## Linux

* 端口号<1024为系统预留端口
* uid < 500 为系统用户
* 非`root`用户不能监听<1024的端口(所以一般`root`启动`nginx`)
* nobody为Linux非登录用户,其作为nginx运行用户可保证安全
* `Linux`的共享:`NFS`协议
* `windows`与`linux`共享:`SMB`协议(`Samba`软件)

| 权限 | 符号 | 描述 |
| ---- | ---- | ---- |
| 可执行       | x | 可以进入该目录,无法读取该目录中的内容 |
| 可执行可读   | xr | 可以进入该目录并读取该目录中的内容,不能创建文件 |
| 可执行可写   | xw | 可以创建文件但是不能读取 |


* opessl自签名

```sh
openssl genrsa -out key.pem 2048

openssl req -new -key key.pem -out csr.pem #Common Name填写(泛)域名

openssl x509 -req -in csr.pem -out cert.pem -signkey key.pem -days 3650

```


* 目录描述 :

![](https://cdn.jsdelivr.net/gh/twbworld/hosting@main/img/20210404165626.jpg)


* Linux配置流程 :
    ``` sh
    ~/.vimrc配置
    syntax on
    set autoindent
    set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
    set enc=utf8
    set fencs=utf8,gbk,gb2312,gb18030
    set paste
    set nu!

    ~/.bashrc配置
    stty ixany
    stty ixoff -ixon
    alias l='ls -CF'
    alias ll='ls -alF'
    alias la='ls -A'
    alias rm='rm -i'
    alias cp='cp -i'
    alias mv='mv -i'
    alias k='kubectl'
    alias gs='git status'
    alias lg='git log --color --graph --all --oneline  --decorate --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
    alias d='docker'
    alias dps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}"'
    alias ds='docker stats --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemPerc}} / {{.MemUsage}}"'
    alias de='docker exec -it'
    alias tree='tree -NFC'
    alias lt='tree -aNFCL'
    alias init='id'
    alias reboot='id'

    export GO111MODULE=on
    export GOROOT=/usr/local/go/
    export GOPATH=/usr/local/gopath/
    export PATH=$PATH:/usr/local/bin:/usr/local/sbin:$GOPATH/bin/

    开启BBR
    echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
    echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
    sysctl -p
    lsmod | grep bbr

    ufw防火墙关闭
    静态ip
    apt源及更新
    ssh安装及配置
    net-tools安装
    iftop安装
    htop安装
    mtr安装
    git安装及配置
    tig安装
    tree安装
    screen安装
    axel安装(对线程下载)
    docker安装
    docker-compose安装
    k3s安装
    k3d安装
    python升级
    golang安装
    php安装
    node安装
    fresh安装
    hugo安装
    mysql安装
    proxychains安装
    samba安装
    传项目文件
    ```

* SSL证书申请 :

    详细说明:<https://github.com/acmesh-official/acme.sh/wiki/说明>

    1. 到[cloudflare](https://dash.cloudflare.com/profile)获取"更新dns"得权限码,[教程](https://github.com/acmesh-official/acme.sh/wiki/dnsapi)
        ``` sh
        export CF_Key="xxxxxxxxxxxxxx"
        export CF_Email="1174865138@qq.com"
        ```
    2. 安装acme.sh
        ``` sh
        curl https://get.acme.sh | sh -s email=1174865138@qq.com
        source ~/.bashrc
        ```
    3. 获取证书
        ``` sh
        acme.sh --issue --dns dns_cf -d twbhub.top -d *.twbhub.top \
        --yes-I-know-dns-manual-mode-enough-go-ahead-please
        ```
    4. 验证证书
        ``` sh
        acme.sh --renew -d twbhub.top -d *.twbhub.top \
        --yes-I-know-dns-manual-mode-enough-go-ahead-please --force
        ```
    5. 安装证书到别的位置
        ``` sh
        acme.sh --install-cert -d twbhub.top -d *.twbhub.top \
        --key-file /var/www/cert/key.pem \
        --fullchain-file /var/www/cert/cert.pem \
        --reloadcmd "docker exec nginx nginx -t && docker exec trojan /bin/bash -c 'systemctl restart trojan && exit' && docker exec nginx /bin/bash -c 'service nginx force-reload && exit'"
        ```
    6. 自动更新acme.sh版本
        ``` sh
        acme.sh --upgrade --auto-upgrade
        ```






## Git

* 初始配置Git
    > 1. 设置本地用户和邮箱
    `git config --global user.name <your_name> && git config --global user.email <your_email>`
    > 2. 本地生成公钥
    `ssh-keygen -t rsa -C <your_email>`
    > 3. 找到公钥,复制到github账号(即添加过公钥的用户才被允许管理github项目)
    > 4. 测试公钥
    `ssh -T git@github.com`
    > 5. 到github创建项目
    > 6. 本地创建项目并初始化
    `git init`
    > 7. 关联远程库和本地
    `git remote add <自定义远程仓库名,如origin> <远程项目地址>`
    > 8. 可查看本地关联的所有仓库主机
    `git remote -v 或者 git remote show origin`
    > 9. 把项目添加到缓存区
    `git add . 和 git commit –m <备注>`
    > 10. 提交项目到origin仓库的master分支
    `git push origin master (添加"--tags"可同时上传tag)`

* git hook :
    > * 第三方仓库git hook
    > * 服务器部署git裸仓库
        <http://kongfangyu.com/2016/02/12/git-deploy>

* 备注规范 :
  > * feat: 新功能
  > * fix: 修复 bug
  > * chore: 其他修改,构建过程或辅助工具和库（如文档生成）的更改
  > * refactor: bug 修复和添加新功能之外的代码改动,重构大改动
  > * perf: 提升性能的改动
  > * docs: 文档变动
  > * style: 格式调整，对代码实际运行没有改动，例如添加空行、格式化等
  > * test: 添加或修正测试代码
  > * ci: 持续集成相关文件修改
  > * release: 发布新版本
  > * revert: 恢复上一次提交






## 编译安装
``` sh

# 配置
./configure --prefix=/usr/local/nginx
# 清除编译文件
make clean
# 编译
make
# 安装
make install
# 软连接
ln -s /usr/local/nginx/sbin/nginx /usr/bin/nginx
# 开机自启
vim /etc/init.d/nginx && chmod a+x /etc/init.d/nginx
# 加入chkconfig管理列表
chkconfig --add /etc/init.d/nginx
chkconfig nginx on
systemctl status nginx.service

```







## 网络

* `TCP` :需要三次握手,建立了 `TCP` 虚拟通道,之后, `TCP` 运输 `HTTP流`
* `SSL` : 位于 `TCP` 与 `HTTP` 之间,作为 `HTTP` 的安全供应商，全权负责 `HTTP` 的安全加密工作。
* `TLS` : 在 `SSL3.0` 版本的基础上，重新设计并命名了这个协议，其全新的名字为 `TLS` ,形成: `TCP连接时间` + `TLS 连接时间` + `HTTP交易时间`
* `HTTPS` : 通常将 `TLS` 安全保护的 `HTTP` 通信，称之为 `HTTPS` ，以区别于没有 `TLS` 安全防护的 `HTTP` 明文通信。
* `HTTP/2` : 第一次页面与第二次页面都是同一个网站服务器,重用第一个页面 `TCP` 连接(多路复用)
* `QUIC` : `http/2` 去掉 `TCP` ,改用不需要连接的 `UDP` ,形成: `UDP / QUIC` ,第一次 `2.5RTT` ,完成 `QUIC` 交易的连接的 `Session ID` 会缓存在浏览器内存里,第二次,使用 `Session ID` ,重连 `TLS` 连接是一个 `0 RTT` 事件
* `HTTP/3` : 把 `QUIC` 与 `HTTP` 分离,形成: `UDP / QUIC / HTTP`
* 使用 `IPv4` 进行路由，使用 `TCP` 进行连接层面的流量控制，使用 `SSL/TLS` 协议实现传输安全，使用 `DNS` 进行域名解析，使用 `HTTP` 进行应用数据的传输。

* `IP` 是网络层 ; `TCP` 是传输层
* 网络层 `ARP` : 保存 `IP` 与 `mac` 地址的映射列表,没有则会广播

* `TCP/IP` 连接 + `http` 传输 --> 网卡 --> 内核(通过资源包的四元组信息,信息的其中之二是访问的 `IP+端口` ) --> `socket`(它是文件系统,是资源,是网络与进程的中介,储存着端对端的四元组信息,被进程使用) --> 进程




## 隧道

> <https://www.zhihu.com/question/39382183>
* 隧道是一种技术,有 `SSH隧道` 和 `http隧道` 和 `UDP隧道(p2p)`
* 隧道的中间服务器是不参与流量分析的,只用来传输流量,只是用于简单的过度
* 代理是可以参与流量的处理的,比如 `http代理`
* 但 `http代理` 不能传输 `https流量` ,因为 `https` 是端对端的加密,没有中间人
* 为了解决不能代理 `https流量` , `http隧道` 配合 `http` 的 `CONNECT报文` 解决了这个问题;
* `SOCKS5` 方式可以代替 `CONNECT报文` 的方法, `CONNECT报文` 只能用于 `http流量` ,而 `SOCKS5` 可以传输任意协议,如 `https` 或 `ftp`
* 大致原理: `本地---(1)--->代理---(2)--->服务器`; 本地与代理建立动态端口隧道,过程`(1)` 使用 `SOCKS5` 或 `http` 的 `CONNECT报文(包裹着https流量)` , 过程 `(2)` 使用 `https`;

> <https://www.zsythink.net/archives/2450>

1. 动态转发(科学上网)
    ``` sh
    # socks5代理的建立
    ssh -N -f -D 127.0.0.1:6666 root@121.199.63.39

    # 原理:本地(127.0.0.1:6666)与代理(121.199.63.39)服务器建立隧道后,本地(127.0.0.1)使用socks5协议在外层加密https协议,通过本地代理端口(6666)-(隧道)-代理(121.199.63.39)-https访问服务端(https://www.google.com)
    curl -x socks5://127.0.0.1:6666 https://www.google.com #http为例
    ssh -o ProxyCommand="nc -X 5 -x 127.0.0.1:6666 %h %p" https://www.google.com #ssh为例,参数-X默认socks5
    ```

2. 本地转发
    ``` sh
    ssh -N -f -L 192.168.2.2:6666:121.199.63.39:22 root@121.199.63.39
    ```

3. 远程转发
    ``` sh
    ssh -N -f -R 121.199.63.39:6666:127.0.0.1:22 root@121.199.63.39
    ```

4. 通过 `121.199.63.39` 的 `22` 端口,登录 localhost 的 `6666` 端口
    ``` sh
    ssh -J root@121.199.63.39:22 -p6666 localhost
    ```



## 数据库读写分离

实现 `读写分离` 分为两大步 :
* [主从同步](https://www.jianshu.com/p/bfca0cdfb169)
* 读写分离;有两种方式 :
    * 通过程序实现,如TP框架,性能最好;
    * 使用代理工具,如 :
        * [Mycat](https://www.jianshu.com/p/cb7ec06dae05)
        * [Mysql-Proxy](https://www.jianshu.com/p/cadf337274c1)



> `mysql` 之间可相互主从同步,避免 `单点` ;当有主从数据库发生宕机,可使用 `percona-tooldit` 工具解决恢复宕机后主从数据不同步的问题
    <https://blog.51cto.com/moerjinrong/2352317>


## 数据库

> `mysql8` 特性 :
> * `utf8mb4` 储存表情符号
> * 默认 `InnoDB`
> * 降序索引
> * JSON支持,直接操作json里的数据
> * 跳过锁等待
> * 用户角色管理权限
> * `innodb_dedicated_server` 自适应参数,自动配置 `mysql`

* 出现不能连接数据库的情况,除了防火墙,也可能是数据库没有设置对外添加权限
* 出现用户不能登录的情况,可能是默认登录了 `匿名用户` , 要把用户名为 `''` 的用户清除
* `InnoDB` 存储引擎偏向于增删改事件,支持事务,支持索引行锁
* 索引才用 `for update` 锁库

* 免密码登录
    `skip-grant-tables`
* 性能测试
    `explain select * from dnname`
* 性能测试工具(mysql自带)
    `mysqlslap ...`
* 数据库导出
    `mysqldump -uroot -p dbname > dbname.sql`
* 新建数据库
    `CREATE DATABASE mydb CHARACTER SET utf8 COLLATE utf8_general_ci`
* 插入数据
    `insert into $my_name (id,name,tel) values('2','tab',null)`
* 删除数据
    `delete from my_name where id = 1;`
* 修改数据
    `update my_name set id='2',name='tab' where id=1;`
* 插入字段
    `alter table my_name add id varchar(32)`
* 删除字段
    `alter table my_name drop id`
* 去掉name重复的
    `SELECT DISTINCT name FROM my_name`
* 计算个数
    `select count(*) from my_name`
* 计算总和
    `select sum(*) from my_name`
* 计算平均
    `select sum(*)/count(*) from my_name`
* 计算平均
    `select avg(name) from my_name`
* 最小值
    `select min(name) from my_name`

* 双重查询,查询指定最小值对应的的所有字段
    `SELECT * FROM my_name WHERE name=(SELECT max(name)FROM my_name)`
* 根据指定字段分类
    `select * from my_name group by name;`
* 表的联合查询
    `SELECT * FROM my_name as a INNER JOIN my_name2 as b on a.name=b.id`
* 左查询,就是当my_name跟my_name2的的值不相对应则以my_name为主要,my_name2多出的值则省略
    `SELECT * FROM my_name as a left outer JOIN my_name2 as b on a.name=b.id`





## PHP

> php7特性
> * 用绝对路径
> * 重定向后使用exit
> * array_walk
> * &引用节省内存
> * += array()
> * isset($a{1})
> * $_SERVER['REQUEST_TIME']
> * strtr
> * 高亮PHP代码highlight_file
> * 2 <=> 1
> * echo "\u{41}",PHP_EOL;
> * use some\namespace\{ClassA, ClassB, ClassC as C};
> * function arraysSum(int ...$ints): string
> * ``` php
>    class A{static private $b = 'hello world';}
>    $bb = function (){return A::$b;};
>    echo $bb->call(new A);
>    ```

* bug
  ``` php
  [] == []; //为false

  'a' == 0;

  $a = '0.3' - '0.1';
  json_encode($a);
  0.55 * 100 == 55; //为false
  ```
* json_encode((array)$array, JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES|JSON_PRETTY_PRINT)
* 有时候exec命令执行失败,却没有报错,请这样使用:`exec('ls 2>&1', $a, $b)`
* `fastcgi`就是执行 `cgi协议` 的,用于定义 `Nginx` 调用 `php` 时的数据格式,并减少对 `php.ini` 的读取
* `php-fpm`就是 `Nginx` 服务调用的程序,管理 `fastcgi` 进程
* `php-cli`就是 `shell` 命令行调用的程序
* `|||nochange|||`表示 `input` 输入框为空
* `htmlentities` / `htmlspecialchars` 可以过滤成 `html格式` , 防止 `XSS`
* `addslashes` 防止 `sql注入`
* `explain` 用于测试 `sql语句` 性能
* 引用字符串方式: `Nowdoc` / `Heredoc`
* 中文简体格式
    `header('Content-type:text/html;charset=utf-8')`
* 解决textarea标签回车编码问题
    `str_replace(" "," ",str_replace("\n","<br/>",$data))`
* 单入口写上: `session_start()` 才可以使用 `$_SESSION`
* 跳转到#页面
    `header('Location:#')`
* php格式插入html遍历
    ``` php
    <?php foreach ($my_name as $x => $y){ ?>
        <li><?php echo $y['z'] ?></li>
    <?php } ?>
    ```
* 内容返回
    ``` php
    ob_start(); //开启echo缓存区
    echo "Hello"; //输出
    ob_end_flush(); //输出全部内容到浏览器,包括echo
    ```
* php数组排序
    ``` php
    array_multisort(array_column($array,'create_time'),SORT_DESC,$array)
    ```
* 跨域
    ``` php
    $origin         = isset($_SERVER['HTTP_ORIGIN']) ? $_SERVER['HTTP_ORIGIN'] : '';
    $originsAllowed = [
        'http://cc.cc:8080',
    ];
    if (in_array($origin, $originsAllowed)) {
        defined('CORS_ORIGIN') || define('CORS_ORIGIN', $origin);

        header('Access-Control-Allow-Origin: ' . $origin); //可以用*允许所有
        header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT");
        header('Access-Control-Allow-Headers: X-Requested-With, X_Requested_With, content-type');
        header("Access-Control-Allow-Credentials: true");
    }
    ```

## 前端

* 可以设置类似`cookie` , 它可永久保存
    `localStorage.setItem(name, val)`
* 死链
    `<a href="javascript:void(0);">`
* CSS加载JS样式
    `behavior:url()`
* 选择div内第二个li,类似js
    `div li:first-child+li{}`
* 选择form下类型为text的input标签
    `form input[type="text"]{}`
* 居中CSS背景图片
    `background-position:center`
* 居中HTML图片
    `<div align="center"><img src="">`
* 居中div
    `{top:0;left:0;bottom:0;right:0;margin:auto}/margin:0 auto;`
* 单行文字水平/垂直居中
    `text-decoration:center;/line-height:10px;`
* 多行文字垂直居中:div1>div2>p
    `div1{display:table;/*转换成表格*/} div2{display:table-cell;vertical-align:middle;}`
* li中间向两边分布
    `ul{text-align:center}li{display: inline-block;}`
* li水平分布,ul宽度平均分割给li
    `ul{display:flex}li{flex:1;text-align:center}`
* li水平分布,类似最左和最右浮动两边的效果
    `div{overflow:hidden;width:11px} div ul{width:12px}   li{width:5px;margin_right:1px}`
* 轮播图不能有滚动条
    `在ul父级加overflow:hidden;width:100%;position: relative;//position用于ul居中`
* 清除浮动,class是my_name就可以清除浮动
    `.my_name:after{content:""; display:block; height:0; visibility:hidden; clear:both;}`
* 鼠标悬浮图片放大
    `.div:hover img{transform: scale(1.03);transition: all 1s ease 0s;-webkit-transform: scale(1.03);-webkit-transform: all 1s ease 0s;}`
* iframe高度
    ``` js
    var e = window,
        a = 'inner',
        $header = $(".header");//如果页面有头部,则要减去
    if (!('innerWidth' in window)) {
        a = 'client';
        e = document.documentElement || document.body;
    }
    var height = e[a + 'Height'] - $header.outerHeight();
    $(".iframe").css({
        height: height,
        width: "100%"
    });
    ````


**... 以上**
