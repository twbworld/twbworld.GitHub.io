---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Centos源码安装Mysql8笔记"
subtitle: ""
summary: "最近试着安装做新版的mysql,过程中出现一些坎坷,所以记录下来"

# 标签
tags: 
- mysql

#关键字
keywords:
- mysql
- mysql8
- 源码安装mysql8
- centos

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
date: 2020-05-30T20:47:16+08:00
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
  image: "https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200530205723.png"
  caption: "图片来源: [**github**](https://mengxu2018.github.io/2019/03/09/mysql8-centos7-setup/)"
  focal_point: "Center"
  preview_only: true
  alt_text: "mysql8"

# 文章页最头部的图片,如果当前目录下没有featured.jpg/png文件,且,三方image没设置image,则列表页也会显示这图片(image如设置了image,此处无效)
#header:
#  placement: 3
#  image: "https://cdn.jsdelivr.net/gh/twbworld/hosting@master/img/20200530205723.png"
#  caption: "图片来源: [**github**](https://mengxu2018.github.io/2019/03/09/mysql8-centos7-setup/)"
#  focal_point: "Center"
#  preview_only: false
#  alt_text: "mysql8"


---




## 笔记一: 安装时,发生警告


```shell

--character-set-server: 'utf8' is currently an alias for the character set UTF8MB3, but will be an alias for UTF8MB4 in a future release. Please consider using UTF8MB4 in order to be unambiguous
--collation-server: 'utf8_general_ci' is a collation of the deprecated character set UTF8MB3. Please consider using UTF8MB4 with an appropriate collation instead

```


原因 :
> 安装mysql8的时候,配置了官方不推荐的"utf8",其实"utf8"就是mysql中"UTF8MB3"的别名,然而又同时存在着"UTF8MB4",所有,建议改为"UTF8MB4";

解决 :
> 把cmake的参数 `-DDEFAULT_CHARSET=utf8` 改为 `-DDEFAULT_CHARSET=utf8mb4 ` , `-DDEFAULT_COLLATION=utf8_general_ci` 改为 `-DDEFAULT_COLLATION=utf8mb4_unicode_ci`

给出完整cmake命令 :

```shell

# 切换到mysql8解压后的目录
cd /usr/local/mysql8/

# 新建并切换build目录
mkdir build
cd build

# 编译前的配置;其中的"DCMAKE_INSTALL_PREFIX", "DMYSQL_DATADIR", "DWITH_BOOST" 按照自己的情况配置
cmake .. -DCMAKE_INSTALL_PREFIX=/usr/local/mysql8 \
-DMYSQL_DATADIR=/usr/local/mysql8/data \
-DSYSCONFDIR=/etc \
-DWITH_MYISAM_STORAGE_ENGINE=1 \
-DWITH_INNOBASE_STORAGE_ENGINE=1 \
-DWITH_MEMORY_STORAGE_ENGINE=1 \
-DWTH_READLINE=1 \
-DMYSQL_TCP_PORT=3306 \
-DENABLED_LOCAL_INFILE=1 \
-DWITH_PARTITION_STORAGE_ENGINE=1 \
-DEXTRA_CHARSETS=all -DDEFAULT_CHARSET=utf8mb4 \
-DDEFAULT_COLLATION=utf8mb4_unicode_ci \
-DWITH_BOOST=/usr/local/boost_1_70_0

```

> 安装后,可以看到 `/etc/my.cnf` 设置为 `collation-server = utf8mb4_unicode_ci` `character-set-server = utf8mb4`


----



## 笔记二: 创建my.cnf


在/etc目录下没有发现my.cnf(我的mysql版本是mysql-8.0.20), 只能自己创建了 :

`vim /etc/my.cnf`

