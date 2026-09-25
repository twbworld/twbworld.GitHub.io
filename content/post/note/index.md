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
| du -sh * \|sort -rh               | 各个文件大小 |
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
| find . -type f -name "*.txt" \| xargs grep "hello" | 查找文件内容 |
| find . -type f -exec dos2unix {} \; | 转LF换行符 |
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
| kubectl get pods -A -o custom-columns=node:.spec.nodeName,pod:.metadata.name,uid:.metadata.uid         | uid和pod的对应关系 |
| kubectl rollout history deploy/pod-deploy --revision=1 |  镜像历史 |
| kubectl rollout undo deploy/pod-deploy --to-revision=1  |  回滚镜像历史 |
| kubectl port-forward mysql-sts-0 33060:3306 --address=192.168.111.111  |  端口映射 |
| kubectl run --rm -it --image=busybox:latest --restart=Never test -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://proxy-svc:80/test.html; done"  |  压力测试 |
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
| `git config --global init.defaultBranch main`     | 默认分支 |
| `git config --global init.defaultBranch main`     | 默认分支 |
| `find . -type f -exec dos2unix {} \\;`            | 转LF |


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



## Ai

### 性能
- 缓存
    1. Higress(网络层): 角色类似traefik, 比其重型; 可利用向量检索实现LLM层面的“语义缓存”,即直接返回语义相似的问题下的缓存答案; 其不知道当前用户是谁的等信息, 只能做粗粒度缓存,如"怎么退款"等问题
    2. GPTCache(业务层): 其角色是作为SDK/库引入Agent代码中; 可利用向量检索实现LLM层面的“语义缓存”, 相比网络层的Higress是不知道当前用户是谁的等信息
    3. Prefix Caching(Prompt Caching, 算力层): 用户多轮问题场景中的 KV 复用, 缓存用户问题所产生的KV值,如果下一个用户问题前缀对齐(命中), 则利用上一个KV值进行计算.
    4. KV Cache(显存层): 单次问题生成答案过程中的KV存储,实现自回归加速,利用上一个字的KV缓存, 预测下一个字.答案全部生成后, 缓存即可丢弃
- LLM批处理,即厂商的Batch API(离线异步)
- 首字时间(TTFT)受限于**计算能力**,因要理解提示词; 出字Token速度(TPOT)受限于**显存带宽**因要把所有权重从显存搬到计算单元

### 质量(解决幻觉)

#### 提示词
- 明确角色, 提供思考步骤(skills), 约束禁止和必须做, 提供输出事例, 自我反思, 禁止猜测务必追问, 明确参考来源
- RE2: 提示词反复强调重点,提高LLM的专注度
- 提示词压缩+数据清洗(如清除无用信息,特殊字符,脱敏等)

#### 架构
- 使用MCP:向量检索筛选出Tools(如MCP), 同时使用`Tool Calling`并配置`strict: true`
- 使用有联网能力的Tool
- RAG(检索+增强+生成)
- 调节LLM温度
- 结构化输出(Structured Outputs)
- 使用小LLM分诊路由, 判断意图/情绪/对应知识库
- 使用大型LLM激发`涌现能力`
  > 上下文学习能力、思维链推理解决难题的能力、听懂人类意图的能力 等
- 使用垂类LLM或微调
- Agent具备ReAct逻辑,并避免死循环
    > 限制ReAct次数, 限制token, 设置超时

#### 效果评估
- 人工介入打分,灰度打分
- A/B 测试,分析用户行为
- 使用新数据或私有数据进行测试(确保LLM未曾“见过”这些数据)
- 使用专门ai测试工具


##### MCP
- MCP2.0本地通信沿用`stdio`, 远程通信采用`Streamable HTTP`(按需标准响应或SSE流式响应)
- MCP可配置三大顶层:除了`Tool`(动态能力)还有`Resource`(静态资源, 使用`@`引用)和`Prompt`(使用`/`调用);`Prompt`是`Resource`与`Tool`的使用说明书, 类似于`skill`。
    > 如:用户输入指令`/select 小明`, MCP鉴权通过则响应Prompt:`用户要查询"小明"的信息。首要读取[脱敏规范.md]资源(Resource), 然后调用query_user工具(Tool)获取包含敏感信息的用户数据,最后依据规范脱敏后输出最终答案`,实际上`脱敏规范.md`文件可直接内嵌到响应里

