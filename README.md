# MidsummerNightDream

**仲夏夜的银梦** — 利用旧设备部署 Hermes Agent 与端侧大模型的方案。

> 新设备如金，宝贵而耀眼；旧设备如银，廉价却依然可用。
> 让白银焕发新生，是一场变废为宝的幻梦——这就是"银梦"。

通过在旧 Android 设备（Termux）上运行 [Hermes Agent](https://github.com/NousResearch/hermes-agent)，让被遗忘在抽屉里的旧手机、平板重新成为可靠的私人 AI 助手。


## 项目背景

本项目将 Hermes Agent 适配至边缘设备，让你用闲置的旧手机、平板或低配电脑运行强大的 AI 助手。支持 Telegram、Discord 等多平台接入，实现 24 小时待机的私人服务。

## 核心脚本

| 脚本 | 功能 |
|------|------|
| `termux_setup.sh` | Termux 环境初始化：配置国内镜像源（阿里云、华为云）、安装 Git/Python/Rust/Node 等依赖 |
| `install.sh` | Hermes Agent 安装：创建虚拟环境、安装 `hermes-agent[termux]` 并符号链接可执行文件 |
| `service.sh` | 后台服务启动：Termux 保持唤醒 + SSH 服务 + Hermes Gateway |
| `ollama.sh` | Ollama 本地模型启动（可选）|

## 快速开始

### 前置要求

- Android 设备（Termux App）
- SSH 客户端（可选，方便远程操作）

### 安装步骤

1. **安装 Termux**

   从 F-Droid 或 GitHub 下载最新版 Termux（避免使用 Google Play 版本）。

2. **下载本代码仓**

   ```bash
   git clone https://github.com/AAAHQZ/MidsummerNightDream.git
   ```

   注：使用任何方式下载本代码仓，复制粘贴脚本也行。

3. **初始化 Termux 环境（适配国内镜像源）**

   ```bash
   sh termux_setup.sh
   ```

   注：Termux 环境下部分包需要源码编译，耗时较长。

4. **安装 Hermes Agent**

   ```bash
   sh install.sh
   ```

   注：Termux 环境下大部分 Python 包需要源码编译，耗时较长。

5. **配置并启动服务**

   ```bash
   hermes setup
   ```

   参考 [Hermes Agent 官方文档](https://hermes-agent.nousresearch.com/docs/) 进行配置。

### [ 进阶选项 ]Ollama 本地模型

如果你的设备性能较强，可以尝试使用 Ollama 本地启动一个小模型供 Hermes Agent 使用：

```bash
sh ollama.sh
```

注意：当前选项不完善，仅供参考

## 验证记录

### 1. 华为平板M6
|  |  |
| - | - |
|型号 |HUAWEI M6 |
|处理器 |Huawei Kirin 980 |
|内存 |4.0 GB |

#### 验证项
- ✔ ollama qwen3.5 0.8b
- ✔ hermes-agent
- ✗ hermes-agent + ollama qwen3.5 0.8b
- ✔ hermes-agent + hermes-gateway with wechat
- ✗ hermes-agent + hermes-gateway with wechat + ollama 

#### 问题
M6内存过小，ollama无法设置足够上下文


## 文档

- [Hermes Agent 官方文档](https://hermes-agent.nousresearch.com/docs/)
- [Termux 安装指南](https://hermes-agent.nousresearch.com/docs/getting-started/termux)

## 引用

本项目基于 [Hermes Agent (Nous Research)](https://github.com/NousResearch/hermes-agent) 构建。
