# 基金持仓仪表盘（加密站点）
- data/holdings.json：snapshots 按日期（YYYY-MM-DD）为键，每天截图追加一条；≥2 天自动出现"每日走势"图。
- src/template.html：页面模板（__DATA__ 会在构建时替换为数据）。
- ./scripts/build.sh → dist/index.html（AES 加密，staticrypt），只发布 dist/。
- .password / .staticrypt.json（盐）不要提交；更换密码后要重新构建。
