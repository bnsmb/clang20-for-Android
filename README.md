# clang20-for-Android
This repository contains [clang version 20](https://android.googlesource.com/toolchain/llvm-project/) for Android and the necessary files from the [Android NDK r29 beta1](https://developer.android.com/ndk/downloads)
to create binaries and libraries for Android on **arm64** CPUs.

See the file [README_clang20](https://github.com/bnsmb/clang20-for-Android/blob/main/sysroot/README_clang20) in the directory **./sysroot** in this repository for details

To create the tar file with the **clang 20**, clone or download this repository on a machine running the Linux OS and execute the commands

```
cd ./sysroot 
./create_clang20_tar_archive.sh
```

Then copy the tar file created by the script to the phone and unpack the tar file in the directory

**/data/local/tmp**

on the phone.

