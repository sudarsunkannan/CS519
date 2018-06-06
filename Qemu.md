 # Launching a QEMU using a custom compiled kernel
 
 #### Install Quemu
 $ sudo apt-get install qemu

 $ ssh -X  user@hostname   (note the -X which specifies ssh with graphical mode)

 #### Now create a disk for your virtual machine for 4GB
 $ qemu-img create qemu-image.img 4g

#### Now format your disk with some file system; ext4 in this example
$ mkfs.ext4 qemu-image.img    

#### Now create a mount point directory for your image file
$ mkdir mountdir

#### Next, mount your image to the directory
$ sudo mount -o loop qemu-image.img mountdir

#### Install debootstrap
$ sudo apt-get install debootstrap

#### Now get the OS release version using 
$ cat /etc/os-release

#### Now add all the boot files to your custom disk so that the qemu OS can use it for launching the kernel
and specify the OS_RELEASE_NAME from the previous command 
$ sudo debootstrap --arch amd64 "OS_RELEASE_NAME" mountdir

#### Unmount your image file from the directory.
$ sudo umount mountdir
