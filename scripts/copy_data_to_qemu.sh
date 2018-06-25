#!/bin/bash
set -x

#Full path of directory or file to copy
DIRPATH=$1

#Next, mount your image to the directory
sudo mount -o loop $QEMU_IMG_FILE $MOUNT_DIR

sudo cp -r $DIRPATH $MOUNT_DIR/root/

sudo umount $MOUNT_DIR
