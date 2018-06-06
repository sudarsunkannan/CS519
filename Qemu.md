 # Launching a QEMU using a custom compiled kernel
 
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
