# Qinyan Academic Skills — Nature スタイル科学論文ワークフロー

_学術研究向けのインストール可能な 188 AI Agent Skills。Nature スタイルの科学論文執筆、推敲、投稿前レビュー、図表、統計解析に対応する独自スイートを収録。_

[English](./README.md) · [简体中文](./README.zh-CN.md) · [繁體中文](./README.zh-TW.md) · **日本語** · [한국어](./README.ko-KR.md)

[![Skills](https://img.shields.io/badge/skills-188-2ea44f.svg)](#-スキルカタログ)
[![Nature skills: 5 workflows](https://img.shields.io/badge/Nature%20skills-5%20workflows-1f6feb.svg)](./NATURE-SKILLS.md)
[![Categories](https://img.shields.io/badge/categories-18-0969da.svg)](#-スキルカタログ)
[![Agent support](https://img.shields.io/badge/agents-6-8250df.svg)](#-対応エージェント)
[![License: MIT](https://img.shields.io/badge/license-MIT-f5c518.svg)](./LICENSE)

Qinyan Academic Skills は、Claude Code、Codex、Cursor、Gemini CLI、OpenClaw、OpenCode に再利用可能な研究能力を提供します。本リポジトリには **18 分野・188 Skills** を収録し、その中核として Nature スタイルの科学論文執筆、学術推敲、投稿前レビュー、科学可視化、統計報告を担う 5 Skills を提供します。

コレクション全体のほか、ワークフローに必要な Skill、カテゴリ、対象ツール、インストール範囲だけを選択できます。

---

## 🧬 Nature スタイル科学論文スイート

検証可能な科学的主張から投稿可能な原稿まで、独立または組み合わせて使える 5 Skills が支援します。

| 論文工程 | Skill | 主な成果物 |
| --- | --- | --- |
| 論証と初稿 | [`qinyan-nature-writing`](./skills/沁言学术skills/qinyan-nature-writing/) | エビデンス主導の構成、各節の草稿、タイトル、要旨、投稿資料 |
| 構成と言語の推敲 | [`qinyan-nature-polishing`](./skills/沁言学术skills/qinyan-nature-polishing/) | 科学的意味を保ち、過剰主張を抑えた簡潔な学術文章 |
| 投稿前レビュー | [`qinyan-nature-review`](./skills/沁言学术skills/qinyan-nature-review/) | 安定した課題 ID を持つ、優先順位付きで追跡可能な指摘 |
| 図と視覚的エビデンス | [`qinyan-nature-figures`](./skills/沁言学术skills/qinyan-nature-figures/) | 再現可能な複数パネル図、適切な書き出し、投稿前検査 |
| 研究設計と統計 | [`qinyan-nature-statistics`](./skills/沁言学术skills/qinyan-nature-statistics/) | 推定対象を明確にした解析計画、報告監査、図表用結果 |

Skill を 1 つインストール：

```bash
curl -fsSL https://raw.githubusercontent.com/LeonChaoX/qinyan-academic-skills/main/install.sh \
  | bash -s -- --skill qinyan-nature-writing
```

タスクの振り分け、インストール方法、品質基準、プロンプト例は、[Nature Skills ワークフロー完全ガイド](./NATURE-SKILLS.md)を参照してください。

> [!NOTE]
> 「Nature スタイル」は編集および科学コミュニケーション上の目標を示します。本プロジェクトは Nature Portfolio または Springer Nature と提携・承認関係になく、掲載を保証するものではありません。

---

## ✨ 特長

| 機能 | 内容 |
| --- | --- |
| **幅広い研究領域** | 文献、執筆、生命科学、AI、統計、データベース、ラボワークフローを含む 188 Skills |
| **エージェント間の移植性** | Claude Code、Cursor、Codex、Gemini CLI、OpenClaw、OpenCode に同じインストーラーで対応 |
| **選択的インストール** | 全体、カテゴリ単位、または指定した Skill のみをインストール可能 |
| **プロジェクト分離** | グローバルまたは現在のプロジェクト内だけにインストール可能 |
| **ライフサイクル管理** | 検索、状態確認、更新確認、インストール済み Skills の更新に対応 |
| **バージョン管理可能** | すべての Skill がプレーンテキストで、レビュー、移植、カスタマイズが容易 |

---

## 🚀 クイックスタート

### すべての Skills をインストール

既定では Claude Code のグローバル Skills ディレクトリにインストールされます。

```bash
curl -fsSL https://raw.githubusercontent.com/LeonChaoX/qinyan-academic-skills/main/install.sh | bash
```

> [!NOTE]
> インストーラーには Bash、Git、`curl` が必要です。Windows では WSL または Git Bash を使用してください。実行前のソース確認が必要な環境では、先に [`install.sh`](./install.sh) をレビューしてください。

### 必要なものだけをインストール

```bash
INSTALLER="https://raw.githubusercontent.com/LeonChaoX/qinyan-academic-skills/main/install.sh"

# カテゴリを 1 つインストール
curl -fsSL "$INSTALLER" | bash -s -- --category 01

# Skill を 1 つインストール
curl -fsSL "$INSTALLER" | bash -s -- --skill scanpy

# グローバルではなく現在のプロジェクトにインストール
curl -fsSL "$INSTALLER" | bash -s -- --project --skill scientific-writing

# 別の対応エージェントを指定
curl -fsSL "$INSTALLER" | bash -s -- --tool codex
```

`-c`、`-s`、`-t` などの短縮オプションも利用できます。完全なコマンド一覧は `bash install.sh --help` で確認してください。

### Skills の検索と管理

```bash
# 一覧と検索
bash install.sh --list
bash install.sh --list-skills
bash install.sh --search "protein"

# 状態確認と更新
bash install.sh --status
bash install.sh --check-update
bash install.sh --update
bash install.sh --update --skill scanpy
```

### リポジトリをクローン

```bash
git clone https://github.com/LeonChaoX/qinyan-academic-skills.git
cd qinyan-academic-skills
bash install.sh --help
```

---

## 🤖 対応エージェント

| エージェント | `--tool` の値 | グローバルディレクトリ | プロジェクトディレクトリ |
| --- | :---: | --- | --- |
| Claude Code | `claude`（既定） | `~/.claude/skills/` | `.claude/skills/` |
| Cursor | `cursor` | `~/.cursor/skills/` | `.cursor/skills/` |
| Codex | `codex` | `~/.codex/skills/` | `.codex/skills/` |
| Gemini CLI | `gemini` | `~/.gemini/skills/` | `.gemini/skills/` |
| OpenClaw | `openclaw` | `~/.openclaw/skills/` | `.openclaw/skills/` |
| OpenCode | `opencode` | `~/.config/opencode/skills/` | `.opencode/skills/` |

---

## 🧭 スキルカタログ

各カテゴリから対応するソースディレクトリに直接移動できます。完全な一覧は `--list-skills`、名前や説明からの検索は `--search <キーワード>` を使用してください。

| ID | カテゴリ | Skills | 主な領域 |
| :---: | --- | ---: | --- |
| — | [Qinyan Academic Skills](./skills/沁言学术skills/) | 10 | 論文検索、分析、引用、Nature 向け執筆・レビュー・図表・統計 |
| 01 | [文献探索と参考文献管理](./skills/01-论文检索与文献管理/) | 10 | 学術検索、レビュー、引用ワークフロー、文献データベース |
| 02 | [科学執筆と学術コミュニケーション](./skills/02-科学写作与学术交流/) | 6 | 論文執筆、査読、研究計画、投稿テンプレート |
| 03 | [学術発表と可視化](./skills/03-学术演示与可视化/) | 9 | スライド、ポスター、模式図、インフォグラフィック、科学図表 |
| 04 | [研究手法と科学的思考](./skills/04-研究方法与科学思维/) | 10 | 仮説、批判的思考、ブレインストーミング、評価、研究費申請 |
| 05 | [バイオインフォマティクスとゲノミクス](./skills/05-生物信息与基因组学/) | 21 | 配列、シングルセル解析、制御ネットワーク、変異解析 |
| 06 | [ケモインフォマティクスと創薬](./skills/06-化学信息与药物发现/) | 12 | 分子処理、ドッキング、医薬化学、シミュレーション |
| 07 | [臨床医学と精密医療](./skills/07-临床医学与精准医疗/) | 18 | 臨床試験、レポート、画像、変異、意思決定支援 |
| 08 | [タンパク質工学と構造生物学](./skills/08-蛋白质工程与结构生物学/) | 7 | タンパク質言語モデル、構造、ドメイン、配列リソース |
| 09 | [機械学習と人工知能](./skills/09-机器学习与人工智能/) | 14 | 深層学習、古典的 ML、予測、最適化、説明可能性 |
| 10 | [材料科学と計算物理](./skills/10-材料科学与物理计算/) | 10 | 材料、量子計算、天文学、流体、シミュレーション |
| 11 | [データ分析と統計モデリング](./skills/11-数据分析与统计建模/) | 11 | データフレーム、統計、可視化、グラフ解析、記号数学 |
| 12 | [科学データベース](./skills/12-科学数据库/) | 22 | 化学、遺伝子、タンパク質、パスウェイ、集団、特許 |
| 13 | [ラボ自動化と統合](./skills/13-实验室自动化与集成/) | 9 | ELN、クラウドラボ、ロボティクス、画像、ワークフロープラットフォーム |
| 14 | [文書処理とデータツール](./skills/14-文档处理与数据工具/) | 7 | PDF、Word、PowerPoint、表計算、Notebook、形式変換 |
| 15 | [金融・経済データ](./skills/15-金融与经济数据/) | 7 | 市場、開示資料、財政データ、経済時系列、調査レポート |
| 16 | [地理空間解析とリモートセンシング](./skills/16-地理空间与遥感/) | 2 | GIS、衛星画像、空間解析、リモートセンシング |
| 17 | [プラットフォームとインフラ](./skills/17-平台与基础设施/) | 3 | リソース検出、クラウド計算、ISO 13485 対応準備 |

### Qinyan Academic 独自 Skills

| Skill | 用途 |
| --- | --- |
| `qinyan-paper-search` | Qinyan Academic OpenAPI を通じて Google Scholar、PubMed、arXiv、Wanfang を検索 |
| `qinyan-paper-analysis` | 1 本の学術論文を構造化して詳細に分析 |
| `qinyan-paper-polish` | 意味を維持しながら中国語・英語の学術文章を改善 |
| `qinyan-citation` | 文献を探索し、主要な学術スタイルで引用を整形 |
| `qinyan-topic-analysis` | 研究テーマ、エビデンスの全体像、有望な方向性を分析 |
| `qinyan-nature-writing` | エビデンスに基づく論証、論文章節、初回投稿資料を作成 |
| `qinyan-nature-polishing` | 科学的意味を変えずに文章を再構成・翻訳・推敲 |
| `qinyan-nature-review` | 概念・技術・エビデンスの視点から追跡可能な投稿前レビューを実施 |
| `qinyan-nature-figures` | 再現可能な投稿品質の科学図表を設計・出力・事前検証 |
| `qinyan-nature-statistics` | 研究デザインを踏まえた統計計画・解析・監査・報告 |

---

## 🔬 代表的な研究ワークフロー

| 目的 | 推奨 Skills |
| --- | --- |
| 文献検索とエビデンス整理 | `qinyan-paper-search`、`openalex-database`、`pubmed-database`、`literature-review` |
| 論文の執筆と改稿 | `qinyan-nature-writing`、`qinyan-nature-polishing`、`qinyan-nature-review`、`venue-templates` |
| 研究費申請と研究計画 | `nsfc-proposal`、`nssfc-proposal`、`research-grants`、`research-proposal` |
| 学術スライドとポスター | `paper-slide-deck`、`scientific-slides`、`latex-posters`、`pptx-posters` |
| バイオインフォマティクスとオミクス | `biopython`、`scanpy`、`pydeseq2`、`scvi-tools`、`gget` |
| 創薬と分子モデリング | `rdkit`、`deepchem`、`diffdock`、`molecular-dynamics`、`rowan` |
| 統計解析と可視化 | `statistical-analysis`、`statsmodels`、`polars`、`plotly`、`seaborn` |
| 臨床研究と精密医療 | `clinical-decision-support`、`clinicaltrials-database`、`clinvar-database`、`pydicom` |

> [!TIP]
> まず目的に合う Skill を 1 つ選び、その `SKILL.md` を確認してください。複数の能力が本当に必要な研究ワークフローでのみ Skills を組み合わせることを推奨します。

---

## 📖 ドキュメント

- [技術ガイド](./docs/technical-guide.md) — インストーラー構成、検索、更新検出、バージョン管理
- [`install.sh --help`](./install.sh) — CLI オプションと使用例
- [`skills/`](./skills/) — すべての Skill の正規ソース

---

## 🙏 出典と謝辞

このコレクションは、Qinyan Academic 独自 Skills と、以下のオープンソースプロジェクトから整理した研究 Skills で構成されています。

- [K-Dense-AI/claude-scientific-skills](https://github.com/K-Dense-AI/claude-scientific-skills) — 幅広い科学研究 Skills コレクション
- [luwill/research-skills](https://github.com/luwill/research-skills) — 学術スライド、文献レビュー、研究計画のワークフロー
- [Yuan1z0825/nature-skills](https://github.com/Yuan1z0825/nature-skills) — Nature 向けワークフローの Apache-2.0 アーキテクチャを参考にし、Qinyan 版は独自に再設計
- Qinyan Academic — 論文検索、論文分析、学術文章の推敲、引用探索、研究テーマ分析

各 Skill の出典とライセンス情報は、対応する `SKILL.md` に保持されています。

---

## 🤝 コントリビューション

Skills、翻訳、ドキュメント、インストーラー互換性の改善を歓迎します。

1. リポジトリを Fork し、`main` から目的を限定したブランチを作成する
2. 適切なカテゴリで Skill を追加または更新し、`SKILL.md` をエントリーポイントにする
3. 影響を受けるドキュメントと翻訳を更新する
4. リンク、コマンド、Markdown 形式を検証する
5. 変更内容と影響を明確に記載した Pull Request を作成する

件数、対応ツール、CLI オプションなどの共通情報を変更した場合は、同じ Pull Request で 5 つの README をすべて更新してください。

---

## 📄 ライセンス

本リポジトリは [MIT License](./LICENSE) の下で配布されます。個々の Skill は `SKILL.md` で追加または異なる条件を定めている場合があります。再配布または商用利用の前に該当条件を確認してください。
