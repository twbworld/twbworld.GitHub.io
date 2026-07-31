---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "解决Google AI Studio地区封禁"
subtitle: ""
summary: "利用wgcf生成WARP配置，结合Xray-core的原生WireGuard出站协议，实现无缝分流Google和Gemini流量。"

# 标签
tags:
- Proxy
- Network
- Xray

#关键字
keywords:
- Xray
- WARP
- wgcf
- WireGuard
- Google AI Studio
- 403 Forbidden

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
date: 2026-07-31T03:20:00-07:00
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
image:
  placement: 3
  image: ""
  caption: ""
  focal_point: "Center"
  preview_only: true
  alt_text: "Xray wgcf"
---

> `Google AI Studio` 和 `Gemini` 对IP的审查非常严格。如果你用作国内代理的VPS（特别是各大云服务商的数据中心IP）被识别为机房IP（问题并不是出在Google账号被封了），就会遇到 `403 Forbidden` 或“所在地区不受支持”的报错。解决思路很简单：在VPS与Google间走Cloudflare代理就好了,要封就封cf的ip好了。但安装`Cloudflare WARP`吧会被全局代理影响正常非google流量的速度, 恰好在 `Xray-core` 支持配置出站流量分流。

## 1. 使用 wgcf 生成 WARP 配置文件

首先，我们需要借助开源工具 `wgcf` 向 Cloudflare 注册一个免费的 WARP 账户，并提取出 WireGuard 节点信息。

在你的 VPS 上执行以下命令：

```bash
# 下载 wgcf (注意替换为当时的最新版本)
wget -O wgcf https://github.com/ViRb3/wgcf/releases/download/v2.2.32/wgcf_2.2.32_linux_amd64
chmod +x wgcf

# 注册 WARP 账户，接受协议
./wgcf register

# 生成 WireGuard 配置文件
./wgcf generate
```

执行完毕后，当前目录下会生成一个 `wgcf-profile.conf` 文件。
查看生成的配置：

```bash
cat wgcf-profile.conf
```

输出类似:

```ini
[Interface]
PrivateKey = yL0kApRiZW4VFfNkKAQ/nYxnMFT3AH0dfVkj1GAlr1k=
Address = 172.16.0.2/32
Address = 2606:4700:110:81f3:2a5b:3cad:9d4:9ea6/128
DNS = 1.1.1.1
MTU = 1280

[Peer]
PublicKey = bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=
AllowedIPs = 0.0.0.0/0
AllowedIPs = ::/0
Endpoint = 162.159.192.1:2408
```

下一步配置 Xray 时会用到。

对应关系:
`PrivateKey` → xray 的 `secretKey`
`Address` → xray 的 `address`
`PublicKey` → xray peers 的 `publicKey`
`Endpoint` → xray peers 的 `endpoint`

## 2. Xray 配置文件修改

打开你的 Xray 配置文件（如 `/usr/local/etc/xray/config.json`）。

### 2.1 添加 WireGuard 出站 (Outbounds)

在 `"outbounds"` 数组中，利用 Xray 原生的 `wireguard` 协议添加一个 WARP 出站。将你在上一步提取的信息填入对应位置：

```json
"outbounds": [
  {
    "protocol": "freedom",
    "tag": "direct"
  },
  {
    "protocol": "blackhole",
    "tag": "block"
  },
  {
    "protocol": "wireguard",
    "tag": "warp",
    "settings": {
      "secretKey": "yL0kApRiZW4VFfNkKAQ/nYxnMFT3AH0dfVkj1GAlr1k=",
      "address": [
        "172.16.0.2/32",
        "2606:4700:110:81f3:2a5b:3cad:9d4:9ea6/128"
      ],
      "peers": [
        {
          "publicKey": "bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=",
          "endpoint": "162.159.192.1:2408",
          "allowedIPs": ["0.0.0.0/0", "::/0"],
          "keepAlive": 25
        }
      ],
      "reserved": [0, 0, 0],
      "mtu": 1280,
      "noKernelTun": true,
      "domainStrategy": "ForceIP"
    }
  }
]
```

### 2.2 配置路由分流 (Routing)

在 `"routing"` -> `"rules"` 数组中，将 Google 相关的域名指向刚刚创建的 `warp-out` 标签。

> **⚠️核心避坑指南**：Xray 的路由规则是**从上到下按顺序匹配**的！为了防止之前的默认直连规则（如 `geosite:google` -> `direct`）抢占，**务必将这条 WARP 分流规则置于 `rules` 数组的最顶部**。

```json
"routing": {
  "domainStrategy": "AsIs",
  "rules": [
    // 必须放在数组最前
    {
      "type": "field",
      "outboundTag": "warp-out",
      "domain": [
        "geosite:google",
        "domain:aistudio.google.com",
        "domain:ai.google.dev",
        "domain:generativelanguage.googleapis.com",
        "domain:alkalimakersuite-pa.clients6.google.com",
        "domain:alkalicore-pa.clients6.google.com",
        "domain:webchannel-alkalimakersuite-pa.clients6.google.com",
        "domain:geller-pa.googleapis.com",
        "domain:proactivebackend-pa.googleapis.com",
        "domain:robinfrontend-pa.googleapis.com",
        "domain:gemini.google.com",
        "domain:gemini.gstatic.com",
        "domain:bard.google.com",
        "domain:makersuite.google.com",
        "domain:notebooklm.google.com",
        "domain:notebooklm-pa.googleapis.com",
        "domain:labs.google",
        "domain:jules.google.com"
      ]
    },
    // ... 其他原有规则（直连或阻断等）
  ]
}
```

## 3. 重启验证

完成修改并保存后，重启 Xray 服务：

```bash
systemctl restart xray
```

现在，通过你的本地客户端请求 Google AI Studio 的 API 或者是 Gemini 网页时，Xray 会在内部直接封包成 WireGuard 流量并发送给 Cloudflare WARP 节点。通过这种方式，既获得了 WARP 干净的解锁 IP，又保证了其他站点的直连速度，且避免了 `wg-quick` 乱改宿主机路由表的烦恼，可谓最极客的解法。
```
