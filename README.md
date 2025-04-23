# clang20-for-Android
This repository contains [clang version 20](https://android.googlesource.com/toolchain/llvm-project/) for Android and the necessary files from the [Android NDK r29 beta1](https://developer.android.com/ndk/downloads)
to create binaries and libraries for Android on **arm64** CPUs.

See the file [README_clang20](https://github.com/bnsmb/clang20-for-Android/blob/main/sysroot/README_clang20) in the directory **./sysroot** in this repository for details

To create the tar file with the files necessary to install **clang 20** on the phone, clone or download this repository on a machine running the **Linux OS** and execute the commands

```
cd ./sysroot 
./create_clang20_tar_archive.sh
```

Then copy the tar file created by the script to the phone and unpack the tar file in the directory

**/data/local/tmp**

on the phone.


----

**Notes**

If you download the ZIP file with the files from this repository from github.com and unzip the ZIP file on the phone, note that the **unzip** command does not create correct symbolic links in some Android distributions. I therefore recommend unzipping the ZIP file with the **unzip** binary for Android from my homepage when doing this on your phone. This **unzip** binary should run on any Android and is available here:

[https://bnsmb.de/files/public/Android/binaries_for_arm64/unzip](https://bnsmb.de/files/public/Android/binaries_for_arm64/unzip)

and also here

[https://github.com/bnsmb/binaries-for-Android/raw/refs/heads/main/binaries/unzip](https://github.com/bnsmb/binaries-for-Android/raw/refs/heads/main/binaries/unzip)

To check, if **unzip** has created correct symbolic links, check if the entries in the directory

**./clang20-for-Android-main/sysroot/usr/clang20/lib/clang/20/lib/**

are symbolic links after after you have uncompressed the ZIP file.

----
Please be aware that this repository does **NOT** contain a complete toolchain for compiling programs on Android. It's recommended to use the files from this repository as add-on for the **clang19 toolchain** from this repository:

[https://github.com/bnsmb/clang19_toolchain_for_android](https://github.com/bnsmb/clang19_toolchain_for_android)

