#!/bin/bash
# 用法: ./scripts/build.sh   → dist/index.html (加密, 可公开发布)
set -e; cd "$(dirname "$0")/.."
python3 -c "import json;t=open('src/template.html').read();d=json.dumps(json.load(open('data/holdings.json')),ensure_ascii=False);open('build-plain.html','w').write(t.replace('__DATA__',d))"
npx -y staticrypt@3 build-plain.html -p "$(cat .password)" -d dist --short --remember 30 --template-title "基金仪表盘" --template-instructions "请输入密码" --template-button "解锁" --template-placeholder "密码" --template-remember "30 天内记住我" >/dev/null
mv dist/build-plain.html dist/index.html; rm -f build-plain.html; echo "built dist/index.html"
