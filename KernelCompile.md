## Compiling Linux Kernel (in Ubuntu)
 There is a helpful [How-To Page](https://kernelnewbies.org/KernelBuild) 
 and [this one](https://medium.freecodecamp.org/building-and-installing-the-latest-linux-kernel-from-source-6d8df5345980) 
 for you to reference at. 
```
$ sudo apt-get update
$ sudo apt-get install git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc
```

* Downloading the newest kernel
```
$ wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.17.tar.xz`
$ tar xf linux-4.17.tar.xz
$ cd linux-4.17/
```

* Copy the config file from your computer
```
$ cp /boot/config-4.4.0-116-generic .config`
$ sudo make -j 40  
$ sudo make modules_install -j 40 
$ sudo make install -j 40
```

* Then you want to reboot your computer. 
```
$ sudo reboot
```

* Then mount your SSD again.
```
$ sudo mount /dev/sdc1 ~/SSD
```

* Check your current kernel version.
```
$ uname -r
```

* To make changes in  grub.cfg:
```
$ vi /boot/grub/grub.cfg
```

### Compiling only a directory

Assume you are developing a new file system (NEWFS); You want to quickly compile your NEWFS and check (and fix) if there are some errors; you can use the below command before fully compiling the kernel discussed in the previous steps
```
$ make SUBDIRS=fs/NEWFS
```





