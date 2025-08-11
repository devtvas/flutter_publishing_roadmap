#!/usr/bin/env bash
set -e

APP_NAME="Your App"
BUNDLE_ANDROID="com.your.app"
BUNDLE_IOS="com.your.app"
TRACK="internal"
ROLLOUT="0.1"

while [[ "$#" -gt 0 ]]; do
  case $1 in
    --app-name) APP_NAME="$2"; shift ;;
    --bundle-android) BUNDLE_ANDROID="$2"; shift ;;
    --bundle-ios) BUNDLE_IOS="$2"; shift ;;
    --track) TRACK="$2"; shift ;;
    --rollout) ROLLOUT="$2"; shift ;;
    *) echo "Parâmetro desconhecido: $1" ; exit 1 ;;
  esac
  shift
done

echo ">> Aplicando substituições:"
echo "   APP_NAME=$APP_NAME"
echo "   BUNDLE_ANDROID=$BUNDLE_ANDROID"
echo "   BUNDLE_IOS=$BUNDLE_IOS"
echo "   TRACK=$TRACK"
echo "   ROLLOUT=$ROLLOUT"

# macOS (BSD) sed usa -i '' para edição inline sem backup
SED_INPLACE=(-i '')

apply_replace() {
  local pattern="$1"; shift
  local replace="$1"; shift
  local files=("$@")
  for f in "${files[@]}"; do
    [[ -f "$f" ]] || continue
    sed "${SED_INPLACE[@]}" "s|${pattern}|${replace}|g" "$f"
  done
}

FILES=$(find docs -type f -name "*.md" -o -name "mkdocs.yml")

# Substituições principais
apply_replace "Your App" "$APP_NAME" $FILES
apply_replace "com.your.app" "$BUNDLE_ANDROID" $FILES
apply_replace "PRODUCT_BUNDLE_IDENTIFIER = com.your.app" "PRODUCT_BUNDLE_IDENTIFIER = ${BUNDLE_IOS}" $FILES
apply_replace "track: \\\"production\\\"" "track: \\\"${TRACK}\\\"" $FILES
apply_replace "rollout: 0\\.1" "rollout: ${ROLLOUT}" $FILES

echo ">> OK! Revise as mudanças via git diff antes de commitar."