##### RAG
1. 查询转换: 利用LLM对用户问题进行改写/扩充/分解,再进行自查询
2. 自查询: 利用LLM提取语义不明显的数据(如数字), 并生成 检索文本和过滤条件, 用于下一步的语义和关键词检索(投入产出比不高,且速度变慢)
3. 关键词检索(BM25算法): Elasticsearch
4. 向量检索: Milvus/Qdrant
5. 混合检索: 通过RRF算法融合 关键词检索+向量检索的结果,再通过重排模型(Reranker)深度精排, 最后结果交给LLM

>- 单独的ES/Milvus/Qdrant, 也能实现关键词+向量检索,即混合检索; PostgreSQL甚至能实现:关系型数据库+向量检索+关键词检索, 只是并发性能下不够专业, 也不能分布式.
>- GraphRAG:新一代RAG, 利用LLM提取实体关系构建“知识图谱”, 再向量化入库; 提高总揽全局做总结和顺藤摸瓜把分散的零碎知识串起来的能力
>- Dify/FastGPT是支持混合检索的RAG工具

##### 微调

1. 从零预训练(一次预训练):投喂海量数据,得到`Base模型(预训练基座模型)`, 没有Chat对话能力(未对齐),如`Qwen3-8B-Base`
2. 增量预训练(二次预训练): 用`Base模型`,投喂相关领域知识,得到`垂类Base模型`(训练过程部分掺杂原有Base的数据,避免模型"遗忘")
3. 指令微调: 为了理解人类指令、注入思维链(CoT)并具备对话能力,用`Base模型`做对齐工作,得到`Chat/Instruct模型`,如`Qwen3-8B-Instruct`和`DeepSeek-R1-0528-Qwen3-8B`(其用`蒸馏数据`训练`Qwen3-8B-Base`得到的)
4. 二次微调: `Chat模型`作为基座, 通过脚本(PEFT技术), 用LoRA的方式训练个性化数据, 把训练生成的外挂包(权重)与基座LLM打包(权重合并)后, 再转换为平台格式(如GGUF用于边缘设备).
    > 云平台租24G显存显卡,用8B模型训练2000条数据,只需半小时,几块钱
> 两个微调阶段, 都可选择LoRA微调(使用`外挂包`)或全参数微调(需要极大显存, 训练数据不过万就没必要)



### 生态

#### 协议
- ACT(国内):用于电商全链路支付流程(相当于ACP或UCP+AP2); 配合支付宝 MCP 实现"前置授权, 自动免密代付",无需每次输入密码
- ACP(国外-OpenAI):用于电商全链路支付流程, 支持法币和加密币
- AP2(国外-Google):用于电商支付, 支持法币和加密币
- UCP: 使得电商平台能被Agent"看懂"(即Agent可检索该平台,包括整套交易流程)
- A2A: Agent委托其他专业Agent解决其能力外的事情
- ADK:开发Agent的框架(类似LangGraph/Qwen-Agent)

#### 工具

| Coze(扣子) | Dify | LangGraph |
| :--- | :--- | :--- |
| 平台(低代码) | 应用开发(私有化部署) | 底层开发框架 |
| 运营、产品 | 全栈工程师 | 后端研发 |
| 客服、Bot、轻应用 | 支持RAG | Agent |

### 杂项
- **SAM**: 用于抠图,先用ViT把图片转成向量, 最后将该向量与提示词(抠图要用的图片坐标或文字等信息)向量一起给`解码器`,秒出结果
- **VLM**: 用于图片识别,含ViT+投影层+LLM,如`Qwen-VL`,先用ViT把图片转成向量, 再用`投影层`把向量翻译成图片token,最后将图片token与提示词token一起投喂给文本模型(LLM); 可实现RPA(模拟人类操作GUI系统)
- **Omni**: 一体化全模态, `识图`、`生图`、`听`、`说` 等多能力合一的模型
- **防越狱**: 1.敏感词匹配 2.提示词 3.微调



## Go

