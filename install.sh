#!/bin/bash
# 沁言学术科研论文 Skills 库 - 一键安装脚本
#
# 用法:
#   安装全部:        bash install.sh
#   安装某个分类:    bash install.sh --category 01
#   安装单个skill:   bash install.sh --skill academic-paper-search
#   安装到项目:      bash install.sh --project
#   列出所有分类:    bash install.sh --list
#   列出所有skills:  bash install.sh --list-skills
#   搜索skill:       bash install.sh --search 论文
#   指定工具:        bash install.sh --tool cursor
#
# 远程一键安装:
#   curl -fsSL https://raw.githubusercontent.com/qinyan-ai/qinyan-academic-skills/main/install.sh | bash
#   curl -fsSL https://raw.githubusercontent.com/qinyan-ai/qinyan-academic-skills/main/install.sh | bash -s -- --skill scanpy
#   curl -fsSL https://raw.githubusercontent.com/qinyan-ai/qinyan-academic-skills/main/install.sh | bash -s -- --category 05

set -e

REPO_URL="https://github.com/qinyan-ai/qinyan-academic-skills.git"
TEMP_DIR=$(mktemp -d)
trap "rm -rf $TEMP_DIR" EXIT

# ========== 参数解析 ==========
SCOPE="global"
MODE="all"
TARGET=""
TOOL="claude"
SEARCH_TERM=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --project)
            SCOPE="project"; shift ;;
        --category|-c)
            MODE="category"; TARGET="$2"; shift 2 ;;
        --skill|-s)
            MODE="skill"; TARGET="$2"; shift 2 ;;
        --list|-l)
            MODE="list"; shift ;;
        --list-skills|-ls)
            MODE="list-skills"; shift ;;
        --search)
            MODE="search"; SEARCH_TERM="$2"; shift 2 ;;
        --tool|-t)
            TOOL="$2"; shift 2 ;;
        --help|-h)
            MODE="help"; shift ;;
        *)
            # 兼容旧用法: 第一个参数作为分类
            if [ -z "$TARGET" ]; then
                MODE="category"; TARGET="$1"
            fi
            shift ;;
    esac
done

# ========== 帮助信息 ==========
if [ "$MODE" = "help" ]; then
    cat << 'HELP'
沁言学术科研论文 Skills 库 - 安装脚本

用法:
  bash install.sh [选项]

选项:
  (无参数)                    安装全部 177 个 Skills
  --category, -c <编号/名称>  安装某个分类 (如: 01, 05, "01-论文检索与文献管理")
  --skill, -s <名称>          安装单个 Skill (如: scanpy, academic-paper-search)
  --list, -l                  列出所有分类
  --list-skills, -ls          列出所有 Skills
  --search <关键词>           搜索 Skills (如: 论文, 蛋白质, ML)
  --project                   安装到当前项目目录 (而非全局)
  --tool, -t <工具>           指定目标工具: claude(默认), cursor, codex, gemini
  --help, -h                  显示帮助

远程一键安装示例:
  # 安装全部
  curl -fsSL https://raw.githubusercontent.com/qinyan-ai/qinyan-academic-skills/main/install.sh | bash

  # 安装单个 Skill
  curl -fsSL https://raw.githubusercontent.com/qinyan-ai/qinyan-academic-skills/main/install.sh | bash -s -- --skill scanpy

  # 安装某个分类
  curl -fsSL https://raw.githubusercontent.com/qinyan-ai/qinyan-academic-skills/main/install.sh | bash -s -- --category 05

  # 安装到 Cursor
  curl -fsSL https://raw.githubusercontent.com/qinyan-ai/qinyan-academic-skills/main/install.sh | bash -s -- --tool cursor
HELP
    exit 0
fi

# ========== 安装目录 ==========
case $TOOL in
    claude)  SKILLS_DIR=".claude/skills" ;;
    cursor)  SKILLS_DIR=".cursor/skills" ;;
    codex)   SKILLS_DIR=".codex/skills" ;;
    gemini)  SKILLS_DIR=".gemini/skills" ;;
    *)       echo "错误: 不支持的工具 '$TOOL'，可选: claude, cursor, codex, gemini"; exit 1 ;;
esac

if [ "$SCOPE" = "project" ]; then
    INSTALL_DIR="$PWD/$SKILLS_DIR"
else
    INSTALL_DIR="$HOME/$SKILLS_DIR"
fi

# ========== 克隆仓库 ==========
echo "📦 正在获取 Skills 库..."
git clone --depth 1 -q "$REPO_URL" "$TEMP_DIR/repo" 2>/dev/null
SKILLS_ROOT="$TEMP_DIR/repo/skills"

