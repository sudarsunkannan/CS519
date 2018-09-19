#!/bin/bash
set -x

#Pass the release name
export BASE=$PWD
export OS_RELEASE_NAME=$1
export QEMU_IMG=$BASE
export KERN_SRC=$BASE/linux-4.17.0
#CPU parallelism
export PARA="-j40"
export VER="4.17.0"
export QEMU_IMG_FILE=$PWD/qemu-image.img
export MOUNT_DIR=$PWD/mountdir
export QEMUMEM="4096M"

mkdir $BASE/kernel

set +x
