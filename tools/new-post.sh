#!/usr/bin/env bash
# Generate a new Korean draft post in _drafts/ using the Claude API.
#
# Usage:
#   ANTHROPIC_API_KEY=sk-ant-... tools/new-post.sh <slug> "<topic prompt>"
#
# Arguments:
#   <slug>          URL slug (lowercase, hyphenated). Used as filename and `ref:` field.
#                   The English translation should later use the same ref.
#   <topic prompt>  Description of what the post should cover (any language).
#
# Environment variables:
#   ANTHROPIC_API_KEY  Required. Your Anthropic API key.
#   CLAUDE_MODEL       Optional. Default: claude-sonnet-4-6.
#
# Requirements: curl, jq, git.

set -euo pipefail

if [[ $# -lt 2 ]]; then
  sed -n '2,17p' "$0" >&2
  exit 2
fi

SLUG="$1"
TOPIC="$2"
MODEL="${CLAUDE_MODEL:-claude-sonnet-4-6}"

if [[ -z "${ANTHROPIC_API_KEY:-}" ]]; then
  echo "Error: ANTHROPIC_API_KEY environment variable is not set." >&2
  exit 1
fi

for cmd in curl jq git; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "Error: required command '$cmd' is not installed." >&2
    exit 1
  fi
done

ROOT="$(git rev-parse --show-toplevel)"
DRAFTS_DIR="$ROOT/_drafts"
mkdir -p "$DRAFTS_DIR"

DATE=$(date +%Y-%m-%d)
DATETIME=$(date +"%Y-%m-%d %H:%M:%S %z")
FILE="$DRAFTS_DIR/${DATE}-${SLUG}.md"

if [[ -e "$FILE" ]]; then
  echo "Error: $FILE already exists." >&2
  exit 1
fi

PROMPT="당신은 14년 경력의 풀스택 개발자 Justin Choi의 기술 블로그를 위한 글을 작성합니다.
주제는 다음과 같습니다:

$TOPIC

요청사항:
- 한국어로 작성하세요.
- AI 도구, 바이브 코딩(vibe coding), AI 에이전트 활용 관점을 자연스럽게 녹여 강조하세요.
- 구조: 도입(왜 중요한가) → 본론 섹션 3~5개(## 헤더) → 마무리.
- 코드 예제가 적절하면 \`\`\` 펜스로 감싸 포함하세요.
- 분량은 800~1500단어.
- front matter(--- 블록)는 절대 포함하지 마세요. 본문 마크다운만 출력하세요.
- 첫 줄은 \"# 제목\" 한 줄로 시작하세요."

REQUEST=$(jq -n \
  --arg model "$MODEL" \
  --arg prompt "$PROMPT" \
  '{
    model: $model,
    max_tokens: 8000,
    messages: [{role: "user", content: $prompt}]
  }')

echo "Calling Claude ($MODEL) for slug='$SLUG'..." >&2

RESPONSE=$(curl -sS -X POST https://api.anthropic.com/v1/messages \
  -H "x-api-key: $ANTHROPIC_API_KEY" \
  -H "anthropic-version: 2023-06-01" \
  -H "content-type: application/json" \
  -d "$REQUEST")

if echo "$RESPONSE" | jq -e '.error' >/dev/null 2>&1; then
  echo "API returned an error:" >&2
  echo "$RESPONSE" | jq '.' >&2
  exit 1
fi

BODY=$(echo "$RESPONSE" | jq -r '.content[0].text // empty')

if [[ -z "$BODY" ]]; then
  echo "Error: empty response from API." >&2
  echo "$RESPONSE" | jq '.' >&2
  exit 1
fi

TITLE=$(printf '%s\n' "$BODY" | awk '/^# /{sub(/^# /, ""); print; exit}')
CONTENT=$(printf '%s\n' "$BODY" | awk 'BEGIN{stripped=0} /^# /&&!stripped{stripped=1; next} {print}')

if [[ -z "$TITLE" ]]; then
  TITLE="$SLUG"
fi

ESC_TITLE=${TITLE//\"/\\\"}

{
  printf -- '---\n'
  printf 'title: "%s"\n' "$ESC_TITLE"
  printf 'lang: ko\n'
  printf 'ref: %s\n' "$SLUG"
  printf 'date: %s\n' "$DATETIME"
  printf 'categories: [AI]\n'
  printf 'tags: [ai, vibe-coding]\n'
  printf -- '---\n\n'
  printf '%s\n' "$CONTENT"
} > "$FILE"

echo "Draft created: $FILE" >&2
echo "$FILE"
