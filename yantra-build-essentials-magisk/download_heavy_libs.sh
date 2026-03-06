#!/system/bin/sh
# This script downloads heavy libraries that exceed GitHub's 100MB limit.
# It is meant to be run on the Android device or during module preparation.

LIB_DIR="system/usr/lib"
mkdir -p "$LIB_DIR"

echo "Downloading libLLVM.so (127MB)..."
# Using a direct deb download and extraction to ensure native Android compatibility
curl -L -O https://packages-cf.termux.dev/apt/termux-main/pool/main/libl/libllvm/libllvm_21.1.8-1_aarch64.deb
ar x libllvm_21.1.8-1_aarch64.deb data.tar.xz
tar -xJf data.tar.xz ./data/data/com.termux/files/usr/lib/libLLVM.so -O > "$LIB_DIR/libLLVM.so"
rm libllvm_21.1.8-1_aarch64.deb data.tar.xz

echo "Downloading libclang-cpp.so (60MB)..."
curl -L -o "clang.deb" https://packages-cf.termux.dev/apt/termux-main/pool/main/c/clang/clang_21.1.8-1_aarch64.deb
ar x clang.deb data.tar.xz
tar -xJf data.tar.xz ./data/data/com.termux/files/usr/lib/libclang-cpp.so -O > "$LIB_DIR/libclang-cpp.so"
rm clang.deb data.tar.xz

chmod 644 "$LIB_DIR"/*.so
echo "Done!"
