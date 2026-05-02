# MidsummerNightDream

**仲夏夜的银梦** — 利用旧设备部署 Hermes Agent 与端侧大模型的方案。

> 新设备如金，宝贵而耀眼；旧设备如银，廉价却依然可用。
> 让白银焕发新生，是一场变废为宝的幻梦——这就是"银梦"。

通过在 旧Android 设备（Termux）上运行 [Hermes Agent](https://github.com/NousResearch/hermes-agent)，让被遗忘在抽屉里的旧手机、平板重新成为可靠的私人 AI 助手。

## 项目背景

本项目将 Hermes Agent 适配至边缘设备，让你用闲置的旧手机、平板或低配电脑运行强大的 AI 助手。支持 Telegram、Discord 等多平台接入，实现 24 小时待机的私人服务。

## 核心脚本

| 脚本 | 功能 |
|------|------|
| `install.sh` | Termux 环境初始化：配置国内镜像源（阿里云、华为云）、安装 Git/Python/Rust/Node 等依赖 |
| `termux_setup.sh` | Hermes Agent Termux 专用安装：创建虚拟环境、安装 `hermes-agent[termux]` 并符号链接可执行文件 |
| `service.sh` | 后台服务启动脚本：Termux 保持唤醒 + SSH 服务 + Hermes Gateway |

## 快速开始

### 前置要求

- Android 设备（Termux App）
- SSH 客户端 [ 可选:方便操作 ]

### 安装步骤

**1. 安装 Termux**

从 F-Droid 或 GitHub 下载最新版 Termux（避免使用 Google Play 版本）。

**2. 下载本代码仓**

使用任何方式下载本代码仓，复制粘贴脚本也行。

```bash
git clone https://github.com/AAAHQZ/MidsummerNightDream.git
```

**3. 初始化termux环境 （适配国内镜像源）**
执行termux_setup.sh脚本。
注意：termux环境下部分包需要源码编译，耗时较长。

```bash
# 重新加载环境后执行
sh termux_setup.sh
```

**4. 安装hermes-agent**
执行install.sh脚本。
注意：termux环境下大部分python包需要源码编译，耗时较长。

```bash
# 重新加载环境后执行
sh install.sh
```

**4. 配置并启动服务**
参考hermes-agent文档操作即可

```bash
# 设置hermes
hermes setup
```

### 进阶选项：ollama本地模型
如果你的设备很强大，可以尝试使用ollma本地启动一个小的大模型用于hermes-agent

``` bash
sh ollama.sh
```

## 文档

- [Hermes Agent 官方文档](https://hermes-agent.nousresearch.com/docs/)
- [Termux 安装指南](https://hermes-agent.nousresearch.com/docs/getting-started/termux)

## 引用
[./hermes-agent](https://codeload.github.com/NousResearch/hermes-agent/zip/refs/heads/main)
