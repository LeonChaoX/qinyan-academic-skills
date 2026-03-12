#!/usr/bin/env bash
# 沁言学术 - 文献检索脚本
# 支持 Google Scholar / Wanfang / PubMed / ArXiv 四大学术数据库
# Usage: bash search.sh <source> '<json_payload>'
# source: google | wanfang | pubmed | arxiv
# Example: bash search.sh google '{"query": "deep learning", "max_results": 20}'

set -euo pipefail

API_BASE="https://api.qinyanai.com"

if [ -z "${QINYAN_API_KEY:-}" ]; then
    echo "Error: QINYAN_API_KEY 环境变量未设置。"
    echo "请前往 https://platform.qinyanai.com/ 申请API Key"
    echo "然后设置: export QINYAN_API_KEY='your-api-key-here'"
    exit 1
fi

SOURCE="${1:-}"
PAYLOAD="${2:-}"

if [ -z "$SOURCE" ] || [ -z "$PAYLOAD" ]; then
    echo "Usage: bash search.sh <source> '<json_payload>'"
    echo "  source: google | wanfang | pubmed | arxiv"
    echo "  Example: bash search.sh google '{\"query\": \"deep learning\", \"max_results\": 20}'"
    exit 1
fi

# 验证 source 参数
case "$SOURCE" in
    google|wanfang|pubmed|arxiv) ;;
    *)
        echo "Error: 不支持的数据源 '$SOURCE'"
        echo "支持的数据源: google, wanfang, pubmed, arxiv"
        exit 1
        ;;
esac

ENDPOINT="/v1/paper-search/${SOURCE}"

# 验证 JSON 格式
if ! echo "$PAYLOAD" | python3 -c "import sys,json; json.load(sys.stdin)" 2>/dev/null; then
    echo "Error: JSON 格式无效。"
    exit 1
fi

RESPONSE=$(curl -s -w "\n%{http_code}" \
    -X POST "${API_BASE}${ENDPOINT}" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer ${QINYAN_API_KEY}" \
    -d "$PAYLOAD" \
    --connect-timeout 15 \
    --max-time 120)

HTTP_CODE=$(echo "$RESPONSE" | tail -1)
BODY=$(echo "$RESPONSE" | sed '$d')

if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 300 ]; then
    echo "$BODY" | python3 -m json.tool 2>/dev/null || echo "$BODY"
else
    echo "Error: HTTP $HTTP_CODE"
    echo "$BODY" | python3 -m json.tool 2>/dev/null || echo "$BODY"
    exit 1
fi
