boot() {
    dorker -i -v "$PWD:/openbsd" run
}

deps() {
    ./openbsd deps --install --arch=amd64
}

example() {
    rm -rf workdir
    WORKDIR=workdir tests/example -v 7.5 -a amd64
}

run() {
    cd workdir
    rm -f ssh
    export OPENBSD_SSH_KEY="$PWD/id_ed25519"
    export OPENBSD_SSH_PUBKEY="$OPENBSD_SSH_KEY.pub"
    ../openbsd --log=debug run --ssh-wrapper=ssh site.img
}

attach() {
    sudo -A docker exec -it "$(<.Dockerfile.container)" bash
}
