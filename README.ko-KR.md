# Qinyan Academic Skills — Nature 스타일 과학 논문 워크플로

_학술 연구를 위한 188개의 설치형 AI Agent Skills와 Nature 스타일 과학 글쓰기, 논문 윤문, 투고 전 리뷰, 과학 그림 및 통계를 위한 자체 개발 스위트입니다._

[English](./README.md) · [简体中文](./README.zh-CN.md) · [繁體中文](./README.zh-TW.md) · [日本語](./README.ja-JP.md) · **한국어**

[![Skills](https://img.shields.io/badge/skills-188-2ea44f.svg)](#-스킬-카탈로그)
[![Nature skills: 5 workflows](https://img.shields.io/badge/Nature%20skills-5%20workflows-1f6feb.svg)](./NATURE-SKILLS.md)
[![Categories](https://img.shields.io/badge/categories-18-0969da.svg)](#-스킬-카탈로그)
[![Agent support](https://img.shields.io/badge/agents-6-8250df.svg)](#-지원-에이전트)
[![License: MIT](https://img.shields.io/badge/license-MIT-f5c518.svg)](./LICENSE)

Qinyan Academic Skills는 Claude Code, Codex, Cursor, Gemini CLI, OpenClaw 및 OpenCode에 재사용 가능한 연구 역량을 제공합니다. 이 저장소에는 **18개 분야의 188개 Skills**가 있으며, 그중 5개는 Nature 스타일 과학 논문 작성, 학술 윤문, 투고 전 리뷰, 과학 시각화 및 통계 보고를 위한 통합 워크플로입니다.

전체 모음을 설치하거나 현재 워크플로에 필요한 Skill, 카테고리, 대상 도구와 설치 범위만 선택할 수 있습니다.

---

## 🧬 Nature 스타일 과학 논문 스위트

검증 가능한 과학적 주장부터 투고 준비가 완료된 원고까지, 독립적으로 또는 함께 사용할 수 있는 5개 Skills가 지원합니다.

| 논문 단계 | Skill | 주요 결과물 |
| --- | --- | --- |
| 논증과 초안 | [`qinyan-nature-writing`](./skills/沁言学术skills/qinyan-nature-writing/) | 근거 중심 서사, 섹션 초안, 제목, 초록 및 투고 자료 |
| 구조 및 문장 윤문 | [`qinyan-nature-polishing`](./skills/沁言学术skills/qinyan-nature-polishing/) | 과학적 의미를 보존하고 과도한 주장을 점검한 간결한 학술 문장 |
| 투고 전 리뷰 | [`qinyan-nature-review`](./skills/沁言学术skills/qinyan-nature-review/) | 안정적인 이슈 ID가 포함된 우선순위 기반의 추적 가능한 리뷰 |
| 그림과 시각적 근거 | [`qinyan-nature-figures`](./skills/沁言学术skills/qinyan-nature-figures/) | 재현 가능한 다중 패널 그림, 규격 내보내기 및 투고 전 검사 |
| 연구 설계와 통계 | [`qinyan-nature-statistics`](./skills/沁言学术skills/qinyan-nature-statistics/) | 추정 대상 중심 분석 계획, 보고 감사 및 그림용 결과 |

하나의 Skill 설치:

```bash
curl -fsSL https://raw.githubusercontent.com/LeonChaoX/qinyan-academic-skills/main/install.sh \
  | bash -s -- --skill qinyan-nature-writing
```

작업 라우팅, 설치 명령, 품질 기준 및 예시 프롬프트는 [전체 Nature Skills 워크플로 가이드](./NATURE-SKILLS.md)를 확인하세요.

> [!NOTE]
> “Nature 스타일”은 편집 및 과학 커뮤니케이션 목표를 의미합니다. 이 독립 프로젝트는 Nature Portfolio 또는 Springer Nature와 제휴하거나 보증받지 않았으며 논문 게재를 보장하지 않습니다.

---

## ✨ 주요 특징

| 기능 | 제공 내용 |
| --- | --- |
| **폭넓은 연구 범위** | 문헌, 집필, 생명과학, AI, 통계, 데이터베이스 및 실험실 워크플로를 아우르는 188개 Skills |
| **에이전트 간 이식성** | 하나의 설치 프로그램으로 Claude Code, Cursor, Codex, Gemini CLI, OpenClaw, OpenCode 지원 |
| **선택적 설치** | 전체 모음, 하나의 카테고리 또는 지정한 Skill만 설치 가능 |
| **프로젝트 격리** | 전역 설치 또는 현재 프로젝트 내부 설치 선택 가능 |
| **수명 주기 관리** | 검색, 상태 확인, 업데이트 확인 및 설치된 Skills 업데이트 지원 |
| **버전 관리 가능한 소스** | 모든 Skill이 일반 텍스트이므로 검토, 이전 및 사용자 지정이 용이 |

---

## 🚀 빠른 시작

### 모든 Skills 설치

기본 대상은 Claude Code의 전역 Skills 디렉터리입니다.

```bash
curl -fsSL https://raw.githubusercontent.com/LeonChaoX/qinyan-academic-skills/main/install.sh | bash
```

> [!NOTE]
> 설치 프로그램에는 Bash, Git, `curl`이 필요합니다. Windows에서는 WSL 또는 Git Bash를 사용하세요. 실행 전 소스 검토가 필요한 환경이라면 먼저 [`install.sh`](./install.sh)를 확인하세요.

### 필요한 항목만 설치

```bash
INSTALLER="https://raw.githubusercontent.com/LeonChaoX/qinyan-academic-skills/main/install.sh"

# 카테고리 하나 설치
curl -fsSL "$INSTALLER" | bash -s -- --category 01

# Skill 하나 설치
curl -fsSL "$INSTALLER" | bash -s -- --skill scanpy

# 전역이 아닌 현재 프로젝트에 설치
curl -fsSL "$INSTALLER" | bash -s -- --project --skill scientific-writing

# 다른 지원 에이전트 지정
curl -fsSL "$INSTALLER" | bash -s -- --tool codex
```

`-c`, `-s`, `-t`와 같은 단축 옵션도 지원합니다. 전체 명령은 `bash install.sh --help`에서 확인하세요.

### Skills 검색 및 관리

```bash
# 목록과 검색
bash install.sh --list
bash install.sh --list-skills
bash install.sh --search "protein"

# 상태 확인과 업데이트
bash install.sh --status
bash install.sh --check-update
bash install.sh --update
bash install.sh --update --skill scanpy
```

### 저장소 복제

```bash
git clone https://github.com/LeonChaoX/qinyan-academic-skills.git
cd qinyan-academic-skills
bash install.sh --help
```

---

## 🤖 지원 에이전트

| 에이전트 | `--tool` 값 | 전역 디렉터리 | 프로젝트 디렉터리 |
| --- | :---: | --- | --- |
| Claude Code | `claude` (기본값) | `~/.claude/skills/` | `.claude/skills/` |
| Cursor | `cursor` | `~/.cursor/skills/` | `.cursor/skills/` |
| Codex | `codex` | `~/.codex/skills/` | `.codex/skills/` |
| Gemini CLI | `gemini` | `~/.gemini/skills/` | `.gemini/skills/` |
| OpenClaw | `openclaw` | `~/.openclaw/skills/` | `.openclaw/skills/` |
| OpenCode | `opencode` | `~/.config/opencode/skills/` | `.opencode/skills/` |

---

## 🧭 스킬 카탈로그

각 카테고리에서 해당 소스 디렉터리로 바로 이동할 수 있습니다. 전체 목록은 `--list-skills`, 이름과 설명 검색은 `--search <검색어>`를 사용하세요.

| ID | 카테고리 | Skills | 주요 범위 |
| :---: | --- | ---: | --- |
| — | [Qinyan Academic Skills](./skills/沁言学术skills/) | 10 | 논문 검색, 분석, 인용 및 Nature 지향 글쓰기·리뷰·도표·통계 |
| 01 | [문헌 탐색 및 참고문헌 관리](./skills/01-论文检索与文献管理/) | 10 | 학술 검색, 리뷰, 인용 워크플로 및 문헌 데이터베이스 |
| 02 | [과학 글쓰기 및 학술 커뮤니케이션](./skills/02-科学写作与学术交流/) | 6 | 논문 작성, 동료 평가, 연구 계획 및 투고 템플릿 |
| 03 | [학술 발표 및 시각화](./skills/03-学术演示与可视化/) | 9 | 슬라이드, 포스터, 도식, 인포그래픽 및 과학 그림 |
| 04 | [연구 방법 및 과학적 사고](./skills/04-研究方法与科学思维/) | 10 | 가설, 비판적 사고, 브레인스토밍, 평가 및 연구비 신청 |
| 05 | [생물정보학 및 유전체학](./skills/05-生物信息与基因组学/) | 21 | 서열, 단일세포 분석, 조절 네트워크 및 변이 분석 |
| 06 | [화학정보학 및 신약 개발](./skills/06-化学信息与药物发现/) | 12 | 분자 처리, 도킹, 의약화학 및 시뮬레이션 |
| 07 | [임상의학 및 정밀의료](./skills/07-临床医学与精准医疗/) | 18 | 임상시험, 보고서, 영상, 변이 및 의사결정 지원 |
| 08 | [단백질 공학 및 구조생물학](./skills/08-蛋白质工程与结构生物学/) | 7 | 단백질 언어 모델, 구조, 도메인 및 서열 자원 |
| 09 | [머신러닝 및 인공지능](./skills/09-机器学习与人工智能/) | 14 | 딥러닝, 전통적 ML, 예측, 최적화 및 설명 가능성 |
| 10 | [재료과학 및 계산물리](./skills/10-材料科学与物理计算/) | 10 | 재료, 양자 컴퓨팅, 천문학, 유체 및 시뮬레이션 |
| 11 | [데이터 분석 및 통계 모델링](./skills/11-数据分析与统计建模/) | 11 | 데이터프레임, 통계, 시각화, 그래프 분석 및 기호 수학 |
| 12 | [과학 데이터베이스](./skills/12-科学数据库/) | 22 | 화학, 유전자, 단백질, 경로, 집단 및 특허 데이터베이스 |
| 13 | [실험실 자동화 및 통합](./skills/13-实验室自动化与集成/) | 9 | ELN, 클라우드 랩, 로봇공학, 영상 및 워크플로 플랫폼 |
| 14 | [문서 처리 및 데이터 도구](./skills/14-文档处理与数据工具/) | 7 | PDF, Word, PowerPoint, 스프레드시트, Notebook 및 형식 변환 |
| 15 | [금융 및 경제 데이터](./skills/15-金融与经济数据/) | 7 | 시장, 공시 자료, 재정 데이터, 경제 시계열 및 조사 보고서 |
| 16 | [지리공간 분석 및 원격탐사](./skills/16-地理空间与遥感/) | 2 | GIS, 위성 영상, 공간 분석 및 원격탐사 |
| 17 | [플랫폼 및 인프라](./skills/17-平台与基础设施/) | 3 | 리소스 탐색, 클라우드 컴퓨팅 및 ISO 13485 준비 |

### Qinyan Academic 자체 개발 Skills

| Skill | 용도 |
| --- | --- |
| `qinyan-paper-search` | Qinyan Academic OpenAPI를 통해 Google Scholar, PubMed, arXiv, Wanfang 검색 |
| `qinyan-paper-analysis` | 개별 학술 논문을 구조화하여 심층 분석 |
| `qinyan-paper-polish` | 의미를 유지하면서 중국어 및 영어 학술 문장을 개선 |
| `qinyan-citation` | 문헌을 탐색하고 주요 학술 양식으로 인용 형식을 생성 |
| `qinyan-topic-analysis` | 연구 주제, 근거 지형 및 유망한 방향 분석 |
| `qinyan-nature-writing` | 근거 중심의 논증, 논문 섹션 및 최초 투고 자료 작성 |
| `qinyan-nature-polishing` | 과학적 의미를 바꾸지 않고 문장을 재구성·번역·교정 |
| `qinyan-nature-review` | 개념·기술·근거 관점의 추적 가능한 투고 전 리뷰 수행 |
| `qinyan-nature-figures` | 재현 가능한 투고급 과학 도표 설계·내보내기·사전 점검 |
| `qinyan-nature-statistics` | 연구 설계를 반영한 통계 계획·분석·감사·보고 |

---

## 🔬 대표 연구 워크플로

| 목표 | 추천 시작 Skills |
| --- | --- |
| 문헌 검색 및 근거 정리 | `qinyan-paper-search`, `openalex-database`, `pubmed-database`, `literature-review` |
| 논문 작성 및 개정 | `qinyan-nature-writing`, `qinyan-nature-polishing`, `qinyan-nature-review`, `venue-templates` |
| 연구비 제안 및 연구 계획 | `nsfc-proposal`, `nssfc-proposal`, `research-grants`, `research-proposal` |
| 학술 슬라이드 및 포스터 | `paper-slide-deck`, `scientific-slides`, `latex-posters`, `pptx-posters` |
| 생물정보학 및 오믹스 | `biopython`, `scanpy`, `pydeseq2`, `scvi-tools`, `gget` |
| 신약 개발 및 분자 모델링 | `rdkit`, `deepchem`, `diffdock`, `molecular-dynamics`, `rowan` |
| 통계 분석 및 시각화 | `statistical-analysis`, `statsmodels`, `polars`, `plotly`, `seaborn` |
| 임상 및 정밀의료 | `clinical-decision-support`, `clinicaltrials-database`, `clinvar-database`, `pydicom` |

> [!TIP]
> 먼저 목적에 맞는 Skill 하나를 선택하고 해당 `SKILL.md`를 확인하세요. 연구 워크플로에 여러 기능이 실제로 필요한 경우에만 Skills를 조합하는 것을 권장합니다.

---

## 📖 문서

- [기술 가이드](./docs/technical-guide.md) — 설치 프로그램 구조, 검색, 업데이트 감지 및 버전 관리
- [`install.sh --help`](./install.sh) — 전체 CLI 옵션과 예제
- [`skills/`](./skills/) — 모든 Skill의 정식 소스

---

## 🙏 출처 및 감사

이 모음은 Qinyan Academic 자체 개발 Skills와 다음 오픈 소스 프로젝트에서 정리한 연구 Skills로 구성됩니다.

- [K-Dense-AI/claude-scientific-skills](https://github.com/K-Dense-AI/claude-scientific-skills) — 폭넓은 과학 연구 Skills 모음
- [luwill/research-skills](https://github.com/luwill/research-skills) — 학술 슬라이드, 문헌 리뷰 및 연구 계획 워크플로
- [Yuan1z0825/nature-skills](https://github.com/Yuan1z0825/nature-skills) — Nature 지향 워크플로의 Apache-2.0 구조에서 영감을 얻었으며 Qinyan 제품군은 독립적으로 재작성
- Qinyan Academic — 논문 검색, 논문 분석, 학술 문장 교정, 인용 탐색 및 연구 주제 분석

각 Skill의 출처와 라이선스 메타데이터는 해당 `SKILL.md`에 유지됩니다.

---

## 🤝 기여

Skills, 번역, 문서 및 설치 프로그램 호환성 개선을 환영합니다.

1. 저장소를 Fork하고 `main`에서 목적이 명확한 브랜치를 생성합니다
2. 적절한 카테고리에서 Skill을 추가하거나 업데이트하고 `SKILL.md`를 진입점으로 유지합니다
3. 영향을 받는 문서와 번역을 함께 업데이트합니다
4. 링크, 명령 및 Markdown 형식을 검증합니다
5. 변경 내용과 영향을 명확히 설명하는 Pull Request를 생성합니다

개수, 지원 도구 또는 CLI 옵션과 같은 공통 정보를 변경할 때는 동일한 Pull Request에서 5개의 README를 모두 업데이트하세요.

---

## 📄 라이선스

이 저장소는 [MIT License](./LICENSE)로 배포됩니다. 개별 Skill은 해당 `SKILL.md`에 추가되거나 다른 조건을 명시할 수 있으므로 재배포 또는 상업적 사용 전에 관련 조건을 확인하세요.