```

# 客户端设置
[client]
port = 3306
# 默认情况下，socket文件应为/usr/local/mysql/mysql.socket,所以可以ln -s xx  /tmp/mysql.sock
socket = /tmp/mysql.sock 

# 服务端设置
[mysqld]

##########################################################################################################
# 基础信息
#Mysql服务的唯一编号 每个mysql服务Id需唯一
server-id = 1

#服务端口号 默认3306
port = 3306

# 启动mysql服务进程的用户
user = mysql

##########################################################################################################
# 安装目录相关
# mysql安装根目录
basedir = /usr/local/mysql8

# mysql数据文件所在位置
datadir = /usr/local/mysql8/data

# 临时目录 比如load data infile会用到,一般都是使用/tmp
tmpdir  = /tmp

# 设置socke文件地址
socket  = /tmp/mysql.sock


##########################################################################################################
# 事务隔离级别，默认为可重复读（REPEATABLE-READ）。（此级别下可能参数很多间隙锁，影响性能，但是修改又影响主从复制及灾难恢复，建议还是修改代码逻辑吧）
# 隔离级别可选项目：READ-UNCOMMITTED  READ-COMMITTED  REPEATABLE-READ  SERIALIZABLE
# transaction_isolation = READ-COMMITTED
transaction_isolation = REPEATABLE-READ

##########################################################################################################
# 数据库引擎与字符集相关设置

# mysql 5.1 之后，默认引擎就是InnoDB了
default_storage_engine = InnoDB
# 内存临时表默认引擎，默认InnoDB
default_tmp_storage_engine = InnoDB

#数据库默认字符集,主流字符集支持一些特殊表情符号（特殊表情符占用4个字节）
character-set-server = utf8mb4

#数据库字符集对应一些排序等规则，注意要和character-set-server对应
collation-server = utf8mb4_unicode_ci

# 设置client连接mysql时的字符集,防止乱码
# init_connect='SET NAMES utf8'


##########################################################################################################
# 数据库连接相关设置
# 最大连接数，可设最大值16384，一般考虑根据同时在线人数设置一个比较综合的数字，鉴于该数值增大并不太消耗系统资源，建议直接设10000
# 如果在访问时经常出现Too Many Connections的错误提示，则需要增大该参数值
max_connections = 10000

# 默认值100，最大错误连接数，如果有超出该参数值个数的中断错误连接，则该主机将被禁止连接。如需对该主机进行解禁，执行：FLUSH HOST
# 考虑高并发场景下的容错，建议加大。
max_connect_errors = 10000

# MySQL打开的文件描述符限制，默认最小1024;
# 当open_files_limit没有被配置的时候，比较max_connections*5和ulimit -n的值，哪个大用哪个，
# 当open_file_limit被配置的时候，比较open_files_limit和max_connections*5的值，哪个大用哪个。
open_files_limit = 65535

# 注意：仍然可能出现报错信息Can't create a new thread；此时观察系统cat /proc/mysql进程号/limits，观察进程ulimit限制情况
# 过小的话，考虑修改系统配置表，/etc/security/limits.conf和/etc/security/limits.d/90-nproc.conf

# MySQL默认的wait_timeout  值为8个小时, interactive_timeout参数需要同时配置才能生效
# MySQL连接闲置超过一定时间后(单位：秒，此处为1800秒)将会被强行关闭
interactive_timeout = 1800 
wait_timeout = 1800 

# 在MySQL暂时停止响应新请求之前的短时间内多少个请求可以被存在堆栈中 
# 官方建议back_log = 50 + (max_connections / 5),封顶数为900
back_log = 900

##########################################################################################################
# 数据库数据交换设置
# 该参数限制服务器端，接受的数据包大小，如果有BLOB子段，建议增大此值，避免写入或者更新出错。有BLOB子段，建议改为1024M
max_allowed_packet = 128M

##########################################################################################################
# 内存，cache与buffer设置


# 内存临时表的最大值,默认16M，此处设置成128M
tmp_table_size = 64M
# 用户创建的内存表的大小，默认16M，往往和tmp_table_size一起设置，限制用户临师表大小。
# 超限的话，MySQL就会自动地把它转化为基于磁盘的MyISAM表，存储在指定的tmpdir目录下，增大IO压力，建议内存大，增大该数值。
max_heap_table_size = 64M



# 表示这个mysql版本是否支持查询缓存。ps：SHOW STATUS LIKE 'qcache%'，与缓存相关的状态变量。
# have_query_cache



# 在一个事务中binlog为了记录SQL状态所持有的cache大小
# 如果你经常使用大的,多声明的事务,你可以增加此值来获取更大的性能.
# 所有从事务来的状态都将被缓冲在binlog缓冲中然后在提交后一次性写入到binlog中
# 如果事务比此值大, 会使用磁盘上的临时文件来替代.
# 此缓冲在每个连接的事务第一次更新状态时被创建
binlog_cache_size = 1M



#*** MyISAM 相关选项
# 指定索引缓冲区的大小, 为MYISAM数据表开启供线程共享的索引缓存,对INNODB引擎无效。相当影响MyISAM的性能。
# 不要将其设置大于你可用内存的30%,因为一部分内存同样被OS用来缓冲行数据
# 甚至在你并不使用MyISAM 表的情况下, 你也需要仍旧设置起 8-64M 内存由于它同样会被内部临时磁盘表使用.
# 默认值 8M，建议值：对于内存在4GB左右的服务器该参数可设置为256M或384M。注意：该参数值设置的过大反而会是服务器整体效率降低！
key_buffer_size = 64M

# 为每个扫描MyISAM的线程分配参数设置的内存大小缓冲区。 
# 默认值128kb，建议值：16G内存建议1M，4G：128kb或者256kb吧
# 注意，该缓冲区是每个连接独占的，所以总缓冲区大小为 128kb*连接数；极端情况128kb*maxconnectiosns，会超级大，所以要考虑日常平均连接数。
# 一般不需要太关心该数值，稍微增大就可以了，
read_buffer_size = 262144 

# 支持任何存储引擎
# MySQL的随机读缓冲区大小，适当增大，可以提高性能。
# 默认值256kb；建议值：得参考连接数，16G内存，有人推荐8M
# 注意，该缓冲区是每个连接独占的，所以总缓冲区大小为128kb*连接数；极端情况128kb*maxconnectiosns，会超级大，所以要考虑日常平均连接数。
read_rnd_buffer_size = 1M

# order by或group by时用到 
# 支持所有引擎，innodb和myisam有自己的innodb_sort_buffer_size和myisam_sort_buffer_size设置
# 默认值256kb；建议值：得参考连接数，16G内存，有人推荐8M.
# 注意，该缓冲区是每个连接独占的，所以总缓冲区大小为 1M*连接数；极端情况1M*maxconnectiosns，会超级大。所以要考虑日常平均连接数。
sort_buffer_size = 1M

# 此缓冲被使用来优化全联合(full JOINs 不带索引的联合)
# 类似的联合在极大多数情况下有非常糟糕的性能表现,但是将此值设大能够减轻性能影响.
# 通过 “Select_full_join” 状态变量查看全联合的数量
# 注意，该缓冲区是每个连接独占的，所以总缓冲区大小为 1M*连接数；极端情况1M*maxconnectiosns，会超级大。所以要考虑日常平均连接数。
# 默认值256kb;建议值：16G内存，设置8M.
join_buffer_size = 1M

# 缓存linux文件描述符信息，加快数据文件打开速度
# 它影响myisam表的打开关闭，但是不影响innodb表的打开关闭。
# 默认值2000，建议值：根据状态变量Opened_tables去设定
table_open_cache = 2000

# 缓存表定义的相关信息，加快读取表信息速度
# 默认值1400，最大值2000，建议值：基本不改。
table_definition_cache = 1400
# 该参数是myssql 5.6后引入的，目的是提高并发。
# 默认值1，建议值：cpu核数，并且<=16
table_open_cache_instances = 2

# 当客户端断开之后，服务器处理此客户的线程将会缓存起来以响应下一个客户而不是销毁。可重用，减小了系统开销。
# 默认值为9，建议值：两种取值方式，方式一，根据物理内存，1G  —> 8；2G  —> 16； 3G  —> 32； >3G  —> 64；
# 方式二，根据show status like  'threads%'，查看Threads_connected值。
thread_cache_size = 16

# 默认值256k,建议值：16/32G内存，512kb，其他一般不改变，如果报错：Thread stack overrun，就增大看看,
# 注意，每个线程分配内存空间，所以总内存空间。。。你懂得。
thread_stack = 512k


##########################################################################################################
# 日志文件相关设置，一般只开启三种日志，错误日志，慢查询日志，二进制日志。普通查询日志不开启。

# 普通查询日志，默认值off，不开启
general_log = 0
# 普通查询日志存放地址
general_log_file = /usr/local/mysql8/log/mysql-general.log

# 全局动态变量，默认3，范围：1～3
# 表示错误日志记录的信息，1：只记录error信息；2：记录error和warnings信息；3：记录error、warnings和普通的notes信息。
log_error_verbosity = 2
# 错误日志文件地址
log_error = /usr/local/mysql8/log/mysql-error.log


# 开启慢查询
slow_query_log = 1

# 开启慢查询时间，此处为1秒，达到此值才记录数据
long_query_time = 3

# 检索行数达到此数值，才记录慢查询日志中
min_examined_row_limit = 100

# mysql 5.6.5新增，用来表示每分钟允许记录到slow log的且未使用索引的SQL语句次数，默认值为0，不限制。
log_throttle_queries_not_using_indexes = 0

# 慢查询日志文件地址
slow_query_log_file = /usr/local/mysql8/log/mysql-slow.log

# 开启记录没有使用索引查询语句
log-queries-not-using-indexes = 1


# 开启二进制日志
log_bin = /usr/local/mysql8/log/mysql-bin.log
# mysql清除过期日志的时间，默认值30*24*60*60，
binlog_expire_logs_seconds=604800
# 如果二进制日志写入的内容超出给定值，日志就会发生滚动。你不能将该变量设置为大于1GB或小于4096字节。 默认值是1GB。
max_binlog_size = 1000M
# binlog的格式也有三种：STATEMENT，ROW，MIXED。mysql 5.7.7后，默认值从 MIXED 改为 ROW
# 关于binlog日志格式问题，请查阅网络资料
binlog_format = row
# 默认值N=1，使binlog在每N次binlog写入后与硬盘同步，ps：1最慢
# sync_binlog = 1 

##########################################################################################################
# innodb选项

# 说明：该参数可以提升扩展性和刷脏页性能。
# 默认值1，建议值：4-8；并且必须小于innodb_buffer_pool_instances
innodb_page_cleaners = 4

# 说明：一般8k和16k中选择，8k的话，cpu消耗小些，selcet效率高一点，一般不用改
# 默认值：16k；建议值：不改，
innodb_page_size = 16384

# 说明：InnoDB使用一个缓冲池来保存索引和原始数据, 不像MyISAM.这里你设置越大,你在存取表里面数据时所需要的磁盘I/O越少.
# 在一个独立使用的数据库服务器上,你可以设置这个变量到服务器物理内存大小的60%-80%
# 注意别设置的过大，会导致system的swap空间被占用，导致操作系统变慢，从而减低sql查询的效率
# 默认值：128M，建议值：物理内存的60%-80%
innodb_buffer_pool_size = 512M

# 说明:只有当设置 innodb_buffer_pool_size 值大于1G时才有意义，小于1G，instances默认为1，大于1G，instances默认为8
# 但是网络上有评价，最佳性能，每个实例至少1G大小。
# 默认值：1或8，建议值：innodb_buffer_pool_size/innodb_buffer_pool_instances >= 1G
innodb_buffer_pool_instances = 1

# 说明：mysql 5.7 新特性，defines the chunk size for online InnoDB buffer pool resizing operations.
# 实际缓冲区大小必须为innodb_buffer_pool_chunk_size*innodb_buffer_pool_instances*倍数，取略大于innodb_buffer_pool_size
# 默认值128M，建议值：默认值就好，乱改反而容易出问题，它会影响实际buffer pool大小。
innodb_buffer_pool_chunk_size = 128M 

# 在启动时把热数据加载到内存。默认值为on，不修改
innodb_buffer_pool_load_at_startup = 1
# 在关闭时把热数据dump到本地磁盘。默认值为on，不修改
innodb_buffer_pool_dump_at_shutdown = 1

# 说明：影响Innodb缓冲区的刷新算法，建议从小到大配置，直到zero free pages；innodb_lru_scan_depth * innodb_buffer_pool_instances defines the amount of work performed by the page cleaner thread each second.
# 默认值1024，建议值: 未知
innodb_lru_scan_depth = 1024

# 说明：事务等待获取资源等待的最长时间，单位为秒，看具体业务情况，一般默认值就好
# 默认值：50，建议值：看业务。
innodb_lock_wait_timeout = 60

# 说明：设置了Mysql后台任务（例如页刷新和merge dadta from buffer pool）每秒io操作的上限。
# 默认值：200，建议值：方法一，单盘sata设100，sas10，raid10设200，ssd设2000，fushion-io设50000；方法二，通过测试工具获得磁盘io性能后，设置IOPS数值/2。
innodb_io_capacity = 2000
# 说明：该参数是所有缓冲区线程io操作的总上限。
# 默认值：innodb_io_capacity的两倍。建议值：例如用iometer测试后的iops数值就好
innodb_io_capacity_max = 4000

# 说明：控制着innodb数据文件及redo log的打开、刷写模式，三种模式：fdatasync(默认)，O_DSYNC，O_DIRECT
# fdatasync：数据文件，buffer pool->os buffer->磁盘；日志文件，buffer pool->os buffer->磁盘；
# O_DSYNC：  数据文件，buffer pool->os buffer->磁盘；日志文件，buffer pool->磁盘；
# O_DIRECT： 数据文件，buffer pool->磁盘；           日志文件，buffer pool->os buffer->磁盘；
# 默认值为空，建议值：使用SAN或者raid，建议用O_DIRECT，不懂测试的话，默认生产上使用O_DIRECT
innodb_flush_method = O_DIRECT


# 说明：mysql5.7之后默认开启，意思是，每张表一个独立表空间。
# 默认值1，开启
innodb_file_per_table = 1

# 说明：The path where InnoDB creates undo tablespaces.通常等于undo log文件的存放目录。
# 默认值./;自行设置
innodb_undo_directory = /usr/local/mysql8/log
# 说明：5.7.5后开始使用，在线收缩undo log使用的空间。
# 默认值：关闭，建议值：开启
innodb_undo_log_truncate = 1
# 说明：结合innodb_undo_log_truncate，实现undo空间收缩功能
# 默认值：1G，建议值，不改。
innodb_max_undo_log_size = 1G

# 说明：重作日志文件的存放目录
innodb_log_group_home_dir = /usr/local/mysql8/log
# 说明：日志文件的大小
# 默认值:48M,建议值：根据你系统的磁盘空间和日志增长情况调整大小
innodb_log_file_size = 128M
# 说明：日志组中的文件数量，mysql以循环方式写入日志
# 默认值2，建议值：根据你系统的磁盘空间和日志增长情况调整大小
innodb_log_files_in_group = 3
# 此参数确定些日志文件所用的内存大小，以M为单位。缓冲区更大能提高性能，但意外的故障将会丢失数据。MySQL开发人员建议设置为1－8M之间
innodb_log_buffer_size = 16M



# 说明：可以控制log从系统buffer刷入磁盘文件的刷新频率，增大可减轻系统负荷
# 默认值是1；建议值不改。系统性能一般够用。
innodb_flush_log_at_timeout = 1
# 说明：参数可设为0，1，2；
# 参数0：表示每秒将log buffer内容刷新到系统buffer中，再调用系统flush操作写入磁盘文件。
# 参数1：表示每次事物提交，将log buffer内容刷新到系统buffer中，再调用系统flush操作写入磁盘文件。
# 参数2：表示每次事物提交，将log buffer内容刷新到系统buffer中，隔1秒后再调用系统flush操作写入磁盘文件。
innodb_flush_log_at_trx_commit = 1


# 说明：限制Innodb能打开的表的数据，如果库里的表特别多的情况，请增加这个。
# 值默认是2000，建议值：参考数据库表总数再进行调整，一般够用不用调整。
innodb_open_files = 8192

# innodb处理io读写的后台并发线程数量，根据cpu核来确认，取值范围：1-64
# 默认值：4，建议值：与逻辑cpu数量的一半保持一致。
innodb_read_io_threads = 4
innodb_write_io_threads = 4
# 默认设置为 0,表示不限制并发数，这里推荐设置为0，更好去发挥CPU多核处理能力，提高并发量
innodb_thread_concurrency = 0
# 默认值为4，建议不变。InnoDB中的清除操作是一类定期回收无用数据的操作。mysql 5.5之后，支持多线程清除操作。
innodb_purge_threads = 4 

# 说明：mysql缓冲区分为new blocks和old blocks；此参数表示old blocks占比；
# 默认值：37，建议值，一般不动
innodb_old_blocks_pct = 37
# 说明：新数据被载入缓冲池，进入old pages链区，当1秒后再次访问，则提升进入new pages链区。
# 默认值：1000
innodb_old_blocks_time=1000
# 说明：开启异步io，可以提高并发性，默认开启。
# 默认值为1，建议不动
innodb_use_native_aio = 1

# 说明：默认为空，使用data目录，一般不改。
innodb_data_home_dir=/usr/local/mysql8/data
# 说明：Defines the name, size, and attributes of InnoDB system tablespace data files.
# 默认值，不指定，默认为ibdata1:12M:autoextend
innodb_data_file_path = ibdata1:12M:autoextend


# 说明：The crash recovery mode。只有紧急情况需要恢复数据的时候，才改为大于1-6之间数值，含义查下官网。
# 默认值为0；
#innodb_force_recovery = 0

##########################################################################################################
# 其他。。。。
# 参考http://www.kuqin.com/database/20120815/328905.html
# skip-external-locking

# 禁止MySQL对外部连接进行DNS解析，使用这一选项可以消除MySQL进行DNS解析的时间。
# 缺点：所有远程主机连接授权都要使用IP地址方式，因为只认得ip地址了。
# skip_name_resolve = 0

# 默认值为off,timestamp列会自动更新为当前时间，设置为on|1，timestamp列的值就要显式更新
explicit_defaults_for_timestamp = 1




[mysqldump]
# quick选项强制 mysqldump 从服务器查询取得记录直接输出而不是取得所有记录后将它们缓存到内存中
quick
max_allowed_packet = 16M

[mysql]
# mysql命令行工具不使用自动补全功能，建议还是改为
# no-auto-rehash
auto-rehash
socket = /tmp/mysql.sock

```


