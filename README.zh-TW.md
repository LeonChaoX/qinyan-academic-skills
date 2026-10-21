# 沁言學術科研 Skills — Nature 風格論文寫作工作流程

_188 個可安裝 AI Agent Skills，重點提供 Nature 風格科學寫作、論文潤飾、投稿前評閱、科研繪圖與統計分析工作流程。_

[English](./README.md) · [简体中文](./README.zh-CN.md) · **繁體中文** · [日本語](./README.ja-JP.md) · [한국어](./README.ko-KR.md)

[![Skills](https://img.shields.io/badge/skills-188-2ea44f.svg)](#-skills-分類)
[![Nature skills: 5 workflows](https://img.shields.io/badge/Nature%20skills-5%20workflows-1f6feb.svg)](./NATURE-SKILLS.md)
[![Categories](https://img.shields.io/badge/categories-18-0969da.svg)](#-skills-分類)
[![Agent support](https://img.shields.io/badge/agents-6-8250df.svg)](#-支援的-agent)
[![License: MIT](https://img.shields.io/badge/license-MIT-f5c518.svg)](./LICENSE)

沁言學術科研 Skills 為 Claude Code、Codex、Cursor、Gemini CLI、OpenClaw 與 OpenCode 提供可重複使用的研究能力。本儲存庫收錄 **18 個領域的 188 個 Skills**，其中包含一套由五個 Skills 組成的 Nature 風格科學寫作、學術潤飾、投稿前評閱、科學視覺化與統計報告工作流程。

你可以安裝完整集合，也可以只安裝目前工作流程所需的單一 Skill、分類、目標工具與作用域。

---

## 🧬 Nature 風格科學寫作套件

從可辯護的科學主張出發，透過五個可獨立使用、也可組合呼叫的 Skills 完成投稿級論文工作流程：

| 論文階段 | Skill | 核心產出 |
| --- | --- | --- |
| 論證與初稿 | [`qinyan-nature-writing`](./skills/沁言学术skills/qinyan-nature-writing/) | 證據導向的敘事結構、章節初稿、標題、摘要與投稿材料 |
| 結構與語言精修 | [`qinyan-nature-polishing`](./skills/沁言学术skills/qinyan-nature-polishing/) | 簡潔專業且保持原意的學術文字，並檢查過度推論 |
| 投稿前評閱 | [`qinyan-nature-review`](./skills/沁言学术skills/qinyan-nature-review/) | 依優先順序組織、具穩定問題編號的可追溯評閱意見 |
| 科研圖件與視覺證據 | [`qinyan-nature-figures`](./skills/沁言学术skills/qinyan-nature-figures/) | 可重現多面板圖件、規範匯出與投稿前預檢 |
| 研究設計與統計 | [`qinyan-nature-statistics`](./skills/沁言学术skills/qinyan-nature-statistics/) | 目標量導向的分析方案、報告稽核與視覺化結果 |

安裝單一 Skill：

```bash
curl -fsSL https://raw.githubusercontent.com/LeonChaoX/qinyan-academic-skills/main/install.sh \
  | bash -s -- --skill qinyan-nature-writing
```

查看[完整 Nature Skills 工作流程指南](./NATURE-SKILLS.md)，取得任務路由、安裝命令、品質門檻與範例提示詞。

> [!NOTE]
> 「Nature 風格」描述的是編輯與科學傳播目標。本專案為獨立專案，與 Nature Portfolio 或 Springer Nature 無隸屬或背書關係，也不保證論文獲得接受。

---

## ✨ 核心特色

| 能力 | 說明 |
| --- | --- |
| **廣泛研究覆蓋** | 188 個 Skills，涵蓋文獻、寫作、生命科學、AI、統計、資料庫與實驗室工作流程 |
| **跨 Agent 使用** | 同一安裝器支援 Claude Code、Cursor、Codex、Gemini CLI、OpenClaw 與 OpenCode |
| **按需安裝** | 可安裝完整集合、單一分類或指定 Skill |
| **專案級隔離** | 可選擇全域安裝，也可僅安裝至目前專案 |
| **完整生命週期管理** | 支援搜尋、狀態檢視、更新檢查與已安裝 Skills 更新 |
| **版本可控** | 所有 Skill 均為純文字，便於審查、移植與客製化 |

---

## 🚀 快速開始

### 安裝全部 Skills

預設安裝至 Claude Code 的全域 Skills 目錄。

```bash
curl -fsSL https://raw.githubusercontent.com/LeonChaoX/qinyan-academic-skills/main/install.sh | bash
```

> [!NOTE]
> 安裝器需要 Bash、Git 與 `curl`。Windows 使用者請在 WSL 或 Git Bash 中執行。若環境要求先審查腳本，請在執行前閱讀 [`install.sh`](./install.sh)。

### 按需安裝

```bash
INSTALLER="https://raw.githubusercontent.com/LeonChaoX/qinyan-academic-skills/main/install.sh"

# 安裝一個分類
curl -fsSL "$INSTALLER" | bash -s -- --category 01

# 安裝單一 Skill
curl -fsSL "$INSTALLER" | bash -s -- --skill scanpy

# 安裝至目前專案，而非全域目錄
curl -fsSL "$INSTALLER" | bash -s -- --project --skill scientific-writing

# 指定其他支援的 Agent
curl -fsSL "$INSTALLER" | bash -s -- --tool codex
```

同時支援 `-c`、`-s`、`-t` 等短參數。執行 `bash install.sh --help` 可查看完整命令說明。

### 搜尋與維護

```bash
# 瀏覽與搜尋
bash install.sh --list
bash install.sh --list-skills
bash install.sh --search "蛋白質"

# 查看狀態與更新
bash install.sh --status
bash install.sh --check-update
bash install.sh --update
bash install.sh --update --skill scanpy
```

### 複製儲存庫

```bash
git clone https://github.com/LeonChaoX/qinyan-academic-skills.git
cd qinyan-academic-skills
bash install.sh --help
```

---

## 🤖 支援的 Agent

| Agent | `--tool` 參數 | 全域安裝目錄 | 專案安裝目錄 |
| --- | :---: | --- | --- |
| Claude Code | `claude`（預設） | `~/.claude/skills/` | `.claude/skills/` |
| Cursor | `cursor` | `~/.cursor/skills/` | `.cursor/skills/` |
| Codex | `codex` | `~/.codex/skills/` | `.codex/skills/` |
| Gemini CLI | `gemini` | `~/.gemini/skills/` | `.gemini/skills/` |
| OpenClaw | `openclaw` | `~/.openclaw/skills/` | `.openclaw/skills/` |
| OpenCode | `opencode` | `~/.config/opencode/skills/` | `.opencode/skills/` |

---

## 🧭 Skills 分類

每個分類皆可直接前往對應的原始碼目錄。使用 `--list-skills` 查看完整清單，或透過 `--search <關鍵字>` 依名稱與說明搜尋。

| 編號 | 分類 | 數量 | 重點能力 |
| :---: | --- | ---: | --- |
| — | [沁言學術 Skills](./skills/沁言学术skills/) | 10 | 論文搜尋、分析、引文，以及 Nature 導向的寫作、預審、繪圖與統計 |
| 01 | [論文檢索與文獻管理](./skills/01-论文检索与文献管理/) | 10 | 學術搜尋、綜述、引用工作流程與文獻資料庫 |
| 02 | [科學寫作與學術交流](./skills/02-科学写作与学术交流/) | 6 | 論文寫作、同儕審查、研究計畫與投稿範本 |
| 03 | [學術簡報與視覺化](./skills/03-学术演示与可视化/) | 9 | 投影片、海報、科學示意圖、資訊圖與科研繪圖 |
| 04 | [研究方法與科學思維](./skills/04-研究方法与科学思维/) | 10 | 假設、批判思考、腦力激盪、評估與研究補助申請 |
| 05 | [生物資訊與基因體學](./skills/05-生物信息与基因组学/) | 21 | 序列、單細胞分析、調控網路與變異分析 |
| 06 | [化學資訊與藥物發現](./skills/06-化学信息与药物发现/) | 12 | 分子處理、對接、藥物化學與模擬 |
| 07 | [臨床醫學與精準醫療](./skills/07-临床医学与精准医疗/) | 18 | 臨床試驗、報告、影像、變異與決策支援 |
| 08 | [蛋白質工程與結構生物學](./skills/08-蛋白质工程与结构生物学/) | 7 | 蛋白質語言模型、結構、結構域與序列資源 |
| 09 | [機器學習與人工智慧](./skills/09-机器学习与人工智能/) | 14 | 深度學習、傳統 ML、預測、最佳化與可解釋性 |
| 10 | [材料科學與計算物理](./skills/10-材料科学与物理计算/) | 10 | 材料、量子運算、天文學、流體與模擬 |
| 11 | [資料分析與統計建模](./skills/11-数据分析与统计建模/) | 11 | 資料框、統計、視覺化、圖分析與符號數學 |
| 12 | [科學資料庫](./skills/12-科学数据库/) | 22 | 化學、基因、蛋白質、路徑、族群與專利資料庫 |
| 13 | [實驗室自動化與整合](./skills/13-实验室自动化与集成/) | 9 | ELN、雲端實驗室、機器人、影像與工作流程平台 |
| 14 | [文件處理與資料工具](./skills/14-文档处理与数据工具/) | 7 | PDF、Word、PowerPoint、試算表、Notebook 與格式轉換 |
| 15 | [金融與經濟資料](./skills/15-金融与经济数据/) | 7 | 市場、監管文件、財政資料、經濟時間序列與研究報告 |
| 16 | [地理空間與遙測](./skills/16-地理空间与遥感/) | 2 | GIS、衛星影像、空間分析與遙測 |
| 17 | [平台與基礎設施](./skills/17-平台与基础设施/) | 3 | 資源偵測、雲端運算與 ISO 13485 準備 |

### 沁言學術自研 Skills

| Skill | 用途 |
| --- | --- |
| `qinyan-paper-search` | 透過沁言學術 OpenAPI 搜尋 Google Scholar、PubMed、arXiv 與萬方 |
| `qinyan-paper-analysis` | 對單篇學術論文進行結構化深度分析 |
| `qinyan-paper-polish` | 在保留原意的前提下改善中英語學術表達 |
| `qinyan-citation` | 檢索文獻並依常見學術格式產生引用 |
| `qinyan-topic-analysis` | 分析研究主題、證據版圖與潛在方向 |
| `qinyan-nature-writing` | 以證據鏈建構論文論證、章節與首次投稿材料 |
| `qinyan-nature-polishing` | 在不改變科學含義的前提下重構、翻譯與精修文本 |
| `qinyan-nature-review` | 從概念、技術與證據視角進行可追溯投稿前預審 |
| `qinyan-nature-figures` | 設計、匯出並預檢可重現的投稿級科研圖件 |
| `qinyan-nature-statistics` | 進行設計感知的統計規劃、分析、審查與報告 |

---

## 🔬 典型研究工作流程

| 目標 | 建議從這些 Skills 開始 |
| --- | --- |
| 文獻檢索與證據整理 | `qinyan-paper-search`、`openalex-database`、`pubmed-database`、`literature-review` |
| 論文撰寫與修訂 | `qinyan-nature-writing`、`qinyan-nature-polishing`、`qinyan-nature-review`、`venue-templates` |
| 研究補助與研究計畫 | `nsfc-proposal`、`nssfc-proposal`、`research-grants`、`research-proposal` |
| 學術投影片與海報 | `paper-slide-deck`、`scientific-slides`、`latex-posters`、`pptx-posters` |
| 生物資訊與體學 | `biopython`、`scanpy`、`pydeseq2`、`scvi-tools`、`gget` |
| 藥物發現與分子建模 | `rdkit`、`deepchem`、`diffdock`、`molecular-dynamics`、`rowan` |
| 統計分析與視覺化 | `statistical-analysis`、`statsmodels`、`polars`、`plotly`、`seaborn` |
| 臨床與精準醫學 | `clinical-decision-support`、`clinicaltrials-database`、`clinvar-database`、`pydicom` |

> [!TIP]
> 建議先選擇一個目標明確的 Skill 並閱讀其 `SKILL.md`；僅在研究工作流程確實需要多種能力時，再組合多個 Skills。

---

## 📖 文件

- [技術指南](./docs/technical-guide.md) — 安裝器架構、搜尋、更新偵測與版本管理
- [`install.sh --help`](./install.sh) — 完整 CLI 參數與範例
- [`skills/`](./skills/) — 所有 Skills 的規範原始碼

---

## 🙏 來源與致謝

本集合由沁言學術自研 Skills 與下列開源專案中的研究 Skills 整理而成：

- [K-Dense-AI/claude-scientific-skills](https://github.com/K-Dense-AI/claude-scientific-skills) — 綜合科學研究 Skills 集合
- [luwill/research-skills](https://github.com/luwill/research-skills) — 學術投影片、文獻綜述與研究計畫工作流程
- [Yuan1z0825/nature-skills](https://github.com/Yuan1z0825/nature-skills) — 提供 Nature 導向研究工作流程的 Apache-2.0 架構啟發；沁言套件為獨立重寫
- 沁言學術 — 論文搜尋、論文分析、學術潤飾、引文檢索與選題分析

每個 Skill 的來源與授權資訊皆保留在對應的 `SKILL.md` 中。

---

## 🤝 貢獻

歡迎協助改善 Skills、翻譯、文件與安裝器相容性。

1. Fork 儲存庫，並從 `main` 建立職責單一的分支
2. 在正確分類中新增或更新 Skill，並以 `SKILL.md` 作為進入點
3. 同步更新受影響的文件與翻譯
4. 驗證連結、命令與 Markdown 格式
5. 建立 Pull Request，清楚說明變更內容與影響

若修改數量、支援工具或 CLI 參數等共用資訊，請在同一個 Pull Request 中同步更新五份 README。

---

## 📄 授權條款

本儲存庫採用 [MIT License](./LICENSE)。單一 Skill 可能在其 `SKILL.md` 中聲明額外或不同的授權條款；重新散布或商業使用前，請先確認相應條款。
