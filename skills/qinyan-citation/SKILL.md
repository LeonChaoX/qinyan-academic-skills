---
name: qinyan-citation
description: "沁言学术文献引用 - 先通过沁言学术OpenAPI检索文献，然后按照GB/T 7714、IEEE、APA、MLA、Chicago、Harvard等标准格式输出引用参考文献。严格遵循学术规范，未获取的信息保留省略号。触发词：文献引用、参考文献、引用格式、citation、reference format、生成引用、引用管理、参考文献格式"
---

# 沁言学术 - 文献引用

## 概述

本技能通过沁言学术OpenAPI检索文献元数据，并按照用户指定的标准格式生成规范的引用参考文献。支持GB/T 7714、IEEE、APA、MLA、Chicago、Harvard等主流引用格式。

**学术诚信声明（极其重要）：**
- 所有引用信息必须来自实际检索到的文献元数据
- **严禁捏造或猜测任何引用信息**（包括卷号、期号、页码、DOI等）
- 如检索结果中缺少某些字段（如卷号、期号、页码），**必须使用省略号(...)或[缺失]标注**，绝不可编造
- 建议用户核实引用信息的完整性和准确性

## 前置条件

使用前请确保：
1. 已设置 `QINYAN_API_KEY` 环境变量（前往 https://platform.qinyanai.com/ 申请）
2. 环境中可用 `curl` 和 `python3`

```bash
export QINYAN_API_KEY="your-api-key-here"
```

## 工作流程

### 第一步：检索文献

根据用户提供的信息（论文标题、作者、关键词等），使用 `scripts/search.sh` 检索文献获取完整元数据。

```bash
bash scripts/search.sh <source> '<json_payload>'
```

数据源选择策略：
- 中文文献：优先 **万方(wanfang)**
- 英文文献：优先 **Google Scholar(google)**
- 医学文献：优先 **PubMed(pubmed)**（query需为英文）
- 计算机/理工：优先 **ArXiv(arxiv)**（query需为英文）

各数据源参数：

| 数据源 | 命令 | 核心参数 |
|--------|------|----------|
| Google Scholar | `bash scripts/search.sh google '<json>'` | query, max_results(≤20), author, journal |
| 万方 | `bash scripts/search.sh wanfang '<json>'` | query, max_results(≤100) |
| PubMed | `bash scripts/search.sh pubmed '<json>'` | query(英文), max_results(≤200) |
| ArXiv | `bash scripts/search.sh arxiv '<json>'` | query(英文), max_results(≤100), author |

### 第二步：提取元数据

从检索结果中提取引用所需的元数据字段：
- 作者(authors)
- 标题(title)
- 期刊/会议名称(journal/venue)
- 发表年份(year)
- 卷号(volume)
- 期号(issue/number)
- 页码(pages)
- DOI
- URL
- 出版社(publisher)

### 第三步：生成标准引用格式

根据用户指定的格式标准，生成规范引用。**缺失字段必须保留标注，不可编造。**

## 支持的引用格式

### 1. GB/T 7714（中国国家标准）

适用于中文学术论文、学位论文。

**期刊论文格式：**
```
[序号] 作者1, 作者2, 作者3, 等. 论文标题[J]. 期刊名, 年份, 卷(期): 起始页-终止页.
```
示例：
```
[1] 张三, 李四, 王五. 深度学习在医学影像中的应用研究[J]. 计算机学报, 2023, 46(3): 512-528.
```
缺失信息示例：
```
[1] 张三, 李四. 深度学习在医学影像中的应用研究[J]. 计算机学报, 2023, ...: ...
```

**会议论文格式：**
```
[序号] 作者. 论文标题[C]//会议名称. 出版地: 出版者, 年份: 起始页-终止页.
```

**学位论文格式：**
```
[序号] 作者. 论文标题[D]. 学校所在地: 学校名称, 年份.
```