创建my.cnf后

```shell
# 切换到安装目录
cd /usr/local/mysql8

# 创建相关文件
mkdir data log
chown -R mysql:mysql data log

# 初始化mysql, --defaults-file的参数就是刚才创建的配置文件, --basedir的参数就是mysql安装目录, --datadir的参数就是mysql数据目录
./bin/mysqld --defaults-file=/etc/my.cnf --initialize --user=mysql --basedir=/usr/local/mysql8/ --datadir=/usr/local/mysql8/data/

# 会返回类似代码
  [System] [MY-013169] [Server] /usr/local/mysql8/bin/mysqld (mysqld 8.0.20) initializing of server in progress as process 48055
  [System] [MY-013576] [InnoDB] InnoDB initialization has started.
  [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
  [Note] [MY-010454] [Server] A temporary password is generated for root@localhost: =tsSl-.Wt3ud
# "root@localhost:" 后边跟着就是mysql为root生成的临时密码,记下来,开启mysql后,可以用这个密码登录(如果没返回上述代码,则查看日志,如: vim log/mysql-error.log)

```

开启并修改root密码

```shell

cd /usr/local/mysql8

# 开启mysql
./support-files/mysql.server start

# 登录并输入刚才记下的临时密码
./bin/mysql -uroot -p

# 修改root密码
mysql> alter user 'root'@'localhost' identified by "123456";

```

----



## 笔记三: 开关mysql

```
cd /usr/local/mysql8

# 开启mysql进程
./bin/mysqld -u mysql
# 关闭mysql进程
./bin/mysqladmin -uroot shutdown

# 开启mysqld的守护进程,实际上是开启mysqld,当mysqld意外关闭时,mysqld_safe自动重启mysqld(可添加--skip-grant-tables参数,root可免密登录)
./bin/mysqld_safe --user=mysql &
# 关闭mysqld的守护进程
./bin/mysqladmin -uroot shutdown

# 开启mysql服务,实际是开启mysqld_safe
./support-files/mysql.server start
# 关闭mysql服务
./support-files/mysql.server stop

# 登录mysql
./bin/mysql -uroot -p

# 软连接(软连接的源文件路径要写成绝对路径)
ln -s /usr/local/mysql8/bin/* /usr/local/bin/
# 启动设置
cp support-files/mysql.server /etc/init.d/mysql.server

```