- 推荐[...]int{}
- 推荐a, b = b, a
- 推荐for range 3 {}
- 推荐 func(a, b string)(err error){}
- 推荐使用[]byte
- 推荐make预设长度和容量,避免json.Marshal结果出现null
- 推荐`strings.Builder`拼接字符串
- 推荐边界检查消除 a = a[:3]
- 推荐大slice切割并copy到新slice,大slice会被垃圾回收省资源,如:
    ```go
    mydata := data[m:n] //这里的mydata仍然共享原切片的底层数组
    r := make([]int, len(mydata))
    copy(r, mydata)

    //>Go 1.21可使用slices.Clone替代
    mydata := slices.Clone(data[:5])
    ```
- 推荐json序列化可使用`-`或`omitempty`或`omitzero`
- 推荐锁: sync.RWMutex或sync.map
- 推荐: slice/map/interface/fun/chan传参时,天然就是浅拷贝不需要手动传指针, 除非对其增加操作(如append) 亦或者 是数组[]或大struct类型时, 务必使用指针传参
- 善用defer,如defer a()()
- 注意chan要close
- 能用main()就不用init()
- 注意协程panic导致主进程挂掉, 且只能自己捕获
- 推荐多协程使用errgroup替代go func(){}
- 避免for i++{go func()}
- 避免fmt
- 避免全局变量被修改
- 注意判断sql.ErrNoRows
- 注意map需判断存在性
- 注意map的内容是无序的
- 推荐泛形
- 推荐工厂模式
- 使用Casbin依赖包设置权限
- 考虑到用户请求后,中途取消操作的情况


## Linux

* uid < 500 为系统用户
* 端口号<1024为系统预留端口, 非`root`用户不能启用监听(所以用`root`来启动`nginx`监听80)
* nobody为Linux非登录用户,其作为nginx运行用户可保证安全(用`root`用户启动后会降权为nobody用户运行)
* `Linux`的共享:`NFS`协议
* `windows`与`linux`共享:`SMB`协议(`Samba`软件)


* opessl自签名

```sh
openssl genrsa -out key.pem 2048

openssl req -new -key key.pem -out cert.pem #Common Name填写(泛)域名

openssl x509 -req -in cert.pem -out cert.pem -signkey key.pem -days 3650

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
    alias untar='tar -xzvf'
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
    export CF_Token="xxxxxx"
    export CF_Account_ID='xxx'
    export PATH=$PATH:/usr/local/bin:/usr/local/sbin:$GOPATH/bin/

    关闭终端响铃
    echo "set bell-style none" >> /etc/inputrc

    关闭ICMP响应
    echo "net.ipv4.icmp_echo_ignore_all = 1" >> /etc/sysctl.conf
    echo "net.ipv6.icmp.echo_ignore_all = 1" >> /etc/sysctl.conf
    开启BBR
    echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
    echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
    sysctl -p
    lsmod | grep bbr

    systemctl disable ufw && systemctl stop ufw
    修改主机名
    静态ip
    SSH修改端口+证书登录+禁止密码登录
    apt/docker/go源
    apt update && apt upgrade -y
    apt install -y ssh ca-certificates curl net-tools axel iftop htop zip git tig tree mtr proxychains4 screen acl dos2unix
    mtr(网络链)
    axel(多线程下载)
    docker安装
    k3s安装
    git配置
    Go安装
    fresh安装
    k3d安装
    apt autoclean -y && apt autoremove -y
    ```

