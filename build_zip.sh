#!/bin/bash
# Yantra Dev Suite - Full Module Builder
# This script downloads heavy binaries and packages the flashable Magisk ZIP.

set -e

MOD_NAME="yantra-dev-suite"
OUTPUT_ZIP="yantra-dev-suite-full.zip"
LIB_DIR="$MOD_NAME/files/lib"

echo "-----------------------------------------------"
echo "Yantra Development Suite - Magisk Module Builder"
echo "-----------------------------------------------"

# 1. Ensure directories exist
mkdir -p "$LIB_DIR"

# 2. Download and Extract Heavy Libraries (>50MB)
# These are hosted on Termux mirrors to ensure native Android compatibility.

if [ ! -f "$LIB_DIR/libLLVM.so" ]; then
    echo "[*] Downloading libLLVM.so (127MB)..."
    curl -L -o libllvm.deb https://packages-cf.termux.dev/apt/termux-main/pool/main/libl/libllvm/libllvm_21.1.8-1_aarch64.deb
    ar x libllvm.deb data.tar.xz
    tar -xJf data.tar.xz ./data/data/com.termux/files/usr/lib/libLLVM.so -O > "$LIB_DIR/libLLVM.so"
    rm libllvm.deb data.tar.xz
    echo "[+] libLLVM.so integrated."
else
    echo "[i] libLLVM.so already present."
fi

if [ ! -f "$LIB_DIR/libclang-cpp.so" ]; then
    echo "[*] Downloading libclang-cpp.so (60MB)..."
    curl -L -o clang.deb https://packages-cf.termux.dev/apt/termux-main/pool/main/c/clang/clang_21.1.8-1_aarch64.deb
    ar x clang.deb data.tar.xz
    tar -xJf data.tar.xz ./data/data/com.termux/files/usr/lib/libclang-cpp.so -O > "$LIB_DIR/libclang-cpp.so"
    rm clang.deb data.tar.xz
    echo "[+] libclang-cpp.so integrated."
else
    echo "[i] libclang-cpp.so already present."
fi

# 3. Final Permissions Check
echo "[*] Finalizing permissions..."
chmod -R 755 "$MOD_NAME/system/bin/"
find "$LIB_DIR" -name "*.so*" -exec chmod 755 {} +

# 4. Create the Flashable ZIP
echo "[*] Packaging $OUTPUT_ZIP..."
rm -f "$OUTPUT_ZIP"
(cd "$MOD_NAME" && zip -ry "../$OUTPUT_ZIP" *)

echo "-----------------------------------------------"
echo "SUCCESS: $OUTPUT_ZIP is ready to flash!"
echo "-----------------------------------------------"
