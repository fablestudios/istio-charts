#!/usr/bin/env bash

set -eu -o pipefail

BASE="$(git rev-parse --show-toplevel)"
VERSIONS=(1.9.6 1.10.2)

main() {
  local version="${1:-}"

  if [[ -n "$version" ]]; then
    fetch "$version"
  else
    for version in "${VERSIONS[@]}"; do
      fetch "$version"
    done
  fi
}

fetch() {
  local version="$1"
  local url="https://github.com/istio/istio/releases/download/${version}/istio-${version}-linux-arm64.tar.gz"

  local tar='tar'
  if command -v gtar > /dev/null 2> /dev/null; then
    tar='gtar'
  fi

  local filter="istio-${version}/manifests/charts"
  local out="${BASE}/charts/v${version}"
  rm -fr "$out"
  mkdir -p "$out"

  echo >&2 "Fetching ${url}"
  curl -fsSL "$url" | "$tar" -xz -C "$out" --strip-components=3 "$filter"
}

main "$@"
