#!/usr/bin/env sh
VER=${1:-v0.19.0}
DIR=~/Downloads
MIRROR=https://github.com/firecracker-microvm/firecracker/releases/download/$VER

dl()
{
    APP=$1
    FILE=$APP-$VER$SUFFIX
    URL=$MIRROR/$FILE
    LFILE=$DIR/$FILE

    if [ ! -e $LFILE ];
    then
        wget -q -O $LFILE $URL
    fi

    printf "    # %s\n" $URL
    printf "    %s: sha256:%s\n" $VER `sha256sum $LFILE | awk '{print $1}'`
}

dl firecracker
dl jailer