# ========== 列出分类 ==========
if [ "$MODE" = "list" ]; then
    echo ""
    echo "📚 可用分类:"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    for d in "$SKILLS_ROOT"/*/; do
        name=$(basename "$d")
        count=$(find "$d" -maxdepth 1 -mindepth 1 -type d | wc -l)
        printf "  %-36s (%d skills)\n" "$name" "$count"
    done
    echo ""
    echo "安装示例: bash install.sh --category 01"
    exit 0
fi

# ========== 列出所有 Skills ==========
if [ "$MODE" = "list-skills" ]; then
    echo ""
    echo "📚 全部 Skills:"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    for d in "$SKILLS_ROOT"/*/; do
        category=$(basename "$d")
        echo ""
        echo "【$category】"
        for s in "$d"*/; do
            [ -d "$s" ] && printf "  • %s\n" "$(basename "$s")"
        done
    done
    echo ""
    exit 0
fi

# ========== 搜索 Skills ==========
if [ "$MODE" = "search" ]; then
    echo ""
    echo "🔍 搜索 '$SEARCH_TERM':"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    found=0
    for d in "$SKILLS_ROOT"/*/; do
        category=$(basename "$d")
        for s in "$d"*/; do
            [ ! -d "$s" ] && continue
            skill_name=$(basename "$s")
            # 搜索目录名和 SKILL.md 内容
            if echo "$skill_name $category" | grep -qi "$SEARCH_TERM" 2>/dev/null || \
               ([ -f "$s/SKILL.md" ] && grep -qi "$SEARCH_TERM" "$s/SKILL.md" 2>/dev/null); then
                # 提取 SKILL.md 的 description
                desc=""
                if [ -f "$s/SKILL.md" ]; then
                    desc=$(grep -m1 '^description:' "$s/SKILL.md" 2>/dev/null | sed 's/^description:[[:space:]]*//' | sed 's/^"//' | sed 's/"$//' | head -c 80)
                fi
                printf "  %-30s [%s]\n" "$skill_name" "$category"
                [ -n "$desc" ] && printf "    %s\n" "$desc"
                found=$((found + 1))
            fi
        done
    done
    echo ""
    echo "找到 $found 个匹配的 Skills"
    [ $found -gt 0 ] && echo "安装示例: bash install.sh --skill <名称>"
    exit 0
fi

# ========== 安装逻辑 ==========
mkdir -p "$INSTALL_DIR"

install_skill_dir() {
    local src="$1"
    local name=$(basename "$src")
    cp -r "$src" "$INSTALL_DIR/"
    echo "  ✅ $name"
}

case $MODE in
    all)
        echo "🚀 安装全部 Skills 到 $INSTALL_DIR"
        echo ""
        total=0
        for category_dir in "$SKILLS_ROOT"/*/; do
            category=$(basename "$category_dir")
            echo "📂 $category"
            for skill_dir in "$category_dir"*/; do
                [ -d "$skill_dir" ] && install_skill_dir "$skill_dir" && total=$((total + 1))
            done
        done
        echo ""
        echo "🎉 安装完成！共 $total 个 Skills"
        ;;
    category)
        # 支持编号匹配 (如 "01" 匹配 "01-论文检索与文献管理")
        matched_dir=""
        for d in "$SKILLS_ROOT"/*/; do
            dirname=$(basename "$d")
            if [ "$dirname" = "$TARGET" ] || [[ "$dirname" == ${TARGET}-* ]] || [[ "$dirname" == *"$TARGET"* ]]; then
                matched_dir="$d"
                break
            fi
        done

        if [ -z "$matched_dir" ]; then
            echo "❌ 未找到分类 '$TARGET'"
            echo ""
            echo "可用分类:"
            for d in "$SKILLS_ROOT"/*/; do
                echo "  $(basename "$d")"
            done
            exit 1
        fi

        category_name=$(basename "$matched_dir")
        echo "🚀 安装分类 [$category_name] 到 $INSTALL_DIR"
        echo ""
        count=0
        for skill_dir in "$matched_dir"*/; do
            [ -d "$skill_dir" ] && install_skill_dir "$skill_dir" && count=$((count + 1))
        done
        echo ""
        echo "🎉 安装完成！共 $count 个 Skills"
        ;;
    skill)
        # 在所有分类中搜索指定 skill
        found_dir=""
        found_category=""
        for d in "$SKILLS_ROOT"/*/; do
            if [ -d "$d/$TARGET" ]; then
                found_dir="$d/$TARGET"
                found_category=$(basename "$d")
                break
            fi
        done

        # 模糊匹配
        if [ -z "$found_dir" ]; then
            for d in "$SKILLS_ROOT"/*/*/; do
                dirname=$(basename "$d")
                if [[ "$dirname" == *"$TARGET"* ]]; then
                    found_dir="$d"
                    found_category=$(basename "$(dirname "$d")")
                    break
                fi
            done
        fi

        if [ -z "$found_dir" ]; then
            echo "❌ 未找到 Skill '$TARGET'"
            echo ""
            echo "使用 --search 搜索: bash install.sh --search $TARGET"
            exit 1
        fi

        echo "🚀 安装 Skill [$(basename "$found_dir")] (来自 $found_category)"
        echo "   目标: $INSTALL_DIR"
        echo ""
        install_skill_dir "$found_dir"
        echo ""
        echo "🎉 安装完成！"
        ;;
esac

echo "📍 安装目录: $INSTALL_DIR"
