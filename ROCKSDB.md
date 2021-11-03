#### 1. You can clone RocksDB from the following repo
```
https://github.com/facebook/rocksdb
```

### 2. Installing Perf tool
First go to the source folder of your linux kernel that you are compiling for homeworks and navigate to the perf folder
```
$ cd linux-source-path/tools/perf  //you should substitute  linux-source-path with the path in your system
$ make //this will comile perf
```

#### 3. You can compile RocksDB using the following command
```
sudo apt update
sudo apt-get install -y libgflags2.2 libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev libzstd-dev
make clean
DEBUG_LEVEL=0 make db_bench -j$(nproc) //nproc should be number of processors available in the system
```

#### 4. Running DBBench without perf
DBbench is the workload that we will use to analyze RocksDB. You should find db_bench executable in the rocksdb folder
```
$ mkdir DATA
$ ./db_bench --db=DATA --value_size=4096 --wal_dir=DATA/WAL_LOG --sync=0 --key_size=100 --write_buffer_size=67108864 --threads=4 --num=200000 --benchmarks=fillrandom,readrandom --use_existing_db=0 --threads=4
```

#### 5. Running DBBench with perf
```
$ linux-source-path/tools/perf/perf record -- ./db_bench --db=DATA --value_size=4096 --wal_dir=DATA/WAL_LOG --sync=0 --key_size=100 --write_buffer_size=67108864 --threads=4 --num=200000 --benchmarks=fillrandom,readrandom --use_existing_db=0 --threads=4 //again, you should substitute  linux-source-path with the path in your system
```

#### 6. Looking at the report
```
$ linux-source-path/tools/perf/perf report
```
#### 7. Learn more about perf here
```
https://www.brendangregg.com/perf.html
```

