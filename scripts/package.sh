#!/usr/bin/env bash

set -eu -o pipefail

BASE="$(git rev-parse --show-toplevel)"

main() {
  local version="${1:-}"
  local p v

  if [[ -n "$version" ]]; then
    package "$version"
  else
    for p in charts/*; do
      v="$(basename "$p")"
      package "${v#v}"
    done
  fi
}

package() {
  local version="$1"
  local src="${BASE}/charts/v${version}"

  local chart base
  find "$src" -name Chart.yaml | while read -r chart; do
    base="$(dirname "$chart")"

    # Simplify chart names (remove istio- prefix)
    sed -i.bak -e 's/^name: istio-/name: /' "$chart"
    helm package --destination "${BASE}/packages" "$base"
  done

}

main "$@"
