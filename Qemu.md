 # Launching a QEMU using a custom compiled kernel
 
 ### Preparing the image file
 
 Install Quemu
 ````
 $ sudo apt-get install qemu
 ````

SSH with graphical mode (using -X)
  ````
 $ ssh -X  user@hostname   
 ````

Now create a disk for your virtual machine for 4GB
 ````
 $ qemu-img create qemu-image.img 4g
````

Now format your disk with some file system; ext4 in this example
````
$ mkfs.ext4 qemu-image.img    
````

Now create a mount point directory for your image file
````
$ mkdir mountdir
````

Next, mount your image to the directory
````
$ sudo mount -o loop qemu-image.img mountdir
````

Install debootstrap
````
$ sudo apt-get install debootstrap
````

Now get the OS release version using 
````
$ cat /etc/os-release
````

Now add all the boot files to your custom disk so that the qemu OS can use it for launching the kernel
and specify the OS_RELEASE_NAME from the previous command 
````
$ sudo debootstrap --arch amd64 "OS_RELEASE_NAME" mountdir
````

Time to add a new user to the QEMU image; First, change your root directory to your mouted image.
````
$ sudo chroot mountdir
````

You should see something like this
````
root@node-0:/#
````

Now add a username and password for your QEMU image which you will be using when booting into your VM
````
 $ useradd -m USERNAME
 $ passwdd USERNAME
````

Now install all your required packages; lets start with vim and build_esstentials.
````
$ sudo apt-get install vim
$ sudo apt-get install build-essential
````
Enable sudo perimission for your username by adding the following line in the 
/etc/sudoers file and save
````
root    ALL=(ALL:ALL) ALL  // This line should already be there
USERNAME ALL=(ALL:ALL) ALL
````
You are all set. Now unmount your image file from the directory.
````
$ exit
$ sudo umount mountdir
````

### Compiling the kernel

Go to your linux source directory
````
$ cd linux_src
````
Enable the KVM mode in your kernel config file
````
make x86_64_defconfig
make kvmconfig
````
Compile the kernel with '-j' (denotes parallelism) in sudo mode
````
make -j40
make modules
make modules_install
make install
````

### Launching QEMU

Time to launch your quemu image; the kernel must point to your compiled kernel, hda must point to the quemu disk
````
qemu-system-x86_64 -kernel /boot/vmlinuz-VERSION -hda qemu-image.img -append "root=/dev/sda" --enable-kvm 
````
QEMU offers different methods to avoid graphics by directly showing console. Figure out these details online :)





