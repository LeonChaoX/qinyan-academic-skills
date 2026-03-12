---
name: qinyan-paper-analysis
description: "沁言学术论文分析 - 对单篇学术论文进行深度分析解读，提取研究目标、方法论、主要发现和研究限制。通过沁言学术OpenAPI的analyze接口实现。触发词：论文分析、论文解读、分析论文、paper analysis、analyze paper、论文解析"
---

# 沁言学术 - 论文分析

## 概述

本技能通过沁言学术OpenAPI的论文分析接口，对单篇学术论文进行深度分析解读。系统会获取论文内容（通过PDF、网页或摘要），生成结构化的研究分析报告，包括研究目标、方法论、主要发现和研究限制。

**学术诚信声明：** 分析结果基于论文实际内容生成，不会捏造或猜测论文中未包含的信息。如无法获取完整论文内容，将基于可获取的信息（如摘要）进行有限分析，并明确告知用户分析的局限性。

## 前置条件

使用前请确保：
1. 已设置 `QINYAN_API_KEY` 环境变量（前往 https://platform.qinyanai.com/ 申请）
2. 环境中可用 `curl` 和 `python3`

```bash
export QINYAN_API_KEY="your-api-key-here"
```

## API接口

**接口地址：** `https://api.qinyanai.com/v1/paper-search/analyze`

### 请求参数

| 参数 | 类型 | 必填 | 说明 |
|------|------|------|------|
| title | string | 是 | 论文标题（1-1024字符） |
| authors | string[] | 是 | 作者列表 |
| abstract | string | 否 | 论文摘要（最长10000字符） |
| doi | string | 否 | DOI标识符 |
| source_url | string | 否 | 论文页面URL |
| pdf_url | string | 否 | PDF直链（优先级最高） |
| language | string | 否(默认"中文") | 输出语言："中文" 或 "en" |

**注意：** `abstract`、`source_url`、`pdf_url` 至少需提供其一，以便系统获取论文内容。`pdf_url` 优先级最高，能获得最完整的分析结果。

## 使用方法

通过 `scripts/analyze.sh` 脚本调用：

```bash
bash scripts/analyze.sh '<json_payload>'
```

### 示例

基本分析（通过DOI）：
```bash
bash scripts/analyze.sh '{"title": "Attention Is All You Need", "authors": ["Ashish Vaswani", "Noam Shazeer", "Niki Parmar"], "doi": "10.48550/arXiv.1706.03762", "language": "中文"}'
```

通过PDF链接分析：
```bash
bash scripts/analyze.sh '{"title": "BERT: Pre-training of Deep Bidirectional Transformers", "authors": ["Jacob Devlin"], "pdf_url": "https://arxiv.org/pdf/1810.04805.pdf", "language": "中文"}'
```

通过摘要分析：
```bash
bash scripts/analyze.sh '{"title": "论文标题", "authors": ["作者1", "作者2"], "abstract": "本文提出了...", "language": "中文"}'
```

英文输出：
```bash
bash scripts/analyze.sh '{"title": "Paper Title", "authors": ["Author1"], "doi": "10.xxxx/xxxxx", "language": "en"}'
```

## 返回结果

API返回结构化分析结果：

```json
{
  "success": true,
  "message": "Paper analysis completed successfully",
  "paper_title": "论文标题",
  "analysis": {
    "研究目标": "提出一种新的...",
    "方法论": "设计了...",
    "主要发现": "实验结果表明...",
    "研究限制": "本研究主要在...方面存在局限"
  }
}
```

## 输出格式

向用户呈现分析结果时，按以下结构组织：

1. **论文基本信息**
   - 标题、作者、DOI等

2. **研究目标**
   - 论文要解决的核心问题

3. **方法论**
   - 使用的研究方法、技术路线、实验设计

4. **主要发现**
   - 核心研究成果和结论

5. **研究限制**
   - 研究的局限性和不足之处

## 工作流建议

1. 如用户只提供论文标题，先尝试通过文献检索获取DOI、摘要等完整信息
2. 优先使用 `pdf_url`（分析最完整），其次 `source_url`，最后 `abstract`
3. 分析完成后，可建议用户是否需要进一步的文献检索或相关论文推荐
