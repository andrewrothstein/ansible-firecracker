#!/usr/bin/env sh
DIR=~/Downloads
MIRROR=https://github.com/firecracker-microvm/firecracker/releases/download

dl()
{
    local app=$1
    local ver=$2
    local arch=$3
    local file="${app}-${ver}-${arch}"
    local url=$MIRROR/$ver/$file
    local lfile=$DIR/$file

    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi

    printf "      # %s\n" $url
    printf "      %s: sha256:%s\n" $arch $(sha256sum $lfile | awk '{print $1}')
}

dlver() {
    local ver=$1
    printf "  jailer:\n"
    printf "    %s:\n" $ver
    dl jailer $ver aarch64
    dl jailer $ver x86_64
    printf "  firecracker:\n"
    printf "    %s:\n" $ver
    dl firecracker $ver aarch64
    dl firecracker $ver x86_64
}

printf "firecracker_checksums:\n"
dlver ${1:-v0.23.1}
