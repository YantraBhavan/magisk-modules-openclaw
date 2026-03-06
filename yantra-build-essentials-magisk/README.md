# Build Essentials for Android (Magisk Module)

A natively compiled, systemless development toolchain for Android `aarch64` devices.

## Why this exists?
This module provides a "Build Essentials" kit for Android developers who want to compile native code, run Python scripts, or manage Node.js packages using `pnpm` without the overhead of a full Linux distribution like Termux.

## Features
- **C/C++ Toolchain:** `clang`, `g++`, `gcc`, `make`, `cmake`, `binutils` (v21.1.8 / v4.2.3)
- **Python:** v3.13.12 (LTS) with `pip` (v26.0.1)
- **PNPM:** Integrated via Node.js wrapper.
- **Isolated Libraries:** Shared dependencies are stored in `/system/usr/lib`.

### ⚠️ Note on Large Files
Due to GitHub's file size limits, the large libraries (`libLLVM.so` and `libclang-cpp.so`) are **not** included directly in this repository. 

**Before flashing, you must:**
1. Open a terminal in the module folder.
2. Run `./download_heavy_libs.sh`.
3. This will fetch the missing libraries from the official Termux repository.

## Installation
1. Download the `build-essentials-yantrabhavan.zip`.
2. Transfer the zip to your Android device.
3. Open the **Magisk App**.
4. Go to the **Modules** tab.
5. Tap **Install from storage** and select the zip.
6. **Reboot your device.**

## Usage
After rebooting, the following commands will be available globally:
```bash
python --version
pip --version
pnpm --version
clang --version
make --version
cmake --version
```

---
**Created by Yantra Bhavan**
