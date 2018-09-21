#!/bin/bash
set -x

#Launching QEMU
sudo qemu-system-x86_64 -kernel $KERNEL/vmlinuz-$VER -hda $QEMU_IMG_FILE -append "root=/dev/sda rw" --curses -m $QEMUMEM

set +x







