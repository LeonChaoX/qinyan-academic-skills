# Qinyan Academic Skills — Nature-style scientific writing workflows

_188 installable AI agent skills for academic research, featuring a first-party Nature-style suite for scientific writing, manuscript polishing, peer review, publication figures, and statistics._

**English** · [简体中文](./README.zh-CN.md) · [繁體中文](./README.zh-TW.md) · [日本語](./README.ja-JP.md) · [한국어](./README.ko-KR.md)

[![Skills](https://img.shields.io/badge/skills-188-2ea44f.svg)](#-skill-catalog)
[![Nature skills: 5 workflows](https://img.shields.io/badge/Nature%20skills-5%20workflows-1f6feb.svg)](./NATURE-SKILLS.md)
[![Categories](https://img.shields.io/badge/categories-18-0969da.svg)](#-skill-catalog)
[![Agent support](https://img.shields.io/badge/agents-6-8250df.svg)](#-supported-agents)
[![License: MIT](https://img.shields.io/badge/license-MIT-f5c518.svg)](./LICENSE)

Qinyan Academic Skills equips Claude Code, Codex, Cursor, Gemini CLI, OpenClaw, and OpenCode with reusable research capabilities. The repository contains **188 skills across 18 domains**, including a five-skill workflow for Nature-style scientific writing, academic editing, pre-submission review, scientific visualization, and statistical reporting.

Use the complete collection or install only the skill, category, tool, and scope that your workflow needs.

---

## 🧬 Nature-style scientific writing suite

Move from a defensible scientific claim to a submission-ready manuscript with five focused, composable skills:

| Manuscript stage | Skill | Primary output |
| --- | --- | --- |
| Argument and drafting | [`qinyan-nature-writing`](./skills/沁言学术skills/qinyan-nature-writing/) | Evidence-led narrative, section drafts, title, abstract, and submission package |
| Structural and language revision | [`qinyan-nature-polishing`](./skills/沁言学术skills/qinyan-nature-polishing/) | Concise academic prose with meaning-preservation and anti-overclaim checks |
| Pre-submission assessment | [`qinyan-nature-review`](./skills/沁言学术skills/qinyan-nature-review/) | Prioritized, traceable review findings with stable issue identifiers |
| Figures and visual evidence | [`qinyan-nature-figures`](./skills/沁言学术skills/qinyan-nature-figures/) | Reproducible multi-panel figures with export and preflight validation |
| Study design and statistics | [`qinyan-nature-statistics`](./skills/沁言学术skills/qinyan-nature-statistics/) | Estimand-aware analysis plans, reporting audits, and figure-ready results |

Install one skill:

```bash
curl -fsSL https://raw.githubusercontent.com/LeonChaoX/qinyan-academic-skills/main/install.sh \
  | bash -s -- --skill qinyan-nature-writing
```

Or [explore the complete Nature skills workflow](./NATURE-SKILLS.md), including routing guidance, installation commands, quality gates, and example prompts.

> [!NOTE]
> “Nature-style” describes editorial and scientific communication goals. This independent project is not affiliated with, endorsed by, or guaranteed acceptance by Nature Portfolio or Springer Nature.

---

## ✨ Highlights

| Capability | What you get |
| --- | --- |
| **Research coverage** | 188 skills spanning literature, writing, life sciences, AI, statistics, databases, and laboratory workflows |
| **Agent portability** | One installer for Claude Code, Cursor, Codex, Gemini CLI, OpenClaw, and OpenCode |
| **Selective installation** | Install the full library, one category, or one named skill |
| **Project isolation** | Choose global installation or keep skills inside a single project |
| **Lifecycle management** | Search, inspect status, check for updates, and update installed skills |
| **Version-controlled source** | Every skill is plain text, reviewable, portable, and easy to customize |

---

## 🚀 Quick start

### Install everything

The default target is the global Claude Code skills directory.

```bash
curl -fsSL https://raw.githubusercontent.com/LeonChaoX/qinyan-academic-skills/main/install.sh | bash
```

> [!NOTE]
> The installer requires Bash, Git, and `curl`. On Windows, run it in WSL or Git Bash. Review [`install.sh`](./install.sh) before piping it to Bash if your environment requires source inspection.

### Install only what you need

```bash
INSTALLER="https://raw.githubusercontent.com/LeonChaoX/qinyan-academic-skills/main/install.sh"

# Install one category
curl -fsSL "$INSTALLER" | bash -s -- --category 01

# Install one skill
curl -fsSL "$INSTALLER" | bash -s -- --skill scanpy

# Install into the current project instead of globally
curl -fsSL "$INSTALLER" | bash -s -- --project --skill scientific-writing

# Target another supported agent
curl -fsSL "$INSTALLER" | bash -s -- --tool codex
```

Short forms such as `-c`, `-s`, and `-t` are also supported. Run `bash install.sh --help` for the complete command reference.

### Discover and maintain skills

```bash
# Browse and search
bash install.sh --list
bash install.sh --list-skills
bash install.sh --search "protein"

# Inspect and update
bash install.sh --status
bash install.sh --check-update
bash install.sh --update
bash install.sh --update --skill scanpy
```

### Clone the repository

```bash
git clone https://github.com/LeonChaoX/qinyan-academic-skills.git
cd qinyan-academic-skills
bash install.sh --help
```

---

## 🤖 Supported agents

| Agent | `--tool` value | Global directory | Project directory |
| --- | :---: | --- | --- |
| Claude Code | `claude` (default) | `~/.claude/skills/` | `.claude/skills/` |
| Cursor | `cursor` | `~/.cursor/skills/` | `.cursor/skills/` |
| Codex | `codex` | `~/.codex/skills/` | `.codex/skills/` |
| Gemini CLI | `gemini` | `~/.gemini/skills/` | `.gemini/skills/` |
| OpenClaw | `openclaw` | `~/.openclaw/skills/` | `.openclaw/skills/` |
| OpenCode | `opencode` | `~/.config/opencode/skills/` | `.opencode/skills/` |

---

## 🧭 Skill catalog

Each category links directly to its source directory. Use `--list-skills` for the complete list or `--search <term>` to discover skills by name and description.

| ID | Category | Skills | Focus |
| :---: | --- | ---: | --- |
| — | [Qinyan Academic skills](./skills/沁言学术skills/) | 10 | Paper search, analysis, citations, and Nature-focused writing, review, figures, and statistics |
| 01 | [Literature discovery and reference management](./skills/01-论文检索与文献管理/) | 10 | Scholarly search, reviews, citation workflows, and literature databases |
| 02 | [Scientific writing and communication](./skills/02-科学写作与学术交流/) | 6 | Manuscripts, peer review, research proposals, and venue templates |
| 03 | [Academic presentation and visualization](./skills/03-学术演示与可视化/) | 9 | Slides, posters, schematics, infographics, and scientific figures |
| 04 | [Research methods and scientific reasoning](./skills/04-研究方法与科学思维/) | 10 | Hypotheses, critical thinking, brainstorming, evaluation, and grants |
| 05 | [Bioinformatics and genomics](./skills/05-生物信息与基因组学/) | 21 | Sequences, single-cell analysis, regulatory networks, and variants |
| 06 | [Cheminformatics and drug discovery](./skills/06-化学信息与药物发现/) | 12 | Molecular processing, docking, medicinal chemistry, and simulation |
| 07 | [Clinical medicine and precision health](./skills/07-临床医学与精准医疗/) | 18 | Trials, clinical reports, imaging, variants, and decision support |
| 08 | [Protein engineering and structural biology](./skills/08-蛋白质工程与结构生物学/) | 7 | Protein language models, structures, domains, and sequence resources |
| 09 | [Machine learning and artificial intelligence](./skills/09-机器学习与人工智能/) | 14 | Deep learning, classical ML, forecasting, optimization, and explainability |
| 10 | [Materials science and computational physics](./skills/10-材料科学与物理计算/) | 10 | Materials, quantum computing, astronomy, fluids, and simulation |
| 11 | [Data analysis and statistical modeling](./skills/11-数据分析与统计建模/) | 11 | Dataframes, statistics, visualization, graphs, and symbolic mathematics |
| 12 | [Scientific databases](./skills/12-科学数据库/) | 22 | Chemistry, genes, proteins, pathways, populations, and patents |
| 13 | [Laboratory automation and integrations](./skills/13-实验室自动化与集成/) | 9 | ELNs, cloud labs, robotics, imaging, and workflow platforms |
| 14 | [Documents and data tools](./skills/14-文档处理与数据工具/) | 7 | PDF, Word, PowerPoint, spreadsheets, notebooks, and conversion |
| 15 | [Finance and economic data](./skills/15-金融与经济数据/) | 7 | Markets, filings, fiscal data, economic series, and research reports |
| 16 | [Geospatial analysis and remote sensing](./skills/16-地理空间与遥感/) | 2 | GIS, satellite imagery, spatial analysis, and remote sensing |
| 17 | [Platforms and infrastructure](./skills/17-平台与基础设施/) | 3 | Resource discovery, cloud compute, and ISO 13485 readiness |

### First-party Qinyan Academic skills

| Skill | Purpose |
| --- | --- |
| `qinyan-paper-search` | Search Google Scholar, PubMed, arXiv, and Wanfang through the Qinyan Academic OpenAPI |
| `qinyan-paper-analysis` | Produce structured, in-depth analysis of individual academic papers |
| `qinyan-paper-polish` | Improve Chinese and English academic prose while preserving meaning |
| `qinyan-citation` | Discover sources and format citations in common academic styles |
| `qinyan-topic-analysis` | Evaluate research topics, evidence landscapes, and promising directions |
| `qinyan-nature-writing` | Build evidence-led manuscript arguments, sections, and initial-submission materials |
| `qinyan-nature-polishing` | Restructure, translate, and polish academic prose without changing scientific meaning |
| `qinyan-nature-review` | Run traceable pre-submission review through conceptual, technical, and evidence lenses |
| `qinyan-nature-figures` | Design, export, and preflight reproducible publication figures |
| `qinyan-nature-statistics` | Plan, analyse, audit, and report design-aware manuscript statistics |

---

## 🔬 Research workflows

| Goal | Recommended starting points |
| --- | --- |
| Literature search and evidence mapping | `qinyan-paper-search`, `openalex-database`, `pubmed-database`, `literature-review` |
| Manuscript drafting and revision | `qinyan-nature-writing`, `qinyan-nature-polishing`, `qinyan-nature-review`, `venue-templates` |
| Grant and proposal development | `nsfc-proposal`, `nssfc-proposal`, `research-grants`, `research-proposal` |
| Academic slides and posters | `paper-slide-deck`, `scientific-slides`, `latex-posters`, `pptx-posters` |
| Bioinformatics and omics | `biopython`, `scanpy`, `pydeseq2`, `scvi-tools`, `gget` |
| Drug discovery and molecular modeling | `rdkit`, `deepchem`, `diffdock`, `molecular-dynamics`, `rowan` |
| Statistical analysis and visualization | `statistical-analysis`, `statsmodels`, `polars`, `plotly`, `seaborn` |
| Clinical and precision medicine | `clinical-decision-support`, `clinicaltrials-database`, `clinvar-database`, `pydicom` |

> [!TIP]
> Start with one focused skill, inspect its `SKILL.md`, and combine skills only when the research workflow genuinely needs multiple capabilities.

---

## 📖 Documentation

- [Technical guide](./docs/technical-guide.md) — installer architecture, search, update detection, and version management
- [`install.sh --help`](./install.sh) — complete CLI options and examples
- [`skills/`](./skills/) — canonical source for every skill

---

## 🙏 Sources and attribution

This collection combines first-party Qinyan Academic skills with carefully organized skills derived from the following open-source projects:

- [K-Dense-AI/claude-scientific-skills](https://github.com/K-Dense-AI/claude-scientific-skills) — broad scientific research skill collection
- [luwill/research-skills](https://github.com/luwill/research-skills) — academic slides, literature reviews, and research planning workflows
- [Yuan1z0825/nature-skills](https://github.com/Yuan1z0825/nature-skills) — Apache-2.0 architectural inspiration for Nature-focused workflows; the Qinyan suite is independently rewritten
- Qinyan Academic — paper search, paper analysis, academic polishing, citation discovery, and topic analysis

Attribution and license metadata for an individual skill remain in that skill's `SKILL.md`.

---

## 🤝 Contributing

Contributions that improve skills, translations, documentation, and installer compatibility are welcome.

1. Fork the repository and create a focused branch from `main`
2. Add or update a skill in the appropriate category, keeping `SKILL.md` as its entry point
3. Update affected documentation and translations
4. Validate links, commands, and formatting
5. Open a pull request with a clear description of the change and its impact

When changing shared facts such as counts, supported tools, or CLI flags, update all five README files in the same pull request.

---

## 📄 License

The repository is distributed under the [MIT License](./LICENSE). Individual skills may declare additional or different terms in their `SKILL.md`; review those terms before redistribution or commercial use.