**电子文献格式：**
```
[序号] 作者. 标题[EB/OL]. (发表日期)[引用日期]. URL.
```

### 2. IEEE

适用于电气工程、计算机科学领域。

```
[序号] 作者缩写, "论文标题," 期刊名(斜体), vol. 卷号, no. 期号, pp. 起始页–终止页, 月份 年份, doi: DOI.
```
示例：
```
[1] A. Vaswani et al., "Attention is all you need," in Proc. Advances in Neural Information Processing Systems (NeurIPS), 2017, pp. 5998–6008.
```
缺失信息示例：
```
[1] A. Vaswani et al., "Attention is all you need," in Proc. NeurIPS, 2017, pp. ...
```

### 3. APA（第7版）

适用于社会科学、心理学、教育学。

```
作者1, A. B., & 作者2, C. D. (年份). 论文标题. 期刊名(斜体), 卷号(期号), 起始页–终止页. https://doi.org/DOI
```
示例：
```
Devlin, J., Chang, M. W., Lee, K., & Toutanova, K. (2019). BERT: Pre-training of deep bidirectional transformers for language understanding. In Proceedings of NAACL-HLT (pp. 4171–4186).
```

### 4. MLA（第9版）

适用于人文学科、语言文学。

```
作者姓, 名. "论文标题." 期刊名(斜体), vol. 卷号, no. 期号, 年份, pp. 起始页–终止页.
```

### 5. Chicago（注释-参考文献格式）

适用于历史学、艺术、人文学科。

```
作者姓, 名. "论文标题." 期刊名(斜体) 卷号, no. 期号 (年份): 起始页–终止页.
```

### 6. Harvard

适用于多学科，英联邦国家常用。

```
作者姓, 名缩写. (年份) '论文标题', 期刊名(斜体), 卷号(期号), pp. 起始页–终止页. doi: DOI.
```

### 7. Vancouver

适用于医学、生物医学领域。

```
作者缩写. 论文标题. 期刊缩写名. 年份;卷号(期号):起始页-终止页.
```

## 缺失信息处理规则（极其重要）

当检索结果中缺少某些引用所需字段时，严格按以下规则处理：

| 缺失字段 | 处理方式 |
|----------|----------|
| 卷号 | 保留为 `...` 或 `[卷号缺失]` |
| 期号 | 保留为 `...` 或 `[期号缺失]` |
| 页码 | 保留为 `...` 或 `[页码缺失]` |
| DOI | 标注"DOI缺失"或省略DOI字段 |
| 出版社 | 保留为 `...` 或 `[出版社缺失]` |
| 发表月份 | 可省略或标注缺失 |

**示例（GB/T 7714，缺少卷号和页码）：**
```
[1] Smith J, Brown A. Application of deep learning in NLP[J]. Nature Machine Intelligence, 2023, ...: ...
```

**绝对不允许：**
- 编造不存在的卷号、期号、页码
- 猜测DOI编号
- 虚构出版社或会议名称

## 输出格式

```
## 参考文献（[格式名称] 格式）

[按格式要求列出的参考文献列表]

---

**注意事项：**
- 以下文献的 [具体字段] 信息未能从数据库获取，已用省略号标注，请作者自行补充核实
- 建议通过论文原文或出版商网站核实引用信息的完整性
```

## 示例工作流

```
用户: 帮我生成以下论文的GB/T 7714格式引用：Attention Is All You Need

步骤1: 检索文献
bash scripts/search.sh google '{"query": "Attention Is All You Need Vaswani", "max_results": 5}'

步骤2: 从结果中提取元数据
- 标题: Attention Is All You Need
- 作者: Vaswani A, Shazeer N, Parmar N, 等
- 会议: Advances in Neural Information Processing Systems
- 年份: 2017
- 页码: 5998-6008

步骤3: 生成引用
[1] Vaswani A, Shazeer N, Parmar N, 等. Attention is all you need[C]//Advances in Neural Information Processing Systems. 2017: 5998-6008.
```