* SSL证书申请 :

    详细说明:<https://github.com/acmesh-official/acme.sh/wiki/说明>

    1. 到[cloudflare](https://dash.cloudflare.com/profile)获取"编辑区域DNS"的权限码Token,[教程](https://github.com/acmesh-official/acme.sh/wiki/dnsapi)
        ``` sh
        export CF_Token="xxxxxxxxxxxxxx"
        export CF_Account_ID="xxx"
        source ~/.bashrc
        ```
    2. 安装acme.sh
        ``` sh
        curl https://get.acme.sh | sh -s email=xxx@qq.com
        ```
    3. 获取证书
        ``` sh
        acme.sh --issue --dns dns_cf -d "xxx.com" -d "*.xxx.com" \
        --yes-I-know-dns-manual-mode-enough-go-ahead-please
        ```
    4. 验证证书
        ``` sh
        acme.sh --renew -d "xxx.com" -d "*.xxx.com" \
        --yes-I-know-dns-manual-mode-enough-go-ahead-please --force
        ```
    5. 安装证书到别的位置
        ``` sh
        acme.sh --install-cert -d "xxx.com" -d "*.xxx.com" \
        --key-file /var/www/cert/tls.key \
        --fullchain-file /var/www/cert/tls.crt \
        --reloadcmd "docker exec nginx nginx -t && docker exec nginx /bin/bash -c 'service nginx force-reload && exit'"
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
    `git add -A 和 git commit –m 'feat: 新功能'`
    > 10. 提交项目到origin仓库的master分支
    `git push origin master --tags`

* git hook :
    > * 第三方仓库git hook
    > * 服务器部署git裸仓库

* 备注规范 :
  - feat: 新功能
  - fix: 修复 bug
  - refactor: 不改变功能逻辑的前提下的改动, 重构
  - chore: 其他杂项修改
  - docs: 文档变动,如README.md、接口文档
  - test: 添加或修正测试代码
  - style: 代码格式化
  - perf: 提升性能的改动
  - ci: 持续集成相关配置修改
  - revert: 撤销之前的提交



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

* `ARP` : 保存 `IP` 与 `mac` 地址的映射列表,没有则会广播
* `TCP` :需要三次握手,建立了 `TCP` 虚拟通道,之后, `TCP` 运输 `HTTP流`
* `SSL` : 负责 `HTTP` 的安全加密工作, 已被淘汰
* `TLS` : `TLS`由 `SSL3.0` 的基础上重新设计而来,形成: `TCP连接时间` + `TLS 连接时间` + `HTTP交易时间`
* `HTTPS` : 由 `TLS` 安全保护的 `HTTP`，称之为 `HTTPS` 。
* `HTTP/2` : 多路复用, 在单一的 TCP 连接上，同时并发传输多个请求和响应
* `QUIC` : `http/2` 去掉 `TCP` ,改用不需要连接的 `UDP`,并内置 `TLS1.3`
* `HTTP/3` : 把 `QUIC` 与 `HTTP` 分离,形成: `UDP / QUIC / HTTP`
* 使用 `IPv4` 进行路由，使用 `TCP` 进行连接层面的流量控制，使用 `SSL/TLS` 协议实现传输安全，使用 `DNS` 进行域名解析，使用 `HTTP` 进行应用数据的传输。
* `TCP/IP` 连接 + `http` 传输 --> 网卡 --> 内核(通过资源包的四元组信息,信息的其中之二是访问的 `IP+端口` ) --> `socket`(它是linux资源,是网络与进程的中介,储存着端对端的四元组信息,被进程使用) --> 进程

| OSI | 协议 | 描述 |
| :--- | :--- | :--- |
| L1物理层 |  |  |
| L2数据链路层 | 以太网/wifi/ARP |  |
| L3网络层 | IPv4/ICMP |  |
| L4传输层 | TCP/UDP/QUIC |  |
| L5会话层 | RPC |  |
| L6表示层 | TLS/SSL/ASCII/Base64 |  |
| L7应用层 | HTTP/SSH/DNS/FTP |  |



## 隧道

* 隧道是一种技术,有 `SSH隧道` 和 `http隧道`
* 隧道的中间服务器是不参与流量分析的,只用来传输流量,只是用于简单的过度
* 代理是可以参与流量的处理的,比如 `http代理`
* `http隧道` 配合 `http` 的 `CONNECT报文`,解决了`http代理` 不能传输 `https流量`(因为 `https` 是端对端的加密,没有中间人)的问题
*  `CONNECT报文`的方法只能用于 `tcp流量` ,而 `SOCKS5` 可以代替 `CONNECT报文` 的方法,且可以传输`UDP`
* 大致原理: `本地---(1)--->代理---(2)--->服务器`; 首先过程`(1)` 本地使用 `SOCKS5` 或 `http` 的 `CONNECT报文`请求与代理就建立了隧道,后续就能直接传输`https`, 过程 `(2)` 使用 也是正常的`https`, ;

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

实现 `读写分离` 的两步 :
* 主从同步
* 读写分离;有两种方式 :
    * 通过框架代码实现,性能最好;
    * 使用中间件/代理工具,如: `Mycat`/`ProxySQL`


> `mysql` 之间可相互主从同步,避免 `单点` ;当有主从数据库发生宕机,可使用 `percona-tooldit` 工具解决恢复宕机后主从数据不同步的问题


## 数据库

### 安全修改数据思路(Mysql使用默认RR模式的前提下)
#### 原子更新
```go
mysql.exec("BEGIN");

//...其他操作,如记录流水

//不需要前置查询id的存在性, 直接update
num := mysql.exec("UPDATE user SET balance = balance-? WHERE id = ? AND balance >= ?", pay, id, pay);

//判断受影响行数
if num == 0 {
    mysql.exec("ROLLBACK");
    return "余额不足或用户不存在"
}

mysql.exec("COMMIT");
```

#### 乐观锁
```go
//当需要直接修改字段为某个字而不是增加或减少数量时,则改为新增并利用version字段, 改为如下:
//乐观锁需重试
for range 3 {
    id,version := mysql.exec("SELECT id,version FROM user WHERE name = 'admin'");

    mysql.exec("BEGIN");

    num := mysql.exec("UPDATE user SET balance = 100, version=version+1 WHERE id = ? AND version = ?",id,version);
    // 版本失效或被并发抢占
    if num == 0 {
        mysql.exec("ROLLBACK");

        // 短暂随机休眠，防止并发线程同步重试再次冲突
        sleepRandom(10ms, 50ms);
        continue;
    }

    //...其他操作,如记录流水

    mysql.exec("COMMIT");
    return "成功";
}
return "并发冲突频繁，更新失败";
```

#### 悲观锁
```go
//业务逻辑极度复杂，单条 UPDATE 写不出来, 改为如下:
mysql.exec("BEGIN");
balance := mysql.exec("SELECT balance FROM user WHERE id = ? FOR UPDATE", id);

//...进行复杂的本地业务逻辑运算
balance = handle(balance)

mysql.exec("UPDATE user SET balance = ? WHERE id = ?", balance, id);
mysql.exec("COMMIT");
```

> `mysql8` 特性 :
> * `utf8mb4` 储存表情符号
> * 降序索引
> * JSON支持,直接操作json里的数据
> * 跳过锁等待
> * 用户角色管理权限
> * `innodb_dedicated_server` 自适应参数,自动配置 `mysql`

* 出现不能连接数据库的情况,除了防火墙,也可能是数据库没有设置对外添加权限
* 出现用户不能登录的情况,可能是默认登录了 `匿名用户` , 要把用户名为 `''` 的用户清除
* `InnoDB` 存储引擎偏向于增删改事件,支持事务,支持索引行锁
* 索引可用 `for update` 行锁

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
    `select avg(name) from my_name`
    > `select sum(*)/count(*) from my_name`
* 最小值
    `select min(name) from my_name`

* 双重查询,查询指定最小值对应的的所有字段
    `SELECT * FROM my_name WHERE name=(SELECT max(name) FROM my_name)`
* 根据指定字段分类
    `select * from my_name group by name;`
* 表的联合查询
    `SELECT * FROM my_name as a INNER JOIN my_name2 as b on a.name=b.id`
* 左查询,就是当my_name跟my_name2的的值不相对应则以my_name为主要,my_name2多出的值则省略
    `SELECT * FROM my_name as a left JOIN my_name2 as b on a.name=b.id`





## PHP

* bug
  ``` php
  'a' == 0; //php7

  $a = '0.3' - '0.1';
  json_encode($a);
  0.55 * 100 == 55; //为false
  ```
* json_encode((array)$array, JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES|JSON_PRETTY_PRINT)
* 有时候exec命令执行失败,却没有报错,请这样使用:`exec('ls 2>&1', $a, $b)`
* `FastCGI`是`CGI协议`的改进版协议,用于定义 `Nginx` 调用 `php` 时的数据格式,并减少对 `php.ini` 的读取
* `php-fpm`是 PHP 的 FastCGI 进程管理器, Nginx通过 FastCGI 协议转发给它
* `htmlentities` / `htmlspecialchars` 可以过滤成 `html格式` , 防止 `XSS`
* 引用字符串方式: `Nowdoc` / `Heredoc`
* 中文简体格式
    `header('Content-type:text/html;charset=utf-8')`
* 单入口写上: `session_start()` 才可以使用 `$_SESSION`
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



**... 以上**
