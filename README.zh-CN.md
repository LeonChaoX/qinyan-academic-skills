# 沁言学术科研 Skills — Nature 风格论文写作工作流

_188 个可安装 AI Agent Skills，重点提供 Nature 风格科学写作、论文润色、投稿前评审、科研绘图与统计分析工作流。_

[English](./README.md) · **简体中文** · [繁體中文](./README.zh-TW.md) · [日本語](./README.ja-JP.md) · [한국어](./README.ko-KR.md)

[![Skills](https://img.shields.io/badge/skills-188-2ea44f.svg)](#-skills-分类)
[![Nature skills: 5 workflows](https://img.shields.io/badge/Nature%20skills-5%20workflows-1f6feb.svg)](./NATURE-SKILLS.md)
[![Categories](https://img.shields.io/badge/categories-18-0969da.svg)](#-skills-分类)
[![Agent support](https://img.shields.io/badge/agents-6-8250df.svg)](#-支持的-agent)
[![License: MIT](https://img.shields.io/badge/license-MIT-f5c518.svg)](./LICENSE)

沁言学术科研 Skills 为 Claude Code、Codex、Cursor、Gemini CLI、OpenClaw 和 OpenCode 提供可复用的科研能力。仓库收录 **18 个领域的 188 个 Skills**，其中包含一套由五个 Skills 组成的 Nature 风格科学写作、学术润色、投稿前评审、科学可视化与统计报告工作流。

你可以安装完整集合，也可以只安装当前工作流所需的单个 Skill、分类、目标工具与作用域。

---

## 🧬 Nature 风格科学写作套件

从可辩护的科学主张出发，通过五个可独立使用、也可组合调用的 Skills 完成投稿级论文工作流：

| 论文阶段 | Skill | 核心产物 |
| --- | --- | --- |
| 论证与初稿 | [`qinyan-nature-writing`](./skills/沁言学术skills/qinyan-nature-writing/) | 证据驱动的叙事结构、章节初稿、标题、摘要与投稿材料 |
| 结构与语言精修 | [`qinyan-nature-polishing`](./skills/沁言学术skills/qinyan-nature-polishing/) | 简洁专业且保持原意的学术文本，并检查过度推断 |
| 投稿前评审 | [`qinyan-nature-review`](./skills/沁言学术skills/qinyan-nature-review/) | 按优先级组织、具有稳定问题编号的可追溯审稿意见 |
| 科研图件与视觉证据 | [`qinyan-nature-figures`](./skills/沁言学术skills/qinyan-nature-figures/) | 可复现多面板图件、规范导出与投稿前预检 |
| 研究设计与统计 | [`qinyan-nature-statistics`](./skills/沁言学术skills/qinyan-nature-statistics/) | 目标量导向的分析方案、报告审计与可视化结果 |

安装单个 Skill：

```bash
curl -fsSL https://raw.githubusercontent.com/LeonChaoX/qinyan-academic-skills/main/install.sh \
  | bash -s -- --skill qinyan-nature-writing
```

查看[完整 Nature Skills 工作流指南](./NATURE-SKILLS.md)，获取任务路由、安装命令、质量门槛和示例提示词。

> [!NOTE]
> “Nature 风格”描述的是编辑与科学传播目标。本项目为独立项目，与 Nature Portfolio 或 Springer Nature 无隶属或背书关系，也不承诺论文接收。

---

## ✨ 核心特性

| 能力 | 说明 |
| --- | --- |
| **广泛科研覆盖** | 188 个 Skills，覆盖文献、写作、生命科学、AI、统计、数据库和实验室工作流 |
| **跨 Agent 使用** | 同一安装器支持 Claude Code、Cursor、Codex、Gemini CLI、OpenClaw 和 OpenCode |
| **按需安装** | 可安装完整集合、单个分类或指定 Skill |
| **项目级隔离** | 可选择全局安装，也可仅安装到当前项目 |
| **全生命周期管理** | 支持搜索、状态查看、更新检查和已安装 Skills 更新 |
| **版本可控** | 所有 Skill 均为纯文本，便于审查、迁移与定制 |

---

## 🚀 快速开始

### 安装全部 Skills

默认安装到 Claude Code 的全局 Skills 目录。

```bash
curl -fsSL https://raw.githubusercontent.com/LeonChaoX/qinyan-academic-skills/main/install.sh | bash
```

> [!NOTE]
> 安装器需要 Bash、Git 和 `curl`。Windows 用户请在 WSL 或 Git Bash 中运行。如所在环境要求先审查脚本，请在执行前阅读 [`install.sh`](./install.sh)。

### 按需安装

```bash
INSTALLER="https://raw.githubusercontent.com/LeonChaoX/qinyan-academic-skills/main/install.sh"

# 安装一个分类
curl -fsSL "$INSTALLER" | bash -s -- --category 01

# 安装单个 Skill
curl -fsSL "$INSTALLER" | bash -s -- --skill scanpy

# 安装到当前项目，而不是全局目录
curl -fsSL "$INSTALLER" | bash -s -- --project --skill scientific-writing

# 指定其他受支持的 Agent
curl -fsSL "$INSTALLER" | bash -s -- --tool codex
```

同时支持 `-c`、`-s`、`-t` 等短参数。运行 `bash install.sh --help` 可查看完整命令说明。

### 搜索与维护

```bash
# 浏览和搜索
bash install.sh --list
bash install.sh --list-skills
bash install.sh --search "蛋白质"

# 查看状态和更新
bash install.sh --status
bash install.sh --check-update
bash install.sh --update
bash install.sh --update --skill scanpy
```

### 克隆仓库

```bash
git clone https://github.com/LeonChaoX/qinyan-academic-skills.git
cd qinyan-academic-skills
bash install.sh --help
```

---

## 🤖 支持的 Agent

| Agent | `--tool` 参数 | 全局安装目录 | 项目级安装目录 |
| --- | :---: | --- | --- |
| Claude Code | `claude`（默认） | `~/.claude/skills/` | `.claude/skills/` |
| Cursor | `cursor` | `~/.cursor/skills/` | `.cursor/skills/` |
| Codex | `codex` | `~/.codex/skills/` | `.codex/skills/` |
| Gemini CLI | `gemini` | `~/.gemini/skills/` | `.gemini/skills/` |
| OpenClaw | `openclaw` | `~/.openclaw/skills/` | `.openclaw/skills/` |
| OpenCode | `opencode` | `~/.config/opencode/skills/` | `.opencode/skills/` |

---

## 🧭 Skills 分类

每个分类均可直接进入对应源码目录。使用 `--list-skills` 查看完整列表，或通过 `--search <关键词>` 按名称和说明搜索。

| 编号 | 分类 | 数量 | 重点能力 |
| :---: | --- | ---: | --- |
| — | [沁言学术 Skills](./skills/沁言学术skills/) | 10 | 论文搜索、分析、引文，以及 Nature 导向的写作、预审、绘图与统计 |
| 01 | [论文检索与文献管理](./skills/01-论文检索与文献管理/) | 10 | 学术搜索、综述、引用工作流和文献数据库 |
| 02 | [科学写作与学术交流](./skills/02-科学写作与学术交流/) | 6 | 论文写作、同行评审、研究计划和投稿模板 |
| 03 | [学术演示与可视化](./skills/03-学术演示与可视化/) | 9 | 幻灯片、海报、科学示意图、信息图和科研绘图 |
| 04 | [研究方法与科学思维](./skills/04-研究方法与科学思维/) | 10 | 假设、批判性思维、头脑风暴、评估和基金申请 |
| 05 | [生物信息与基因组学](./skills/05-生物信息与基因组学/) | 21 | 序列、单细胞分析、调控网络和变异分析 |
| 06 | [化学信息与药物发现](./skills/06-化学信息与药物发现/) | 12 | 分子处理、对接、药物化学和模拟 |
| 07 | [临床医学与精准医疗](./skills/07-临床医学与精准医疗/) | 18 | 临床试验、报告、影像、变异和决策支持 |
| 08 | [蛋白质工程与结构生物学](./skills/08-蛋白质工程与结构生物学/) | 7 | 蛋白质语言模型、结构、结构域和序列资源 |
| 09 | [机器学习与人工智能](./skills/09-机器学习与人工智能/) | 14 | 深度学习、经典 ML、预测、优化和可解释性 |
| 10 | [材料科学与物理计算](./skills/10-材料科学与物理计算/) | 10 | 材料、量子计算、天文学、流体和仿真 |
| 11 | [数据分析与统计建模](./skills/11-数据分析与统计建模/) | 11 | 数据框、统计、可视化、图分析和符号数学 |
| 12 | [科学数据库](./skills/12-科学数据库/) | 22 | 化学、基因、蛋白质、通路、群体和专利数据库 |
| 13 | [实验室自动化与集成](./skills/13-实验室自动化与集成/) | 9 | ELN、云实验室、机器人、影像和工作流平台 |
| 14 | [文档处理与数据工具](./skills/14-文档处理与数据工具/) | 7 | PDF、Word、PowerPoint、表格、Notebook 和格式转换 |
| 15 | [金融与经济数据](./skills/15-金融与经济数据/) | 7 | 市场、监管文件、财政数据、经济序列和研究报告 |
| 16 | [地理空间与遥感](./skills/16-地理空间与遥感/) | 2 | GIS、卫星影像、空间分析和遥感 |
| 17 | [平台与基础设施](./skills/17-平台与基础设施/) | 3 | 资源检测、云计算和 ISO 13485 准备 |

### 沁言学术自研 Skills

| Skill | 用途 |
| --- | --- |
| `qinyan-paper-search` | 通过沁言学术 OpenAPI 搜索 Google Scholar、PubMed、arXiv 和万方 |
| `qinyan-paper-analysis` | 对单篇学术论文进行结构化深度分析 |
| `qinyan-paper-polish` | 在保持原意的前提下优化中英文学术表达 |
| `qinyan-citation` | 检索文献并按常见学术格式生成引用 |
| `qinyan-topic-analysis` | 分析研究选题、证据版图和潜在方向 |
| `qinyan-nature-writing` | 以证据链构建论文论证、章节和首次投稿材料 |
| `qinyan-nature-polishing` | 在不改变科学含义的前提下重构、翻译与精修文本 |
| `qinyan-nature-review` | 从概念、技术和证据视角开展可追溯投稿前预审 |
| `qinyan-nature-figures` | 设计、导出并预检可复现的投稿级科研图件 |
| `qinyan-nature-statistics` | 进行设计感知的统计规划、分析、审查与报告 |

---

## 🔬 典型科研工作流

| 目标 | 推荐从这些 Skills 开始 |
| --- | --- |
| 文献检索与证据梳理 | `qinyan-paper-search`、`openalex-database`、`pubmed-database`、`literature-review` |
| 论文撰写与修订 | `qinyan-nature-writing`、`qinyan-nature-polishing`、`qinyan-nature-review`、`venue-templates` |
| 基金与研究计划 | `nsfc-proposal`、`nssfc-proposal`、`research-grants`、`research-proposal` |
| 学术幻灯片与海报 | `paper-slide-deck`、`scientific-slides`、`latex-posters`、`pptx-posters` |
| 生物信息与组学 | `biopython`、`scanpy`、`pydeseq2`、`scvi-tools`、`gget` |
| 药物发现与分子建模 | `rdkit`、`deepchem`、`diffdock`、`molecular-dynamics`、`rowan` |
| 统计分析与可视化 | `statistical-analysis`、`statsmodels`、`polars`、`plotly`、`seaborn` |
| 临床与精准医学 | `clinical-decision-support`、`clinicaltrials-database`、`clinvar-database`、`pydicom` |

> [!TIP]
> 建议先选择一个目标明确的 Skill，阅读其 `SKILL.md`；仅在科研流程确实需要多种能力时再组合多个 Skills。

---

## 📖 文档

- [技术指南](./docs/technical-guide.md) — 安装器架构、搜索、更新检测和版本管理
- [`install.sh --help`](./install.sh) — 完整 CLI 参数和示例
- [`skills/`](./skills/) — 所有 Skills 的规范源码

---

## 🙏 来源与致谢

本集合由沁言学术自研 Skills 与以下开源项目中的科研 Skills 整理而成：

- [K-Dense-AI/claude-scientific-skills](https://github.com/K-Dense-AI/claude-scientific-skills) — 综合科学研究 Skills 集合
- [luwill/research-skills](https://github.com/luwill/research-skills) — 学术幻灯片、文献综述和研究计划工作流
- [Yuan1z0825/nature-skills](https://github.com/Yuan1z0825/nature-skills) — 提供 Nature 导向科研工作流的 Apache-2.0 架构启发；沁言套件为独立重写
- 沁言学术 — 论文搜索、论文分析、学术润色、引文检索和选题分析

每个 Skill 的来源与许可证元数据保留在对应的 `SKILL.md` 中。

---

## 🤝 贡献

欢迎改进 Skills、翻译、文档和安装器兼容性。

1. Fork 仓库，并从 `main` 创建职责单一的分支
2. 在正确分类中新增或更新 Skill，并以 `SKILL.md` 作为入口
3. 同步更新受影响的文档和翻译
4. 验证链接、命令和 Markdown 格式
5. 创建 Pull Request，清楚说明变更内容与影响

如果修改了数量、支持工具或 CLI 参数等共享事实，请在同一个 Pull Request 中同步更新五份 README。

---

## 📄 许可证

本仓库采用 [MIT License](./LICENSE)。单个 Skill 可能在其 `SKILL.md` 中声明额外或不同的许可条款；重新分发或商业使用前请确认相应条款。
