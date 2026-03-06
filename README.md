# Yantra Development Suite - Magisk Module

A professional-grade, systemless development environment for Android `aarch64` (ARM64). 

This suite provides a complete, natively compiled toolchain including **Node.js 24**, **Python 3.13**, and the **C/C++ Build Essentials** (Clang, Make, CMake).

## 🚀 The "Safe-Linker" Architecture
Unlike standard Magisk modules that inject libraries directly into `/system/lib64`, this suite uses a more robust approach designed for Android 15+:
- **Isolated Storage:** All binaries and libraries live in `/data/local/yantra/`, preventing bootloops and storage conflicts.
- **Direct Linker Invocation:** Wrapper scripts call the Android linker (`linker64`) directly. This bypasses the strict Linker Namespace security restrictions that usually break tools like `pip` and `clang` on modern Android.
- **No Bloat:** Uses native `Bionic libc` builds, avoiding the overhead of Termux or PRoot environments.

## 🛠️ Included Tools
- **Node.js:** v24.13.0 (LTS) with `npm`, `npx`, and `pnpm`.
- **Python:** v3.13.12 (LTS) with `pip`.
- **Compilers:** Clang, G++, GCC, CC (v21.1.8).
- **Build Tools:** Make (v4.4.1), CMake (v4.2.3), Binutils.

## 📦 How to Build and Install

### 1. Build the Full Module
Because GitHub has a 50MB-100MB file size limit, the largest libraries (`libLLVM.so` and `libclang-cpp.so`) are **not** stored in the git tree. You must build the full ZIP yourself:

```bash
# On your computer (Linux/macOS)
chmod +x build_zip.sh
./build_zip.sh
```
This will download the missing binaries and generate **`yantra-dev-suite-full.zip`**.

### 2. Installation
1. Transfer **`yantra-dev-suite-full.zip`** to your Android device.
2. Open the **Magisk App** -> **Modules** -> **Install from storage**.
3. Select the ZIP and install.
4. **Reboot your device** to activate the tools.

## 📋 Usage
After reboot, the following commands are available globally in any shell:
```bash
node -v
npm -v
pnpm -v
python -V
pip -V
clang -v
make -v
cmake --version
g++ --version
```

## 🔗 Credits
Developed and optimized by **Yantra Bhavan**.
