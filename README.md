# Magisk Modules by Yantra Bhavan

A collection of natively compiled, systemless development tools for Android `aarch64` (ARM64) devices. These modules are designed to be "lean," avoiding the overhead of full Linux distributions (like Termux or PRoot) by using Android's native `Bionic libc`.

## Available Modules

### 1. Node.js v24 (LTS)
A production-ready Node.js environment.
- **Node.js:** v24.13.0 (LTS)
- **NPM:** v11.11.0
- **NPX:** Included
- **Features:** Isolated dependencies in `/system/usr/lib/node` and automatic pathing via wrapper scripts.

### 2. Build Essentials
A complete native development toolchain.
- **Languages:** Python v3.13.12 (LTS) with `pip` v26.0.1.
- **Compilers:** Clang, G++, GCC, CC (v21.1.8).
- **Build Tools:** Make (v4.4.1), CMake (v4.2.3), Binutils.
- **Package Managers:** PNPM (v10.x integrated via Node.js).

---

## Installation Guide

### General Steps
1.  Download the source folder or the flashable `.zip` (if provided in Releases).
2.  Transfer the files to your Android device.
3.  Install via the **Magisk App** -> **Modules** -> **Install from storage**.
4.  **Reboot your device** to activate the tools.

### ⚠️ Important: Build Essentials Large Files
GitHub has a 50MB-100MB file size limit. To comply with this, the largest libraries (`libLLVM.so` and `libclang-cpp.so`) are **not** included in the git tree.

**If you are building the module from source, you MUST run the following before zipping/flashing:**
1.  Navigate to the `yantra-build-essentials-magisk` folder.
2.  Run the download script:
    ```bash
    chmod +x download_heavy_libs.sh
    ./download_heavy_libs.sh
    ```
This script will fetch the necessary binaries from the official mirrors and place them in the correct directory.

---

## Usage
After installation and reboot, the following commands will be available globally in your Android shell (ADB or Terminal Emulator):

```bash
# Node.js
node -v
npm -v

# Python & Pip
python --version
pip --version

# C/C++ Toolchain
clang --version
make --version
cmake --version

# Node Package Manager
pnpm --version
```

## Credits
Maintained and optimized by **Yantra Bhavan**.
