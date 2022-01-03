#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/firecracker-microvm/firecracker/releases/download

dl()
{
    local app=$1
    local ver=$2
    local arch=$3
    local file="${app}-${ver}-${arch}.tgz"
    local url=$MIRROR/$ver/$file
    local lfile=$DIR/$file

    if [ ! -e $lfile ];
    then
        curl -sSL -f -o $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $arch $(sha256sum $lfile | awk '{print $1}')
}

dlver() {
    local ver=$1
    printf "  %s:\n" $ver
    dl firecracker $ver aarch64
    dl firecracker $ver x86_64
}

printf "firecracker_checksums:\n"
dlver v0.22.3
dlver v0.22.4
dlver v0.23.2
dlver v0.23.3
dlver v0.23.4
dlver v0.23.5
dlver v0.24.0
dlver v0.24.1
dlver v0.24.2
dlver v0.24.3
dlver v0.24.4
dlver v0.24.5
dlver v0.24.6
dlver v0.25.0
dlver v0.25.1
dlver ${1:-v0.25.2}
