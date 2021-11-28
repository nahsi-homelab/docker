#! /usr/bin/env sh

generate() {
  if [[ $1 -gt 10240 ]]; then
    echo "Maximum file size if 10G, skipping"
    return
  fi
  echo "Generating ${SERVER_ROOT}/${1}.rand"
  dd if=/dev/urandom of=${SERVER_ROOT}/${1}.rand bs=1M count=${1} status=none
}

mkdir -p ${SERVER_ROOT}

for file in $FILES; do
  if [[ -f "${SERVER_ROOT}/${file}.rand" ]]; then
    echo "$file already exists at ${SERVER_ROOT}/${file}.rand, skipping"
    continue
  fi
  generate $file
done

exec caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
