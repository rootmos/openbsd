#!/bin/bash

set -o nounset -o pipefail -o errexit

UPSTREAM=${UPSTREAM-https://cdn.openbsd.org/pub/OpenBSD}

VERSION=$1
SHORT_VERSION=$(tr -d '.' <<< "$VERSION")

if [ -z "${WORKDIR-}" ]; then
    WORKDIR=$(mktemp -d)
    trap 'rm -rf $WORKDIR' EXIT
fi
WORKDIR="$WORKDIR/$VERSION"
mkdir -p "$WORKDIR"
WORKDIR=$(readlink -f "$WORKDIR")
echo 1>&2 "workdir: $WORKDIR"
cd "$WORKDIR"

BASE_URL="$UPSTREAM/$VERSION"
PUBKEY="$WORKDIR/pub"
if [ ! -e "$PUBKEY" ]; then
    PUBKEY_URL="$BASE_URL/openbsd-$SHORT_VERSION-base.pub"
    echo 1>&2 "$PUBKEY_URL -> $PUBKEY"
    wget -O "$PUBKEY" "$PUBKEY_URL"
fi

ARCHs=(amd64 i386)
for arch in "${ARCHs[@]}"; do
    SHA256="$WORKDIR/SHA256.$arch"
    if [ ! -e "$SHA256" ]; then
        wget -O "$SHA256" "$BASE_URL/$arch/SHA256"
    fi

    if [ ! -e "$SHA256.sha256" ]; then
        sha256sum "$SHA256" | cut -d' ' -f1 >"$SHA256.sha256"
    fi
done

cat <<EOF | tee "$WORKDIR/version.py"
Version.add(
    version = "$VERSION",
    pub = lines(
EOF
sed 's/^/        "/' <"$PUBKEY" | sed 's/$/",/' | tee -a "$WORKDIR/version.py"
cat <<EOF | tee -a "$WORKDIR/version.py"
    ),
    archs = {
EOF
for arch in "${ARCHs[@]}"; do
    cat <<EOF | tee -a "$WORKDIR/version.py"
        "$arch": "$(<"$WORKDIR/SHA256.$arch.sha256")",
EOF
done
cat <<EOF | tee -a "$WORKDIR/version.py"
    },
)
EOF
