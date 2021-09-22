#!/bin/bash
set -x

#If current mounted, unmount
sudo umount $MOUNT_DIR

#Compile the kernel
cd $KERN_SRC


#Enable the KVM mode in your kernel config file
#sudo make menuconfig
#sudo make x86_64_defconfig
#sudo make kvmconfig 

#Compile the kernel with '-j' (denotes parallelism) in sudo mode
make $PARA
make modules

 y="4.17.0"
   if [[ x$ == x ]];
  then
      echo You have to say a version!
      exit 1
   fi

sudo cp ./arch/x86/boot/bzImage $KERNEL/vmlinuz-$y
sudo cp System.map $KERNEL/System.map-$y
sudo cp .config $KERNEL/config-$y
#sudo update-initramfs -c -k $y
