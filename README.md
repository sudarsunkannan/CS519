# NVM

### Compiling and launching QEMU 

From the source directory set the environment variables.
trusty specifies the host systems linux version/codename 
Pass your own OS version name.

In scripts/setvars.sh, set the path of your kernel source in
"export KERN_SRC=KERNELSOURCEPATH

```
$ source scripts/setvars.sh "trusty"   
```

Create the QEMU IMAGE and exit.  If prompted (y,n), enter yes
```
$ scripts/qemu_create.sh  
//Install libraries
$ sudo apt-get install build-essential vim
$ exit
```

Install the 4.17 kernel with QEMU support and copy kernel files to boot directory
```
$  scripts/compile_kern.sh
```

Now launch the QEMU
```
$  scripts/run_qemu.sh
```

### Compiling only the kernel
```
$ source scripts/setvars.sh "trusty"
$ scripts/compile_kern.sh
```

### Copying data from your host to QEMU
This scripts copies directories/files from your host machine to QEMU's root folder
```
$ scripts/copy_data_to_qemu.sh FULL_PATH_OF_DIRECTORY_TO_COPY
```


