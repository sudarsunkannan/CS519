 # Launching a QEMU using a custom compiled kernel
 
 ### Preparing the image file
 
 1. Install Quemu
 ````
 $ sudo apt-get install qemu
 ````
 2. SSH with graphical mode (using -X)
  ````
 $ ssh -X  user@hostname   
 ````

 3. Now create a disk for your virtual machine for 4GB
 ````
 $ qemu-img create qemu-image.img 4g
````

4. Now format your disk with some file system; ext4 in this example
````
$ mkfs.ext4 qemu-image.img    
````

5. Now create a mount point directory for your image file
````
$ mkdir mountdir
````

6. Next, mount your image to the directory
````
$ sudo mount -o loop qemu-image.img mountdir
````

7. Install debootstrap
````
$ sudo apt-get install debootstrap
````

8. Now get the OS release version using 
````
$ cat /etc/os-release
````

9. Now add all the boot files to your custom disk so that the qemu OS can use it for launching the kernel
and specify the OS_RELEASE_NAME from the previous command 
````
$ sudo debootstrap --arch amd64 "OS_RELEASE_NAME" mountdir
````
10. Unmount your image file from the directory.
````
$ sudo umount mountdir
````

### Compiling the kernel

1. Go to your linux source directory
````
$ cd linux_src
````
2. Enable the KVM mode in your kernel config file
````
make x86_64_defconfig
make kvmconfig
````
3. Compile the kernel with '-j' (denotes parallelism) in sudo mode
````
make -j40
make modules
make modules_install
make install
````
4. Time to launch your quemu image; the kernel must point to your compiled kernel, hda must point to the quemu disk
````
qemu-system-x86_64 -kernel /boot/vmlinuz-VERSION -hda qemu-image.img -append "root=/dev/sda console=ttyS0" --enable-kvm -nographic
````




