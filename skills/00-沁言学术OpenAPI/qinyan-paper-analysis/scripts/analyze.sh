#!/usr/bin/env bash
# 沁言学术 - 论文分析脚本
# 调用 analyze 接口对单篇论文进行深度分析
# Usage: bash analyze.sh '<json_payload>'
# Example: bash analyze.sh '{"title": "Attention Is All You Need", "authors": ["Vaswani et al."], "doi": "10.48550/arXiv.1706.03762"}'

set -euo pipefail

API_BASE="https://api.qinyanai.com"
ENDPOINT="/v1/paper-search/analyze"

if [ -z "${QINYAN_API_KEY:-}" ]; then
    echo "Error: QINYAN_API_KEY 环境变量未设置。"
    echo "请前往 https://platform.qinyanai.com/ 申请API Key"
    echo "然后设置: export QINYAN_API_KEY='your-api-key-here'"
    exit 1
fi

PAYLOAD="${1:-}"
if [ -z "$PAYLOAD" ]; then
    echo "Usage: bash analyze.sh '<json_payload>'"
    echo "Example: bash analyze.sh '{\"title\": \"Paper Title\", \"authors\": [\"Author1\"], \"abstract\": \"...\"}'"
    exit 1
fi

# 验证 JSON 格式
if ! echo "$PAYLOAD" | python3 -c "import sys,json; json.load(sys.stdin)" 2>/dev/null; then
    echo "Error: JSON 格式无效。"
    exit 1
fi

echo "正在分析论文（预计需要30-120秒）..." >&2

RESPONSE=$(curl -s -w "\n%{http_code}" \
    -X POST "${API_BASE}${ENDPOINT}" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer ${QINYAN_API_KEY}" \
    -d "$PAYLOAD" \
    --connect-timeout 15 \
    --max-time 300)

HTTP_CODE=$(echo "$RESPONSE" | tail -1)
BODY=$(echo "$RESPONSE" | sed '$d')

if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 300 ]; then
    echo "$BODY" | python3 -m json.tool 2>/dev/null || echo "$BODY"
else
    echo "Error: HTTP $HTTP_CODE"
    echo "$BODY" | python3 -m json.tool 2>/dev/null || echo "$BODY"
    exit 1
fi
