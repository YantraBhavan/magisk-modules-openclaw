# Gemini Development Mandates - Yantra Development Suite

This file provides foundational context and architectural rules for AI agents working on this repository.

## 🏗️ Core Architecture: "Safe-Linker"
To ensure compatibility with Android 15+ and prevent bootloops, the following structure MUST be strictly maintained:

1. **Data Isolation:** All heavy binaries and shared libraries must reside in `/data/local/yantra/`.
   - **NEVER** put heavy libraries directly into `/system/lib64/` (this causes fatal bootloops).
   - **NEVER** use `/system/usr/lib/` (it is blocked by Android Linker Namespaces).

2. **Direct Linker Invocation:** Wrapper scripts in `/system/bin/` must invoke the system linker directly:
   ```bash
   exec /system/bin/linker64 /data/local/yantra/bin/binary_real "$@"
   ```
   This bypasses security namespace restrictions for tools like `python`, `clang`, and `cmake`.

3. **Wrappers:** `/system/bin/` should only contain tiny shell wrappers. No binaries should be placed here.

## 📦 Build & Packaging
1. **Large Files (>50MB):** Do NOT commit files larger than 50MB to Git. 
   - `libLLVM.so` and `libclang-cpp.so` must be excluded via `.gitignore`.
   - Use `build_zip.sh` to fetch these on-demand during the build process.

2. **Permissions:** All binaries must have `755` permissions. Use `customize.sh` within the Magisk module to ensure these are applied to the `/data/local/yantra/` path during installation.

3. **Unix Line Endings:** Ensure all wrapper scripts use actual Unix newlines (`
`). Avoid literal escape characters in production files.

## 🛠️ Tool-Specific Rules
- **Node.js:** Call `node_real` directly from wrappers to avoid recursive loops.
- **Python:** Always export `PYTHONHOME=/data/local/yantra` and `PYTHONPATH=/data/local/yantra/lib/python3.13` in the wrapper.
- **CMake:** Always export `CMAKE_ROOT=/data/local/yantra/share/cmake-4.2`.
- **Compilers:** Use `--driver-mode=g++` for the `g++` wrapper while calling `clang_real`.

## 📜 Philosophy
Keep it **LEAN**. Prefer natively compiled `Bionic libc` (Android NDK) builds over standard `glibc` Linux binaries. Avoid PRoot or Termux environments whenever possible to maximize performance.
