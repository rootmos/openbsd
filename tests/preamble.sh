OPENBSD=${OPENBSD-$(readlink -f "$0" | xargs dirname)/../openbsd}

FORCE=${FORCE-}
WORKDIR=${WORKDIR-}
while getopts "a:v:w:f-" OPT; do
    case $OPT in
        a) ARCH=$OPTARG ;;
        v) VERSION=$OPTARG ;;
        w) WORKDIR=$OPTARG ;;
        f) FORCE=1 ;;
        -) break ;;
        ?) exit 2 ;;
    esac
done
shift $((OPTIND-1))

if [ -z "$WORKDIR" ]; then
    WORKDIR=$(mktemp -d)
    trap 'rm -rf $WORKDIR' EXIT
elif [ -e "$WORKDIR" ]; then
    if [ -n "$FORCE" ]; then
        rm -rf "$WORKDIR"
    else
        echo 1>&2 "workdir already exists: $WORKDIR"
        exit 1
    fi
fi
echo 1>&2 "workdir: $WORKDIR"
mkdir -p "$WORKDIR"
WORKDIR=$(readlink -f "$WORKDIR")

cd "$WORKDIR"

export OPENBSD_SSH_KEY="$WORKDIR/id_ed25519"
export OPENBSD_SSH_PUBKEY="$OPENBSD_SSH_KEY.pub"
ssh-keygen -f "$OPENBSD_SSH_KEY" -t ed25519 -N ""
