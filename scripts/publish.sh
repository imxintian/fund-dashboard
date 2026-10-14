#!/bin/bash
# 构建并发布加密页面到 gh-pages 分支（需要环境变量 GH_TOKEN）
set -e; cd "$(dirname "$0")/.."
./scripts/build.sh
T=$(mktemp -d); cp dist/index.html "$T/"; touch "$T/.nojekyll"
cd "$T"; git init -q -b gh-pages; git add -A
git -c user.name=imxintian -c user.email=imxintian@users.noreply.github.com commit -qm "publish $(date +%F_%T)"
git -c credential.helper='!f(){ echo username=x-access-token; echo "password=$GH_TOKEN"; }; f' push -qf https://github.com/imxintian/fund-dashboard.git gh-pages
rm -rf "$T"; echo "published: https://imxintian.github.io/fund-dashboard/"
