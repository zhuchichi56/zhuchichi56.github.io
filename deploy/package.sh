#!/usr/bin/env bash
set -euo pipefail
project_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
mkdir -p "$project_root/dist"
tar -czf "$project_root/dist/hezhu-site.tar.gz" -C "$project_root" \
  index.html assets cv.pdf cv_cn.pdf 'He Zhu.pdf'
printf 'Deployment archive: %s\n' "$project_root/dist/hezhu-site.tar.gz"
