#!/bin/bash
set +x

#Launching QEMU
sudo qemu-system-x86_64 -kernel /boot/vmlinuz-$VER -hda $QEMU_IMG_FILE -append "root=/dev/sda rw" --enable-kvm --curses -m $QEMUMEM







