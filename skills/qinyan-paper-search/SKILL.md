---
name: qinyan-paper-search
description: "沁言学术文献检索 - 支持从 Google Scholar、万方(Wanfang)、PubMed、ArXiv 四大学术数据库检索文献。智能选择检索策略：中文优先万方、英文优先Google Scholar、医学类优先PubMed、理工计算机类优先ArXiv。使用沁言学术OpenAPI。触发词：文献检索、论文搜索、搜索论文、查找文献、paper search、find papers、search literature"
---

# 沁言学术 - 文献检索

## 概述

本技能通过沁言学术OpenAPI，支持从 Google Scholar、万方(Wanfang)、PubMed、ArXiv 四大学术数据库进行文献检索。根据用户查询的语言和学科领域，智能选择最优检索策略。

**学术诚信声明：** 所有检索结果均来自真实学术数据库，严禁捏造或猜测文献信息。如检索结果不完整，应如实告知用户。

## 前置条件

使用前请确保：
1. 已设置 `QINYAN_API_KEY` 环境变量（前往 https://platform.qinyanai.com/ 申请）
2. 环境中可用 `curl` 和 `python3`

```bash
export QINYAN_API_KEY="your-api-key-here"
```

## 智能检索策略

收到用户的检索请求后，请按以下策略选择数据源：

### 语言策略
- **中文查询**：优先使用 **万方(Wanfang)**，可同时检索 Google Scholar
- **英文查询**：优先使用 **Google Scholar**，可同时检索其他英文数据库

### 学科策略
- **医学/生物医学/生命科学**：优先使用 **PubMed**（不支持中文query，需翻译为英文）
- **计算机科学/理工/数学/物理**：优先使用 **ArXiv**（不支持中文query，需翻译为英文）
- **社科/人文/综合**：优先使用 **Google Scholar** 或 **万方**

### 重要提醒
- **PubMed 和 ArXiv 不支持中文检索**：如用户使用中文关键词且需检索这两个数据库，必须先将查询词翻译为准确的英文学术术语，再发起检索
- 可同时检索多个数据库以获取更全面的结果
- 向用户说明实际使用了哪些数据库进行检索

## 使用方法

通过 `scripts/search.sh` 脚本调用API，指定数据源和检索参数：

```bash
bash scripts/search.sh <source> '<json_payload>'
```

其中 `<source>` 为：`google` | `wanfang` | `pubmed` | `arxiv`

### 各数据库参数说明

#### Google Scholar
```bash
bash scripts/search.sh google '{"query": "deep learning", "max_results": 20, "offset": 0, "date_from": "2020", "date_to": "2025", "author": "Hinton", "journal": "Nature", "language": "english"}'
```
| 参数 | 类型 | 必填 | 说明 |
|------|------|------|------|
| query | string | 是 | 检索关键词，支持布尔表达式（1-300字符） |
| max_results | int | 否(默认20) | 返回数量，最大20 |
| offset | int | 否(默认0) | 分页偏移量 |
| date_from | string | 否 | 起始年份，如 "2020" |
| date_to | string | 否 | 截止年份，如 "2025" |
| author | string | 否 | 按作者筛选 |
| journal | string | 否 | 按期刊筛选 |
| language | string | 否 | "english" 或 "中文"，留空不限 |

#### 万方(Wanfang)
```bash
bash scripts/search.sh wanfang '{"query": "人工智能 教育", "max_results": 50, "date_from": "2020", "date_to": "2025"}'
```
| 参数 | 类型 | 必填 | 说明 |
|------|------|------|------|
| query | string | 是 | 检索关键词，支持中英文（1-300字符） |
| max_results | int | 否(默认50) | 返回数量，1-100 |
| date_from | string | 否 | 起始年份 |
| date_to | string | 否 | 截止年份 |

#### PubMed
```bash
bash scripts/search.sh pubmed '{"query": "cancer immunotherapy", "max_results": 50, "offset": 0, "date_from": "2020", "date_to": "2025"}'
```
| 参数 | 类型 | 必填 | 说明 |
|------|------|------|------|
| query | string | 是 | 检索关键词，支持PubMed查询语法（1-300字符，仅英文） |
| max_results | int | 否(默认50) | 返回数量，1-200 |
| offset | int | 否(默认0) | 分页偏移量 |
| date_from | string | 否 | 起始日期，"YYYY" 或 "YYYYMMDD" |
| date_to | string | 否 | 截止日期，"YYYY" 或 "YYYYMMDD" |

#### ArXiv
```bash
bash scripts/search.sh arxiv '{"query": "transformer attention", "max_results": 50, "offset": 0, "date_from": "2020", "date_to": "2025", "author": "Vaswani"}'
```
| 参数 | 类型 | 必填 | 说明 |
|------|------|------|------|
| query | string | 是 | 检索关键词，支持ArXiv查询语法（1-300字符，仅英文） |
| max_results | int | 否(默认50) | 返回数量，1-100 |
| offset | int | 否(默认0) | 分页偏移量 |
| date_from | string | 否 | 起始日期 |
| date_to | string | 否 | 截止日期 |
| author | string | 否 | 按作者筛选 |

## 输出格式

检索结果以结构化方式呈现给用户：

1. **说明检索策略**：告知用户选择了哪些数据库及原因
2. **结果列表**：每条文献包含：
   - 标题（加粗）
   - 作者列表
   - 发表年份 / 期刊或来源
   - 摘要（适当截断）
   - DOI链接（如有）
   - PDF链接（如有）
   - 数据来源标注
3. **结果统计**：总计检索到多少条结果

## 示例工作流

### 用户输入中文查询
```
用户: 帮我检索关于"深度学习在医学影像中的应用"的文献
```
1. 识别为中文查询 + 医学领域
2. 将查询翻译为英文: "deep learning medical imaging applications"
3. 优先检索 **万方**（中文文献）和 **PubMed**（英文医学文献）
4. 整合结果返回用户

### 用户输入英文查询
```
用户: Search papers about "large language models for code generation"
```
1. 识别为英文查询 + 计算机领域
2. 优先检索 **Google Scholar** 和 **ArXiv**
3. 整合结果返回用户
