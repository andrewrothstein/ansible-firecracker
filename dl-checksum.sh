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

dlver ${1:-v1.2.0}
