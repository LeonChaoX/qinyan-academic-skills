---
name: qinyan-topic-analysis
description: "沁言学术AI选题分析 - 基于大量文献检索结果，为科研人员提供智能选题建议，包括选题方向、研究价值、研究内容概述、研究难点分析和相关文献推荐。使用沁言学术OpenAPI进行文献检索。触发词：选题分析、选题建议、研究选题、topic analysis、research topic、帮我选题、选题推荐"
---

# 沁言学术 - AI选题分析

## 概述

本技能通过沁言学术OpenAPI大量检索相关文献，结合AI分析能力，为科研人员提供系统化的选题建议。分析涵盖选题方向、研究价值、研究内容概述、研究难点分析以及相关文献推荐。

**学术诚信声明：** 所有选题建议基于真实检索到的文献进行分析，不捏造文献或研究趋势。建议仅供参考，最终选题决策应结合导师意见和个人研究兴趣。

## 前置条件

使用前请确保：
1. 已设置 `QINYAN_API_KEY` 环境变量（前往 https://platform.qinyanai.com/ 申请）
2. 环境中可用 `curl` 和 `python3`

```bash
export QINYAN_API_KEY="your-api-key-here"
```

## 工作流程

### 第一步：大量检索相关文献

根据用户提供的研究领域/方向，使用 `scripts/search.sh` 从多个数据库大量检索文献。

**检索策略：**
- 中文领域：优先万方 + Google Scholar
- 英文领域：优先 Google Scholar + ArXiv/PubMed
- 医学类：必须检索 PubMed（中文query需翻译为英文）
- 理工计算机类：必须检索 ArXiv（中文query需翻译为英文）
- 每个相关数据库至少检索50-100条文献，确保充分覆盖

```bash
# 检索示例
bash scripts/search.sh google '{"query": "large language models education", "max_results": 20, "date_from": "2022"}'
bash scripts/search.sh arxiv '{"query": "large language models education", "max_results": 50, "date_from": "2022"}'
bash scripts/search.sh wanfang '{"query": "大语言模型 教育应用", "max_results": 50, "date_from": "2022"}'
```

**搜索脚本参数格式同文献检索skill：**

| 数据源 | 命令 | 特殊说明 |
|--------|------|----------|
| Google Scholar | `bash scripts/search.sh google '<json>'` | 单次最多20条 |
| 万方 | `bash scripts/search.sh wanfang '<json>'` | 支持中文，1-100条 |
| PubMed | `bash scripts/search.sh pubmed '<json>'` | 仅英文，1-200条 |
| ArXiv | `bash scripts/search.sh arxiv '<json>'` | 仅英文，1-100条 |

### 第二步：文献分析与选题生成

基于检索到的大量文献，分析研究现状、热点趋势、研究空白，生成选题建议。

### 第三步：输出结构化选题建议

## 输出格式

对每个推荐的选题，按以下结构输出：

### 选题建议模板

```
## 选题方向 [序号]：[选题名称]

### 选题方向
[具体的研究方向和切入点描述]

### 研究价值
[该选题的理论价值和实践意义，为什么值得研究]

### 研究内容概述
[该选题需要研究的主要内容、技术路线或方法框架]

### 研究难点分析
[该选题可能面临的主要技术难点、数据获取困难、方法挑战等]

### 相关文献
[列出5-10篇与该选题最相关的文献，标注来源]
- [1] 作者. 标题. 期刊/会议, 年份. DOI/URL
- [2] ...
```

## 分析要求

1. **选题数量**：根据文献覆盖面，推荐 3-5 个有差异化的选题方向
2. **选题质量**：
   - 避免过于宽泛的选题（如"深度学习研究"）
   - 避免过于狭窄的选题（如"某个特定数据集上的某个指标提升"）
   - 选题应具有创新性，填补已有研究的空白
   - 选题应具有可行性，在合理的时间和资源下可完成
3. **文献支撑**：每个选题的相关文献必须来自实际检索结果，不得捏造
4. **趋势分析**：结合文献的发表时间分布，分析研究趋势
5. **差异化**：不同选题之间应有明显差异，覆盖不同的研究视角

## 示例工作流

```
用户: 我是计算机专业硕士研究生，想研究大语言模型在教育领域的应用，帮我分析选题

步骤1: 检索文献
- ArXiv: "large language models education" (50条)
- Google Scholar: "LLM education application" (20条)
- 万方: "大语言模型 教育" (50条)

步骤2: 分析文献趋势和研究空白

步骤3: 输出3-5个差异化选题建议，每个包含完整的五要素分析
```
